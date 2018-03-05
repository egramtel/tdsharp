using System;
using TD;

namespace TD
{
    public class ErrorException : Exception
    {
        public readonly Error.error Error;

        public ErrorException(Error.error error) : base(error.message_)
        {
            Error = error;
        }
    }
}