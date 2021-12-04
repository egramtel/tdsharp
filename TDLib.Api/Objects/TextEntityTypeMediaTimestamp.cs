using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        public partial class TextEntityType : Object
        {
            /// <summary>
            /// A media timestamp
            /// </summary>
            public class TextEntityTypeMediaTimestamp : TextEntityType
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "textEntityTypeMediaTimestamp";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Timestamp from which a video/audio/video note/voice note playing must start, in seconds. The media can be in the content or the web page preview of the current message, or in the same places in the replied message
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("media_timestamp")]
                public int MediaTimestamp { get; set; }
            }
        }
    }
}