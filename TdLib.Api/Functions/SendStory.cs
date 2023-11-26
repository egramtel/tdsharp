using System;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        /// <summary>
        /// Sends a new story to a chat; requires can_post_stories rights for channel chats. Returns a temporary story
        /// </summary>
        public class SendStory : Function<Story>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "sendStory";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the chat that will post the story
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("chat_id")]
            public long ChatId { get; set; }

            /// <summary>
            /// Content of the story
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("content")]
            public InputStoryContent Content { get; set; }

            /// <summary>
            /// Clickable rectangle areas to be shown on the story media; pass null if none
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("areas")]
            public InputStoryAreas Areas { get; set; }

            /// <summary>
            /// Story caption; pass null to use an empty caption; 0-getOption("story_caption_length_max") characters
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("caption")]
            public FormattedText Caption { get; set; }

            /// <summary>
            /// The privacy settings for the story
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("privacy_settings")]
            public StoryPrivacySettings PrivacySettings { get; set; }

            /// <summary>
            /// Period after which the story is moved to archive, in seconds; must be one of 6 * 3600, 12 * 3600, 86400, or 2 * 86400 for Telegram Premium users, and 86400 otherwise
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("active_period")]
            public int ActivePeriod { get; set; }

            /// <summary>
            /// Pass true to keep the story accessible after expiration
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("is_pinned")]
            public bool IsPinned { get; set; }

            /// <summary>
            /// Pass true if the content of the story must be protected from forwarding and screenshotting
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("protect_content")]
            public bool ProtectContent { get; set; }
        }

        /// <summary>
        /// Sends a new story to a chat; requires can_post_stories rights for channel chats. Returns a temporary story
        /// </summary>
        public static Task<Story> SendStoryAsync(
            this Client client, long chatId = default, InputStoryContent content = default, InputStoryAreas areas = default, FormattedText caption = default, StoryPrivacySettings privacySettings = default, int activePeriod = default, bool isPinned = default, bool protectContent = default)
        {
            return client.ExecuteAsync(new SendStory
            {
                ChatId = chatId, Content = content, Areas = areas, Caption = caption, PrivacySettings = privacySettings, ActivePeriod = activePeriod, IsPinned = isPinned, ProtectContent = protectContent
            });
        }
    }
}