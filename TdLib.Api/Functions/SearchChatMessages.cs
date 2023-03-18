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
        /// Searches for messages with given words in the chat. Returns the results in reverse chronological order, i.e. in order of decreasing message_id. Cannot be used in secret chats with a non-empty query
        /// (searchSecretMessages must be used instead), or without an enabled message database. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
        /// A combination of query, sender_id, filter and message_thread_id search criteria is expected to be supported, only if it is required for Telegram official application implementation
        /// </summary>
        public class SearchChatMessages : Function<FoundChatMessages>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "searchChatMessages";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the chat in which to search messages
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("chat_id")]
            public long ChatId { get; set; }

            /// <summary>
            /// Query to search for
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("query")]
            public string Query { get; set; }

            /// <summary>
            /// Identifier of the sender of messages to search for; pass null to search for messages from any sender. Not supported in secret chats
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("sender_id")]
            public MessageSender SenderId { get; set; }

            /// <summary>
            /// Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("from_message_id")]
            public long FromMessageId { get; set; }

            /// <summary>
            /// Specify 0 to get results from exactly the from_message_id or a negative offset to get the specified message and some newer messages
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("offset")]
            public int Offset { get; set; }

            /// <summary>
            /// The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than -offset.
            /// For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("limit")]
            public int Limit { get; set; }

            /// <summary>
            /// Additional filter for messages to search; pass null to search for all messages
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("filter")]
            public SearchMessagesFilter Filter { get; set; }

            /// <summary>
            /// If not 0, only messages in the specified thread will be returned; supergroups only
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("message_thread_id")]
            public long MessageThreadId { get; set; }
        }

        /// <summary>
        /// Searches for messages with given words in the chat. Returns the results in reverse chronological order, i.e. in order of decreasing message_id. Cannot be used in secret chats with a non-empty query
        /// (searchSecretMessages must be used instead), or without an enabled message database. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
        /// A combination of query, sender_id, filter and message_thread_id search criteria is expected to be supported, only if it is required for Telegram official application implementation
        /// </summary>
        public static Task<FoundChatMessages> SearchChatMessagesAsync(
            this Client client, long chatId = default, string query = default, MessageSender senderId = default, long fromMessageId = default, int offset = default, int limit = default, SearchMessagesFilter filter = default, long messageThreadId = default)
        {
            return client.ExecuteAsync(new SearchChatMessages
            {
                ChatId = chatId, Query = query, SenderId = senderId, FromMessageId = fromMessageId, Offset = offset, Limit = limit, Filter = filter, MessageThreadId = messageThreadId
            });
        }
    }
}