using System;
using Newtonsoft.Json;

// REUSE-IgnoreStart
namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        public partial class ChatEventAction : Object
        {
            /// <summary>
            /// A chat invite link was revoked
            /// </summary>
            public class ChatEventInviteLinkRevoked : ChatEventAction
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "chatEventInviteLinkRevoked";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// The invite link
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("invite_link")]
                public ChatInviteLink InviteLink { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd