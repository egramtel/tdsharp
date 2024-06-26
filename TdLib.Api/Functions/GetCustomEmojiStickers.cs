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
        /// Returns the list of custom emoji stickers by their identifiers. Stickers are returned in arbitrary order. Only found stickers are returned
        /// </summary>
        public class GetCustomEmojiStickers : Function<Stickers>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getCustomEmojiStickers";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifiers of custom emoji stickers. At most 200 custom emoji stickers can be received simultaneously
            /// </summary>
            [JsonProperty("custom_emoji_ids", ItemConverterType = typeof(Converter))]
            public long[] CustomEmojiIds { get; set; }
        }

        /// <summary>
        /// Returns the list of custom emoji stickers by their identifiers. Stickers are returned in arbitrary order. Only found stickers are returned
        /// </summary>
        public static Task<Stickers> GetCustomEmojiStickersAsync(
            this Client client, long[] customEmojiIds = default)
        {
            return client.ExecuteAsync(new GetCustomEmojiStickers
            {
                CustomEmojiIds = customEmojiIds
            });
        }
    }
}
// REUSE-IgnoreEnd