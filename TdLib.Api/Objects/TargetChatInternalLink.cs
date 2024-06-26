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
        public partial class TargetChat : Object
        {
            /// <summary>
            /// The chat needs to be open with the provided internal link
            /// </summary>
            public class TargetChatInternalLink : TargetChat
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "targetChatInternalLink";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// An internal link pointing to the chat
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("link")]
                public InternalLinkType Link { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd