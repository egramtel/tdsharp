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
        /// Returns found forum topics in a forum chat. This is a temporary method for getting information about topic list from the server
        /// </summary>
        public class GetForumTopics : Function<ForumTopics>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getForumTopics";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the forum chat
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("chat_id")]
            public long ChatId { get; set; }

            /// <summary>
            /// Query to search for in the forum topic's name
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("query")]
            public string Query { get; set; }

            /// <summary>
            /// The date starting from which the results need to be fetched. Use 0 or any date in the future to get results from the last topic
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("offset_date")]
            public int OffsetDate { get; set; }

            /// <summary>
            /// The message identifier of the last message in the last found topic, or 0 for the first request
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("offset_message_id")]
            public long OffsetMessageId { get; set; }

            /// <summary>
            /// The message thread identifier of the last found topic, or 0 for the first request
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("offset_message_thread_id")]
            public long OffsetMessageThreadId { get; set; }

            /// <summary>
            /// The maximum number of forum topics to be returned; up to 100. For optimal performance, the number of returned forum topics is chosen by TDLib and can be smaller than the specified limit
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("limit")]
            public int Limit { get; set; }
        }

        /// <summary>
        /// Returns found forum topics in a forum chat. This is a temporary method for getting information about topic list from the server
        /// </summary>
        public static Task<ForumTopics> GetForumTopicsAsync(
            this Client client, long chatId = default, string query = default, int offsetDate = default, long offsetMessageId = default, long offsetMessageThreadId = default, int limit = default)
        {
            return client.ExecuteAsync(new GetForumTopics
            {
                ChatId = chatId, Query = query, OffsetDate = offsetDate, OffsetMessageId = offsetMessageId, OffsetMessageThreadId = offsetMessageThreadId, Limit = limit
            });
        }
    }
}
// REUSE-IgnoreEnd