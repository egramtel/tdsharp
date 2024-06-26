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
        /// Describes a server for relaying call data
        /// </summary>
        public partial class CallServer : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "callServer";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Server identifier
            /// </summary>
            [JsonConverter(typeof(Converter.Int64))]
            [JsonProperty("id")]
            public long Id { get; set; }

            /// <summary>
            /// Server IPv4 address
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("ip_address")]
            public string IpAddress { get; set; }

            /// <summary>
            /// Server IPv6 address
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("ipv6_address")]
            public string Ipv6Address { get; set; }

            /// <summary>
            /// Server port number
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("port")]
            public int Port { get; set; }

            /// <summary>
            /// Server type
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("type")]
            public CallServerType Type { get; set; }
        }
    }
}
// REUSE-IgnoreEnd