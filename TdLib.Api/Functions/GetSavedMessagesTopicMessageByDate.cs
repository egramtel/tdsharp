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
        /// Returns the last message sent in a Saved Messages topic no later than the specified date
        /// </summary>
        public class GetSavedMessagesTopicMessageByDate : Function<Message>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getSavedMessagesTopicMessageByDate";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of Saved Messages topic which message will be returned
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("saved_messages_topic_id")]
            public long SavedMessagesTopicId { get; set; }

            /// <summary>
            /// Point in time (Unix timestamp) relative to which to search for messages
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("date")]
            public int Date { get; set; }
        }

        /// <summary>
        /// Returns the last message sent in a Saved Messages topic no later than the specified date
        /// </summary>
        public static Task<Message> GetSavedMessagesTopicMessageByDateAsync(
            this Client client, long savedMessagesTopicId = default, int date = default)
        {
            return client.ExecuteAsync(new GetSavedMessagesTopicMessageByDate
            {
                SavedMessagesTopicId = savedMessagesTopicId, Date = date
            });
        }
    }
}
// REUSE-IgnoreEnd