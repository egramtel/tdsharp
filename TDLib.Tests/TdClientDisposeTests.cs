using System;
using System.Threading;
using System.Threading.Tasks;
using TdLib;
using Xunit;

namespace TDLib.Tests
{
    public class TdClientDisposeTests
    {
        private class BlockableTdClient : TdClient
        {
            private readonly ManualResetEventSlim _allowBeforeClosed;
            private readonly ManualResetEventSlim _allowBeforeStartClosing;
            public readonly ManualResetEventSlim IsBlockedInBeforeClosed = new ManualResetEventSlim();
            public readonly ManualResetEventSlim IsBlockedInBeforeStartClosing = new ManualResetEventSlim();
            
            public BlockableTdClient(ManualResetEventSlim allowBeforeClosed, ManualResetEventSlim allowBeforeStartClosing)
            {
                _allowBeforeClosed = allowBeforeClosed;
                _allowBeforeStartClosing = allowBeforeStartClosing;
            }

            private protected override void BeforeClosed()
            {
                IsBlockedInBeforeClosed.Set();
                _allowBeforeClosed.Wait();
            }

            private protected override void BeforeStartClosing()
            {
                IsBlockedInBeforeStartClosing.Set();
                _allowBeforeStartClosing.Wait();
            }
        }
        
        [Fact]
        public async Task RaceConditionInDisposeCase()
        {
            using (var receiverUnblocked = new ManualResetEventSlim(false))
            using (var closingUnblocked = new ManualResetEventSlim(false))
            {
                // 1. Inject a blocking callback into the Receiver thread so the update from the Close command won't be
                //    received by the client in time.
                var client = new BlockableTdClient(receiverUnblocked, closingUnblocked)
                {
                    TimeoutToClose = TimeSpan.FromSeconds(1.0)
                };
                
                // This test require a constant observer to be on the client, so it doesn't buffer the incoming events.
                client.UpdateReceived += delegate { };
                
                // 2. Send a Close command call into the client. 
                _ = client.ExecuteAsync(new TdApi.Close());
                
                // 3. Wait for the client to be blocked *before* _isClosed is flipped.
                client.IsBlockedInBeforeClosed.Wait();

                // 4. Now call the Dispose method. It will check the _isClosed field (which hasn't been switched to true
                //    yet), and then call the Close command (again).
                var disposeParallel = Task.Run(() => client.Dispose());
                
                // 5. Wait for thread to check the _isClosed:
                client.IsBlockedInBeforeStartClosing.Wait();
                
                // 6. Now, after the _isClosed check happened, we may allow the receiver thread to unblock.
                receiverUnblocked.Set();
                
                // 7. And let's make sure the received queue is empty before proceeding:
                Thread.Sleep(100);
                closingUnblocked.Set();
                
                await disposeParallel; // will produce a timeout error in case of a race condition
            }
        }
    }
}