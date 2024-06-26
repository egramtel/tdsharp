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
        public partial class StoryOrigin : Object
        {
            /// <summary>
            /// Contains information about the origin of a story that was reposted
            /// </summary>
            public class StoryOriginPublicStory : StoryOrigin
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "storyOriginPublicStory";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Identifier of the chat that posted original story
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("chat_id")]
                public long ChatId { get; set; }

                /// <summary>
                /// Story identifier of the original story
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("story_id")]
                public int StoryId { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd