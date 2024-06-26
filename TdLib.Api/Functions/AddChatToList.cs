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
        /// Adds a chat to a chat list. A chat can't be simultaneously in Main and Archive chat lists, so it is automatically removed from another one if needed
        /// </summary>
        public class AddChatToList : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "addChatToList";

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
            /// The chat list. Use getChatListsToAddChat to get suitable chat lists
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("chat_list")]
            public ChatList ChatList { get; set; }
        }

        /// <summary>
        /// Adds a chat to a chat list. A chat can't be simultaneously in Main and Archive chat lists, so it is automatically removed from another one if needed
        /// </summary>
        public static Task<Ok> AddChatToListAsync(
            this Client client, long chatId = default, ChatList chatList = default)
        {
            return client.ExecuteAsync(new AddChatToList
            {
                ChatId = chatId, ChatList = chatList
            });
        }
    }
}
// REUSE-IgnoreEnd