using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public partial class TdApi
    {
        /// <summary>
        /// New chat members were invited to a group 
        /// </summary>
        public partial class PushMessageContent : Object
        {
            /// <summary>
            /// New chat members were invited to a group 
            /// </summary>
            public class PushMessageContentChatAddMembers : PushMessageContent
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "pushMessageContentChatAddMembers";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Name of the added member 
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("member_name")]
                public string MemberName { get; set; }

                /// <summary>
                /// True, if the current user was added to the group
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("is_current_user")]
                public bool IsCurrentUser { get; set; }

                /// <summary>
                /// True, if the user has returned to the group himself
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("is_returned")]
                public bool IsReturned { get; set; }
            }
        }
    }
}