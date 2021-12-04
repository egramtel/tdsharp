using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        public partial class InternalLinkType : Object
        {
            /// <summary>
            /// The link is a link to a proxy. Call addProxy with the given parameters to process the link and add the proxy
            /// </summary>
            public class InternalLinkTypeProxy : InternalLinkType
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "internalLinkTypeProxy";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Proxy server IP address
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("server")]
                public string Server { get; set; }

                /// <summary>
                /// Proxy server port
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("port")]
                public int Port { get; set; }

                /// <summary>
                /// Type of the proxy
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("type")]
                public ProxyType Type { get; set; }
            }
        }
    }
}