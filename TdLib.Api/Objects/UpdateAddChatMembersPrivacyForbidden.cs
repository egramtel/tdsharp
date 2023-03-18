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
            /// Adding users to a chat has failed because of their privacy settings. An invite link can be shared with the users if appropriate
            /// </summary>
            public class UpdateAddChatMembersPrivacyForbidden : Update
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "updateAddChatMembersPrivacyForbidden";

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
                /// Identifiers of users, which weren't added because of their privacy settings
                /// </summary>
                [JsonProperty("user_ids", ItemConverterType = typeof(Converter))]
                public long[] UserIds { get; set; }
            }
        }
    }
}