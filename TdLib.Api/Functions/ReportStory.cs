using System;
using System.Threading.Tasks;
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
        /// Reports a story to the Telegram moderators
        /// </summary>
        public class ReportStory : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "reportStory";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The identifier of the sender of the story to report
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("story_sender_chat_id")]
            public long StorySenderChatId { get; set; }

            /// <summary>
            /// The identifier of the story to report
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("story_id")]
            public int StoryId { get; set; }

            /// <summary>
            /// The reason for reporting the story
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("reason")]
            public ReportReason Reason { get; set; }

            /// <summary>
            /// Additional report details; 0-1024 characters
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("text")]
            public string Text { get; set; }
        }

        /// <summary>
        /// Reports a story to the Telegram moderators
        /// </summary>
        public static Task<Ok> ReportStoryAsync(
            this Client client, long storySenderChatId = default, int storyId = default, ReportReason reason = default, string text = default)
        {
            return client.ExecuteAsync(new ReportStory
            {
                StorySenderChatId = storySenderChatId, StoryId = storyId, Reason = reason, Text = text
            });
        }
    }
}
// REUSE-IgnoreEnd