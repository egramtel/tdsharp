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
        /// Contains a list of messages
        /// </summary>
        public partial class Messages : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "messages";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Approximate total number of messages found
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("total_count")]
            public int TotalCount { get; set; }

            /// <summary>
            /// List of messages; messages may be null
            /// </summary>
            [JsonProperty("messages", ItemConverterType = typeof(Converter))]
            public Message[] Messages_ { get; set; }
        }
    }
}
// REUSE-IgnoreEnd