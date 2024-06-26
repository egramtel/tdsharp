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
        /// Contains information about original story that was reposted
        /// </summary>
        public partial class StoryRepostInfo : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "storyRepostInfo";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Origin of the story that was reposted
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("origin")]
            public StoryOrigin Origin { get; set; }

            /// <summary>
            /// True, if story content was modified during reposting; otherwise, story wasn't modified
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("is_content_modified")]
            public bool IsContentModified { get; set; }
        }
    }
}
// REUSE-IgnoreEnd