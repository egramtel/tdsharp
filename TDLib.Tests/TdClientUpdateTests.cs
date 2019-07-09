using System.Threading.Tasks;
using TdLib;
using Xunit;

namespace TDLib.Tests
{
    public class TdClientUpdateTests
    {
        [Fact]
        public async Task Execute_WhenUpdateTriggered_FiresEvent()
        {
            using (var client = new TdClient())
            {
                var tcs = new TaskCompletionSource<TdApi.Update>();

                void Handler(object sender, TdApi.Update update)
                {
                    tcs.SetResult(update);
                    client.UpdateReceived -= Handler;
                }

                client.UpdateReceived += Handler; 

#pragma warning disable 4014
                client.ExecuteAsync(new TdApi.TestUseUpdate());
#pragma warning restore 4014
                
                var result = await tcs.Task;
                
                Assert.NotNull(result);
            }
        }
    }
}