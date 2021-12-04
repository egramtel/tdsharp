using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        public partial class InputSticker : Object
        {
            /// <summary>
            /// Describes a sticker that needs to be added to a sticker set
            /// </summary>
            public class InputStickerStatic : InputSticker
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "inputStickerStatic";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// PNG image with the sticker; must be up to 512 KB in size and fit in a 512x512 square
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("sticker")]
                public InputFile Sticker { get; set; }

                /// <summary>
                /// Emojis corresponding to the sticker
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("emojis")]
                public string Emojis { get; set; }

                /// <summary>
                /// For masks, position where the mask is placed; pass null if unspecified
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("mask_position")]
                public MaskPosition MaskPosition { get; set; }
            }
        }
    }
}