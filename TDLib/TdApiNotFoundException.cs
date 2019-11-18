using System;

namespace TdLib
{
    public class TdApiNotFoundException : Exception
    {
        public readonly string ApiName;

        public TdApiNotFoundException(string apiName) : this(apiName, null)
        {
            this.ApiName = apiName;
        }

        public TdApiNotFoundException(string apiName, Exception innerException) : base($"{apiName} Not found. Maybe your TdDLib.Api is outdated.", innerException) { }
    }
}
