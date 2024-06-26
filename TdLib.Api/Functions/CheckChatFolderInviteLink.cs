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
        /// Checks the validity of an invite link for a chat folder and returns information about the corresponding chat folder
        /// </summary>
        public class CheckChatFolderInviteLink : Function<ChatFolderInviteLinkInfo>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "checkChatFolderInviteLink";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Invite link to be checked
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("invite_link")]
            public string InviteLink { get; set; }
        }

        /// <summary>
        /// Checks the validity of an invite link for a chat folder and returns information about the corresponding chat folder
        /// </summary>
        public static Task<ChatFolderInviteLinkInfo> CheckChatFolderInviteLinkAsync(
            this Client client, string inviteLink = default)
        {
            return client.ExecuteAsync(new CheckChatFolderInviteLink
            {
                InviteLink = inviteLink
            });
        }
    }
}
// REUSE-IgnoreEnd