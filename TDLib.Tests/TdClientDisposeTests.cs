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
            private readonly ManualResetEventSlim _allowBeforeStartClosing;
            public readonly ManualResetEventSlim IsBlockedInBeforeStartClosing = new ManualResetEventSlim();
            
            public BlockableTdClient(ManualResetEventSlim allowBeforeStartClosing)
            {
                _allowBeforeStartClosing = allowBeforeStartClosing;
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
            {
                // 1. Inject a blocking callback into the Receiver thread so the update from the Close command won't be
                //    received by the client in time.
                var client = new BlockableTdClient(receiverUnblocked)
                {
                    TimeoutToClose = TimeSpan.FromSeconds(1.0)
                };
                
                // 2. This test requires a constant observer to be on the client, so it doesn't buffer the incoming
                //    events.
                client.UpdateReceived += delegate { };
                
                // 3. Send a Close command call into the client. 
                _ = client.ExecuteAsync(new TdApi.Close());
                
                // 4. Now call the Dispose method.
                var disposeParallel = Task.Run(() => client.Dispose());
                
                // 5. Wait for a thread to be inside of the closing procedure.
                client.IsBlockedInBeforeStartClosing.Wait();
                
                // 6. Now unblock the receiver thread.
                receiverUnblocked.Set();
                
                await disposeParallel; // could produce a timeout error in case of a race condition
            }
        }
    }
}