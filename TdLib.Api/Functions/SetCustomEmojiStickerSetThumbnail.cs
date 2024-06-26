using System;
using System.Threading.Tasks;
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
        /// Sets a custom emoji sticker set thumbnail
        /// </summary>
        public class SetCustomEmojiStickerSetThumbnail : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "setCustomEmojiStickerSetThumbnail";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Sticker set name. The sticker set must be owned by the current user
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("name")]
            public string Name { get; set; }

            /// <summary>
            /// Identifier of the custom emoji from the sticker set, which will be set as sticker set thumbnail; pass 0 to remove the sticker set thumbnail
            /// </summary>
            [JsonConverter(typeof(Converter.Int64))]
            [JsonProperty("custom_emoji_id")]
            public long CustomEmojiId { get; set; }
        }

        /// <summary>
        /// Sets a custom emoji sticker set thumbnail
        /// </summary>
        public static Task<Ok> SetCustomEmojiStickerSetThumbnailAsync(
            this Client client, string name = default, long customEmojiId = default)
        {
            return client.ExecuteAsync(new SetCustomEmojiStickerSetThumbnail
            {
                Name = name, CustomEmojiId = customEmojiId
            });
        }
    }
}
// REUSE-IgnoreEnd