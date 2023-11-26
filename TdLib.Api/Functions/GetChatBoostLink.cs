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
        /// Returns an HTTPS link to boost the specified channel chat
        /// </summary>
        public class GetChatBoostLink : Function<ChatBoostLink>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getChatBoostLink";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the chat
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("chat_id")]
            public long ChatId { get; set; }
        }

        /// <summary>
        /// Returns an HTTPS link to boost the specified channel chat
        /// </summary>
        public static Task<ChatBoostLink> GetChatBoostLinkAsync(
            this Client client, long chatId = default)
        {
            return client.ExecuteAsync(new GetChatBoostLink
            {
                ChatId = chatId
            });
        }
    }
}