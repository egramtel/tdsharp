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
        /// Returns sponsored messages to be shown in a chat; for channel chats only
        /// </summary>
        public class GetChatSponsoredMessages : Function<SponsoredMessages>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getChatSponsoredMessages";

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
        /// Returns sponsored messages to be shown in a chat; for channel chats only
        /// </summary>
        public static Task<SponsoredMessages> GetChatSponsoredMessagesAsync(
            this Client client, long chatId = default)
        {
            return client.ExecuteAsync(new GetChatSponsoredMessages
            {
                ChatId = chatId
            });
        }
    }
}