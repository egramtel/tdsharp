// SPDX-FileCopyrightText: 2024 tdsharp contributors <https://github.com/egramtel/tdsharp>
//
// SPDX-License-Identifier: MIT

using System.Threading.Tasks;

namespace TdLib
{
    public static partial class TdApi
    {
        /// <summary>
        /// Base class for API client
        /// </summary>
        public abstract partial class Client : Object,IClient
        {
            public abstract void Send<TResut>(Function<TResut> function);

            public abstract TResult Execute<TResult>(Function<TResult> function)
                where TResult : Object;

            public abstract Task<TResult> ExecuteAsync<TResult>(Function<TResult> function)
                where TResult : Object;
        }
        public partial interface IClient
        {
            public void Send<TResut>(Function<TResut> function);

            public TResult Execute<TResult>(Function<TResult> function)
                where TResult : Object;

            public Task<TResult> ExecuteAsync<TResult>(Function<TResult> function)
                where TResult : Object;
        }
    }

}
