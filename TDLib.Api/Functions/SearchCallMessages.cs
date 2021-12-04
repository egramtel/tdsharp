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
        /// Searches for call messages. Returns the results in reverse chronological order (i. e., in order of decreasing message_id). For optimal performance, the number of returned messages is chosen by TDLib
        /// </summary>
        public class SearchCallMessages : Function<Messages>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "searchCallMessages";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the message from which to search; use 0 to get results from the last message
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("from_message_id")]
            public long FromMessageId { get; set; }

            /// <summary>
            /// The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("limit")]
            public int Limit { get; set; }

            /// <summary>
            /// If true, returns only messages with missed calls
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("only_missed")]
            public bool OnlyMissed { get; set; }
        }

        /// <summary>
        /// Searches for call messages. Returns the results in reverse chronological order (i. e., in order of decreasing message_id). For optimal performance, the number of returned messages is chosen by TDLib
        /// </summary>
        public static Task<Messages> SearchCallMessagesAsync(
            this Client client, long fromMessageId = default, int limit = default, bool onlyMissed = default)
        {
            return client.ExecuteAsync(new SearchCallMessages
            {
                FromMessageId = fromMessageId, Limit = limit, OnlyMissed = onlyMissed
            });
        }
    }
}