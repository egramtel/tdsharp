using System;
using Newtonsoft.Json;

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
            /// The sticker is a mask in WEBP format to be placed on photos or videos
            /// </summary>
            public class StickerFullTypeMask : StickerFullType
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "stickerFullTypeMask";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Position where the mask is placed; may be null
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("mask_position")]
                public MaskPosition MaskPosition { get; set; }
            }
        }
    }
}