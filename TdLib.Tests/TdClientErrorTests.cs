// SPDX-FileCopyrightText: 2024 tdsharp contributors <https://github.com/egramtel/tdsharp>
//
// SPDX-License-Identifier: MIT

using System.Threading.Tasks;
using Xunit;

namespace TdLib.Tests
{
    public class TdClientErrorTests
    {
        [Fact]
        public async Task Execute_WhenErrorExpected_ThrowsTdException()
        {
            using (var client = new TdClient())
            {
                TdException exception = null;
                
                try
                {
                    await client.TestReturnErrorAsync(new TdApi.Error
                    {
                        Code = 0,
                        Message = "Error"
                    });
                }
                catch (TdException e)
                {
                    exception = e;
                }
                
                Assert.NotNull(exception);
                Assert.NotNull(exception.Error);
            }
        }
    }
}