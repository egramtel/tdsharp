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
        /// Checks whether the specified bot can send messages to the user. Returns a 404 error if can't and the access can be granted by call to allowBotToSendMessages
        /// </summary>
        public class CanBotSendMessages : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "canBotSendMessages";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the target bot
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("bot_user_id")]
            public long BotUserId { get; set; }
        }

        /// <summary>
        /// Checks whether the specified bot can send messages to the user. Returns a 404 error if can't and the access can be granted by call to allowBotToSendMessages
        /// </summary>
        public static Task<Ok> CanBotSendMessagesAsync(
            this Client client, long botUserId = default)
        {
            return client.ExecuteAsync(new CanBotSendMessages
            {
                BotUserId = botUserId
            });
        }
    }
}