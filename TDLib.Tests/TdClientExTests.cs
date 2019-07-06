using System;
using TdLib;
using Xunit;

namespace TDLib.Tests
{
    public class TdClientExTests
    {
        [Fact]
        public void WaitForUpdateWorksProperly()
        {
            using (var client = new TdClient())
            {
                var result = client.WaitForUpdate(
                    update => update.IsAuthorizationStateClosed(),
                    TimeSpan.FromMinutes(1.0));

                Assert.NotNull(result);
            }
        }
    }
}