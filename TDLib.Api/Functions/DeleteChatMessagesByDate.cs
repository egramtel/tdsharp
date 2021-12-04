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
        /// Deletes all messages between the specified dates in a chat. Supported only for private chats and basic groups. Messages sent in the last 30 seconds will not be deleted
        /// </summary>
        public class DeleteChatMessagesByDate : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "deleteChatMessagesByDate";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Chat identifier
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("chat_id")]
            public long ChatId { get; set; }

            /// <summary>
            /// The minimum date of the messages to delete
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("min_date")]
            public int MinDate { get; set; }

            /// <summary>
            /// The maximum date of the messages to delete
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("max_date")]
            public int MaxDate { get; set; }

            /// <summary>
            /// Pass true to try to delete chat messages for all users; private chats only
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("revoke")]
            public bool Revoke { get; set; }
        }

        /// <summary>
        /// Deletes all messages between the specified dates in a chat. Supported only for private chats and basic groups. Messages sent in the last 30 seconds will not be deleted
        /// </summary>
        public static Task<Ok> DeleteChatMessagesByDateAsync(
            this Client client, long chatId = default, int minDate = default, int maxDate = default,
            bool revoke = default)
        {
            return client.ExecuteAsync(new DeleteChatMessagesByDate
            {
                ChatId = chatId, MinDate = minDate, MaxDate = maxDate, Revoke = revoke
            });
        }
    }
}