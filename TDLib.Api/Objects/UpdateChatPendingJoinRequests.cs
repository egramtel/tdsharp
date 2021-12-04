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
            /// The chat pending join requests were changed
            /// </summary>
            public class UpdateChatPendingJoinRequests : Update
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "updateChatPendingJoinRequests";

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
                /// The new data about pending join requests; may be null
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("pending_join_requests")]
                public ChatJoinRequestsInfo PendingJoinRequests { get; set; }
            }
        }
    }
}