using System.Threading.Tasks;

namespace TdLib
{
    public static partial class TdApi
    {
        /// <summary>
        /// Base class for API client
        /// </summary>
        public abstract class Client : Object
        {
            public abstract void Send<TResut>(Function<TResut> function);

            public abstract TResult Execute<TResult>(Function<TResult> function)
                where TResult : Object;

            public abstract Task<TResult> ExecuteAsync<TResult>(Function<TResult> function)
                where TResult : Object;
        }
    }
}