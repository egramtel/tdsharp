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
        /// Changes the position of a sticker in the set to which it belongs. The sticker set must be owned by the current user
        /// </summary>
        public class SetStickerPositionInSet : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "setStickerPositionInSet";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Sticker
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("sticker")]
            public InputFile Sticker { get; set; }

            /// <summary>
            /// New position of the sticker in the set, 0-based
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("position")]
            public int Position { get; set; }
        }

        /// <summary>
        /// Changes the position of a sticker in the set to which it belongs. The sticker set must be owned by the current user
        /// </summary>
        public static Task<Ok> SetStickerPositionInSetAsync(
            this Client client, InputFile sticker = default, int position = default)
        {
            return client.ExecuteAsync(new SetStickerPositionInSet
            {
                Sticker = sticker, Position = position
            });
        }
    }
}
// REUSE-IgnoreEnd