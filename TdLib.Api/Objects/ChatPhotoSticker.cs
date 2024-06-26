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
        /// Information about the sticker, which was used to create the chat photo. The sticker is shown at the center of the photo and occupies at most 67% of it
        /// </summary>
        public partial class ChatPhotoSticker : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "chatPhotoSticker";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Type of the sticker
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("type")]
            public ChatPhotoStickerType Type { get; set; }

            /// <summary>
            /// The fill to be used as background for the sticker; rotation angle in backgroundFillGradient isn't supported
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("background_fill")]
            public BackgroundFill BackgroundFill { get; set; }
        }
    }
}
// REUSE-IgnoreEnd