using System;
using System.Threading;
using System.Threading.Tasks;
using TdLib;
using Xunit;

namespace TDLib.Tests
{
    public class TdClientDisposeTests
    {
        [Fact]
        public async Task Dispose_WhenCalled_DoesNotThrowException()
        {
            var client = new TdClient();
            
            // do some stuff
            await client.ExecuteAsync(new TdApi.TestCallEmpty());

            // dispose client from other thread
            await Task.Run(() => client.Dispose());
        }
        
        [Fact]
        public async Task Dispose_WhenCalledTwice_DoesNotThrowException()
        {
            var client = new TdClient();
            
            // do some stuff
            await client.ExecuteAsync(new TdApi.TestCallEmpty());

            // dispose client from other thread
            await Task.Run(() => client.Dispose());
            
            // and then from main thread
            client.Dispose();
        }

        [Fact]
        public async Task Dispose_WhenCalledOnDifferentClients_DoesNotThrowException()
        {
            using (var client1 = new TdClient())
            using (var client2 = new TdClient())
            using (var client3 = new TdClient())
            {
                // do some stuff
                await client1.ExecuteAsync(new TdApi.TestCallEmpty());
                await client2.ExecuteAsync(new TdApi.TestCallEmpty());
                await client3.ExecuteAsync(new TdApi.TestCallEmpty());
            }
        }
    }
}