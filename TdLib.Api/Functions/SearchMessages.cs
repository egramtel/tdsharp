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
        /// Searches for messages in all chats except secret chats. Returns the results in reverse chronological order (i.e., in order of decreasing (date, chat_id, message_id)).
        /// For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
        /// </summary>
        public class SearchMessages : Function<FoundMessages>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "searchMessages";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Chat list in which to search messages; pass null to search in all chats regardless of their chat list. Only Main and Archive chat lists are supported
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("chat_list")]
            public ChatList ChatList { get; set; }

            /// <summary>
            /// Query to search for
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("query")]
            public string Query { get; set; }

            /// <summary>
            /// Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("offset")]
            public string Offset { get; set; }

            /// <summary>
            /// The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("limit")]
            public int Limit { get; set; }

            /// <summary>
            /// Additional filter for messages to search; pass null to search for all messages. Filters searchMessagesFilterMention, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction, searchMessagesFilterFailedToSend, and searchMessagesFilterPinned are unsupported in this function
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("filter")]
            public SearchMessagesFilter Filter { get; set; }

            /// <summary>
            /// Additional filter for type of the chat of the searched messages; pass null to search for messages in all chats
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("chat_type_filter")]
            public SearchMessagesChatTypeFilter ChatTypeFilter { get; set; }

            /// <summary>
            /// If not 0, the minimum date of the messages to return
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("min_date")]
            public int MinDate { get; set; }

            /// <summary>
            /// If not 0, the maximum date of the messages to return
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("max_date")]
            public int MaxDate { get; set; }
        }

        /// <summary>
        /// Searches for messages in all chats except secret chats. Returns the results in reverse chronological order (i.e., in order of decreasing (date, chat_id, message_id)).
        /// For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
        /// </summary>
        public static Task<FoundMessages> SearchMessagesAsync(
            this Client client, ChatList chatList = default, string query = default, string offset = default, int limit = default, SearchMessagesFilter filter = default, SearchMessagesChatTypeFilter chatTypeFilter = default, int minDate = default, int maxDate = default)
        {
            return client.ExecuteAsync(new SearchMessages
            {
                ChatList = chatList, Query = query, Offset = offset, Limit = limit, Filter = filter, ChatTypeFilter = chatTypeFilter, MinDate = minDate, MaxDate = maxDate
            });
        }
    }
}
// REUSE-IgnoreEnd