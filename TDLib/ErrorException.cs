using System;
using TdLib;

namespace TdLib
{
    public class ErrorException : Exception
    {
        public readonly TdApi.Error Error;

        public ErrorException(TdApi.Error error) : base(error.Message)
        {
            Error = error;
        }
    }
}