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
        public partial class PushMessageContent : Object
        {
            /// <summary>
            /// A message with a sticker
            /// </summary>
            public class PushMessageContentSticker : PushMessageContent
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "pushMessageContentSticker";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Message content; may be null
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("sticker")]
                public Sticker Sticker { get; set; }

                /// <summary>
                /// Emoji corresponding to the sticker; may be empty
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("emoji")]
                public string Emoji { get; set; }

                /// <summary>
                /// True, if the message is a pinned message with the specified content
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("is_pinned")]
                public bool IsPinned { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd