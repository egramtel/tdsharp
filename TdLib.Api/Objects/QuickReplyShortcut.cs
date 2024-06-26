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
        /// Describes a shortcut that can be used for a quick reply
        /// </summary>
        public partial class QuickReplyShortcut : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "quickReplyShortcut";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Unique shortcut identifier
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("id")]
            public int Id { get; set; }

            /// <summary>
            /// The name of the shortcut that can be used to use the shortcut
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("name")]
            public string Name { get; set; }

            /// <summary>
            /// The first shortcut message
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("first_message")]
            public QuickReplyMessage FirstMessage { get; set; }

            /// <summary>
            /// The total number of messages in the shortcut
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("message_count")]
            public int MessageCount { get; set; }
        }
    }
}
// REUSE-IgnoreEnd