using System.Threading.Tasks;
using TdLib;
using Xunit;

namespace TDLib.Tests
{
    public class TdClientNetworkTests
    {
        [Fact(Skip = "Networking is slow")]
        public async Task Execute_WhenNetworkCallIsMade_ReturnsOk()
        {
            using (var client = new TdClient())
            {
                var result = await client.ExecuteAsync(new TdApi.TestNetwork());
                
                Assert.NotNull(result);
            }
        }
    }
}