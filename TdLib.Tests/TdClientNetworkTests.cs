// SPDX-FileCopyrightText: 2024 tdsharp contributors <https://github.com/egramtel/tdsharp>
//
// SPDX-License-Identifier: MIT

using System.Threading.Tasks;
using Xunit;

namespace TdLib.Tests
{
    public class TdClientNetworkTests
    {
        [Fact(Skip = "Networking is slow")]
        public async Task Execute_WhenNetworkCallIsMade_ReturnsOk()
        {
            using (var client = new TdClient())
            {
                var result = await client.TestNetworkAsync();
                
                Assert.NotNull(result);
            }
        }
    }
}