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
        /// Replaces current primary invite link for a chat with a new primary invite link. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right
        /// </summary>
        public class ReplacePrimaryChatInviteLink : Function<ChatInviteLink>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "replacePrimaryChatInviteLink";

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
        }

        /// <summary>
        /// Replaces current primary invite link for a chat with a new primary invite link. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right
        /// </summary>
        public static Task<ChatInviteLink> ReplacePrimaryChatInviteLinkAsync(
            this Client client, long chatId = default)
        {
            return client.ExecuteAsync(new ReplacePrimaryChatInviteLink
            {
                ChatId = chatId
            });
        }
    }
}