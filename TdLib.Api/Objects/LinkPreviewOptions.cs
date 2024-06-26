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
        /// Options to be used for generation of a link preview
        /// </summary>
        public partial class LinkPreviewOptions : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "linkPreviewOptions";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// True, if link preview must be disabled
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("is_disabled")]
            public bool IsDisabled { get; set; }

            /// <summary>
            /// URL to use for link preview. If empty, then the first URL found in the message text will be used
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("url")]
            public string Url { get; set; }

            /// <summary>
            /// True, if shown media preview must be small; ignored in secret chats or if the URL isn't explicitly specified
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("force_small_media")]
            public bool ForceSmallMedia { get; set; }

            /// <summary>
            /// True, if shown media preview must be large; ignored in secret chats or if the URL isn't explicitly specified
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("force_large_media")]
            public bool ForceLargeMedia { get; set; }

            /// <summary>
            /// True, if link preview must be shown above message text; otherwise, the link preview will be shown below the message text; ignored in secret chats
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("show_above_text")]
            public bool ShowAboveText { get; set; }
        }
    }
}
// REUSE-IgnoreEnd