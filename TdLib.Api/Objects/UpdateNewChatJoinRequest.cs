using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        public partial class Update : Object
        {
            /// <summary>
            /// A user sent a join request to a chat; for bots only
            /// </summary>
            public class UpdateNewChatJoinRequest : Update
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "updateNewChatJoinRequest";

                /// <summary>
                /// Extra data attached to the message
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
                /// Join request
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("request")]
                public ChatJoinRequest Request { get; set; }

                /// <summary>
                /// Chat identifier of the private chat with the user
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("user_chat_id")]
                public long UserChatId { get; set; }

                /// <summary>
                /// The invite link, which was used to send join request; may be null
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("invite_link")]
                public ChatInviteLink InviteLink { get; set; }
            }
        }
    }
}