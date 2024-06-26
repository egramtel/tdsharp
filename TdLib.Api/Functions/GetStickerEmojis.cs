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
        /// Returns emoji corresponding to a sticker. The list is only for informational purposes, because a sticker is always sent with a fixed emoji from the corresponding Sticker object
        /// </summary>
        public class GetStickerEmojis : Function<Emojis>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getStickerEmojis";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Sticker file identifier
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("sticker")]
            public InputFile Sticker { get; set; }
        }

        /// <summary>
        /// Returns emoji corresponding to a sticker. The list is only for informational purposes, because a sticker is always sent with a fixed emoji from the corresponding Sticker object
        /// </summary>
        public static Task<Emojis> GetStickerEmojisAsync(
            this Client client, InputFile sticker = default)
        {
            return client.ExecuteAsync(new GetStickerEmojis
            {
                Sticker = sticker
            });
        }
    }
}
// REUSE-IgnoreEnd