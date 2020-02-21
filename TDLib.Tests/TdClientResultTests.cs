using System;
using System.Threading.Tasks;
using TdLib;
using Xunit;

namespace TDLib.Tests
{
    public class TdClientResultTests
    {
        [Fact]
        public async Task Execute_WhenEmptyCallPassed_ReturnsOk()
        {
            using (var client = new TdClient())
            {
                var result = await client.TestCallEmptyAsync();
                
                Assert.NotNull(result);
            }
        }

        [Fact]
        public async Task Execute_WhenStringPassed_ReturnsTheSameString()
        {
            using (var client = new TdClient())
            {
                var arg = "test";
                var result = await client.TestCallStringAsync(arg);
                
                Assert.NotNull(result);
                Assert.NotNull(result.Value);
                Assert.Equal(arg, result.Value);
            }
        }
        
        [Fact]
        public async Task Execute_WhenByteArrayPassed_ReturnsTheSameByteArray()
        {
            using (var client = new TdClient())
            {
                var arg = new byte[] {1, 2, 3};
                var result = await client.TestCallBytesAsync(arg);
                
                Assert.NotNull(result);
                Assert.NotNull(result.Value);
                Assert.Equal(arg, result.Value);
            }
        }

        [Fact]
        public async Task Execute_WhenIntArrayPassed_ReturnsTheSameArray()
        {
            using (var client = new TdClient())
            {
                var arg = new [] {1, 2, 3};
                var result = await client.TestCallVectorIntAsync(arg);
                
                Assert.NotNull(result);
                Assert.NotNull(result.Value);
                Assert.Equal(arg, result.Value);
            }
        }

        [Fact]
        public async Task Execute_WhenStringArrayPassed_ReturnsTheSameArray()
        {
            using (var client = new TdClient())
            {
                var arg = new[] {"foo", "bar"};
                var result = await client.TestCallVectorStringAsync(arg);
                
                Assert.NotNull(result);
                Assert.NotNull(result.Value);
                Assert.Equal(arg, result.Value);
            }
        }
    }
}