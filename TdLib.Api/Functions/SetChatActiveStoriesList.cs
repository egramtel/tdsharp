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
        /// Changes story list in which stories from the chat are shown
        /// </summary>
        public class SetChatActiveStoriesList : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "setChatActiveStoriesList";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the chat that posted stories
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("chat_id")]
            public long ChatId { get; set; }

            /// <summary>
            /// New list for active stories posted by the chat
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("story_list")]
            public StoryList StoryList { get; set; }
        }

        /// <summary>
        /// Changes story list in which stories from the chat are shown
        /// </summary>
        public static Task<Ok> SetChatActiveStoriesListAsync(
            this Client client, long chatId = default, StoryList storyList = default)
        {
            return client.ExecuteAsync(new SetChatActiveStoriesList
            {
                ChatId = chatId, StoryList = storyList
            });
        }
    }
}
// REUSE-IgnoreEnd