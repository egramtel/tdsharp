using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        public partial class InputChatPhoto : Object
        {
            /// <summary>
            /// A sticker on a custom background
            /// </summary>
            public class InputChatPhotoSticker : InputChatPhoto
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "inputChatPhotoSticker";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Information about the sticker
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("sticker")]
                public ChatPhotoSticker Sticker { get; set; }
            }
        }
    }
}