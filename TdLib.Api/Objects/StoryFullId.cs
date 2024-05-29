using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        /// <summary>
        /// Contains identifier of a story along with identifier of its sender
        /// </summary>
        public partial class StoryFullId : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "storyFullId";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the chat that posted the story
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("sender_chat_id")]
            public long SenderChatId { get; set; }

            /// <summary>
            /// Unique story identifier among stories of the given sender
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("story_id")]
            public int StoryId { get; set; }
        }
    }
}