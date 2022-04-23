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
        /// Changes reactions, available in a chat. Available for basic groups, supergroups, and channels. Requires can_change_info administrator right
        /// </summary>
        public class SetChatAvailableReactions : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "setChatAvailableReactions";

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

            /// <summary>
            /// New list of reactions, available in the chat. All reactions must be active and order of the reactions must be the same as in updateReactions
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("available_reactions")]
            public string[] AvailableReactions { get; set; }
        }

        /// <summary>
        /// Changes reactions, available in a chat. Available for basic groups, supergroups, and channels. Requires can_change_info administrator right
        /// </summary>
        public static Task<Ok> SetChatAvailableReactionsAsync(
            this Client client, long chatId = default, string[] availableReactions = default)
        {
            return client.ExecuteAsync(new SetChatAvailableReactions
            {
                ChatId = chatId, AvailableReactions = availableReactions
            });
        }
    }
}