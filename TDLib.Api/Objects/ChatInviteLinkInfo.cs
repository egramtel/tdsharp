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
        /// Contains information about a chat invite link
        /// </summary>
        public partial class ChatInviteLinkInfo : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "chatInviteLinkInfo";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Chat identifier of the invite link; 0 if the user has no access to the chat before joining
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("chat_id")]
            public long ChatId { get; set; }

            /// <summary>
            /// If non-zero, the amount of time for which read access to the chat will remain available, in seconds
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("accessible_for")]
            public int AccessibleFor { get; set; }

            /// <summary>
            /// Type of the chat
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("type")]
            public ChatType Type { get; set; }

            /// <summary>
            /// Title of the chat
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("title")]
            public string Title { get; set; }

            /// <summary>
            /// Chat photo; may be null
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("photo")]
            public ChatPhotoInfo Photo { get; set; }

            /// <summary>
            /// 
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("description")]
            public string Description { get; set; }

            /// <summary>
            /// Number of members in the chat
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("member_count")]
            public int MemberCount { get; set; }

            /// <summary>
            /// User identifiers of some chat members that may be known to the current user
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("member_user_ids")]
            public long[] MemberUserIds { get; set; }

            /// <summary>
            /// True, if the link only creates join request
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("creates_join_request")]
            public bool CreatesJoinRequest { get; set; }

            /// <summary>
            /// True, if the chat is a public supergroup or channel, i.e. it has a username or it is a location-based supergroup
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("is_public")]
            public bool IsPublic { get; set; }
        }
    }
}