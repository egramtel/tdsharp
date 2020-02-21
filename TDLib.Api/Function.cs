using System.Threading.Tasks;

namespace TdLib
{
    public static partial class TdApi
    {
        /// <summary>
        /// Base class for all functions
        /// </summary>
        /// <typeparam name="T">Return type for this function</typeparam>
        public abstract class Function<T> : Object
        {
        }
    }
}