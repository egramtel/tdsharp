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
        /// Pauses or resumes the connected business bot in a specific chat
        /// </summary>
        public class ToggleBusinessConnectedBotChatIsPaused : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "toggleBusinessConnectedBotChatIsPaused";

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
            /// Pass true to pause the connected bot in the chat; pass false to resume the bot
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("is_paused")]
            public bool IsPaused { get; set; }
        }

        /// <summary>
        /// Pauses or resumes the connected business bot in a specific chat
        /// </summary>
        public static Task<Ok> ToggleBusinessConnectedBotChatIsPausedAsync(
            this Client client, long chatId = default, bool isPaused = default)
        {
            return client.ExecuteAsync(new ToggleBusinessConnectedBotChatIsPaused
            {
                ChatId = chatId, IsPaused = isPaused
            });
        }
    }
}