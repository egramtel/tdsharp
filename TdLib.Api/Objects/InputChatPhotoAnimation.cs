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
            /// An animation in MPEG4 format; must be square, at most 10 seconds long, have width between 160 and 1280 and be at most 2MB in size
            /// </summary>
            public class InputChatPhotoAnimation : InputChatPhoto
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "inputChatPhotoAnimation";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Animation to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("animation")]
                public InputFile Animation { get; set; }

                /// <summary>
                /// Timestamp of the frame, which will be used as static chat photo
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("main_frame_timestamp")]
                public double? MainFrameTimestamp { get; set; }
            }
        }
    }
}