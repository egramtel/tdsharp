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
        /// Returns sparse positions of messages of the specified type in the chat to be used for shared media scroll implementation. Returns the results in reverse chronological order (i.e., in order of decreasing message_id).
        /// </summary>
        public class GetChatSparseMessagePositions : Function<MessagePositions>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getChatSparseMessagePositions";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the chat in which to return information about message positions
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("chat_id")]
            public long ChatId { get; set; }

            /// <summary>
            /// Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterCall, searchMessagesFilterMissedCall, searchMessagesFilterMention and searchMessagesFilterUnreadMention are unsupported in this function
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("filter")]
            public SearchMessagesFilter Filter { get; set; }

            /// <summary>
            /// The message identifier from which to return information about message positions
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("from_message_id")]
            public long FromMessageId { get; set; }

            /// <summary>
            /// The expected number of message positions to be returned; 50-2000. A smaller number of positions can be returned, if there are not enough appropriate messages
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("limit")]
            public int Limit { get; set; }
        }

        /// <summary>
        /// Returns sparse positions of messages of the specified type in the chat to be used for shared media scroll implementation. Returns the results in reverse chronological order (i.e., in order of decreasing message_id).
        /// </summary>
        public static Task<MessagePositions> GetChatSparseMessagePositionsAsync(
            this Client client, long chatId = default, SearchMessagesFilter filter = default,
            long fromMessageId = default, int limit = default)
        {
            return client.ExecuteAsync(new GetChatSparseMessagePositions
            {
                ChatId = chatId, Filter = filter, FromMessageId = fromMessageId, Limit = limit
            });
        }
    }
}