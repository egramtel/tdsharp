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
        public partial class Update : Object
        {
            /// <summary>
            /// A sticker set has changed
            /// </summary>
            public class UpdateStickerSet : Update
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "updateStickerSet";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// The sticker set
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("sticker_set")]
                public StickerSet StickerSet { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd