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
        /// Represents a URL linking to an internal Telegram entity
        /// </summary>
        public partial class TMeUrl : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "tMeUrl";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// URL
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("url")]
            public string Url { get; set; }

            /// <summary>
            /// Type of the URL
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("type")]
            public TMeUrlType Type { get; set; }
        }
    }
}
// REUSE-IgnoreEnd