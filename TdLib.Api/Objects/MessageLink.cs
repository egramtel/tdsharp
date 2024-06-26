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
        /// Contains an HTTPS link to a message in a supergroup or channel, or a forum topic
        /// </summary>
        public partial class MessageLink : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "messageLink";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The link
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("link")]
            public string Link { get; set; }

            /// <summary>
            /// True, if the link will work for non-members of the chat
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("is_public")]
            public bool IsPublic { get; set; }
        }
    }
}
// REUSE-IgnoreEnd