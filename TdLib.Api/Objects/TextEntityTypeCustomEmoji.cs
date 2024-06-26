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
        public partial class TextEntityType : Object
        {
            /// <summary>
            /// A custom emoji. The text behind a custom emoji must be an emoji. Only premium users can use premium custom emoji
            /// </summary>
            public class TextEntityTypeCustomEmoji : TextEntityType
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "textEntityTypeCustomEmoji";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Unique identifier of the custom emoji
                /// </summary>
                [JsonConverter(typeof(Converter.Int64))]
                [JsonProperty("custom_emoji_id")]
                public long CustomEmojiId { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd