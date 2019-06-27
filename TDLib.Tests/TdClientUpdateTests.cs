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
                client.UpdateReceived += (sender, update) =>
                {
                    tcs.SetResult(update);
                };

#pragma warning disable 4014
                client.ExecuteAsync(new TdApi.TestUseUpdate());
#pragma warning restore 4014
                
                var result = await tcs.Task;
                
                Assert.NotNull(result);
            }
        }
    }
}