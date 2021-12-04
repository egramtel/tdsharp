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
        /// Returns forwarded copies of a channel message to different public channels. For optimal performance, the number of returned messages is chosen by TDLib
        /// </summary>
        public class GetMessagePublicForwards : Function<FoundMessages>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getMessagePublicForwards";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Chat identifier of the message
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("chat_id")]
            public long ChatId { get; set; }

            /// <summary>
            /// Message identifier
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("message_id")]
            public long MessageId { get; set; }

            /// <summary>
            /// Offset of the first entry to return as received from the previous request; use empty string to get first chunk of results
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("offset")]
            public string Offset { get; set; }

            /// <summary>
            /// The maximum number of messages to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("limit")]
            public int Limit { get; set; }
        }

        /// <summary>
        /// Returns forwarded copies of a channel message to different public channels. For optimal performance, the number of returned messages is chosen by TDLib
        /// </summary>
        public static Task<FoundMessages> GetMessagePublicForwardsAsync(
            this Client client, long chatId = default, long messageId = default, string offset = default,
            int limit = default)
        {
            return client.ExecuteAsync(new GetMessagePublicForwards
            {
                ChatId = chatId, MessageId = messageId, Offset = offset, Limit = limit
            });
        }
    }
}