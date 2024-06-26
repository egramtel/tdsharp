using System;
using Newtonsoft.Json;

// REUSE-IgnoreStart
namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        /// <summary>
        /// Contains a list of time zones
        /// </summary>
        public partial class TimeZones : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "timeZones";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// A list of time zones
            /// </summary>
            [JsonProperty("time_zones", ItemConverterType = typeof(Converter))]
            public TimeZone[] TimeZones_ { get; set; }
        }
    }
}
// REUSE-IgnoreEnd