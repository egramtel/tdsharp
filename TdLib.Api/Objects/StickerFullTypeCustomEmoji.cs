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
        public partial class StickerFullType : Object
        {
            /// <summary>
            /// The sticker is a custom emoji to be used inside message text and caption. Currently, only Telegram Premium users can use custom emoji
            /// </summary>
            public class StickerFullTypeCustomEmoji : StickerFullType
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "stickerFullTypeCustomEmoji";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Identifier of the custom emoji
                /// </summary>
                [JsonConverter(typeof(Converter.Int64))]
                [JsonProperty("custom_emoji_id")]
                public long CustomEmojiId { get; set; }

                /// <summary>
                /// True, if the sticker must be repainted to a text color in messages, the color of the Telegram Premium badge in emoji status, white color on chat photos, or another appropriate color in other places
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("needs_repainting")]
                public bool NeedsRepainting { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd