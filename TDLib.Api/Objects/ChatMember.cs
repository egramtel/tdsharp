using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        /// <summary>
        /// A user with information about joining/leaving a chat
        /// </summary>
        public partial class ChatMember : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "chatMember";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// User identifier of the chat member
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("member_id")]
            public MessageSender Sender { get; set; }

            /// <summary>
            /// Identifier of a user that invited/promoted/banned this member in the chat; 0 if unknown
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("inviter_user_id")]
            public int InviterUserId { get; set; }

            /// <summary>
            /// Point in time (Unix timestamp) when the user joined the chat
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("joined_chat_date")]
            public int JoinedChatDate { get; set; }

            /// <summary>
            /// Status of the member in the chat
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("status")]
            public ChatMemberStatus Status { get; set; }

            /// <summary>
            /// If the user is a bot, information about the bot; may be null. Can be null even for a bot if the bot is not the chat member
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("bot_info")]
            public BotInfo BotInfo { get; set; }
        }
    }
}
