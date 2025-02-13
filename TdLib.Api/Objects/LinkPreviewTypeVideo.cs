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
        public partial class LinkPreviewType : Object
        {
            /// <summary>
            /// The link is a link to a video
            /// </summary>
            public class LinkPreviewTypeVideo : LinkPreviewType
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "linkPreviewTypeVideo";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// The video description
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("video")]
                public Video Video { get; set; }

                /// <summary>
                /// Cover of the video; may be null if none
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("cover")]
                public Photo Cover { get; set; }

                /// <summary>
                /// Timestamp from which the video playing must start, in seconds
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("start_timestamp")]
                public int StartTimestamp { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd