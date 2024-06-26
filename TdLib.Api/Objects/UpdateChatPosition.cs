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
        public partial class Update : Object
        {
            /// <summary>
            /// The position of a chat in a chat list has changed. An updateChatLastMessage or updateChatDraftMessage update might be sent instead of the update
            /// </summary>
            public class UpdateChatPosition : Update
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "updateChatPosition";

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
                /// New chat position. If new order is 0, then the chat needs to be removed from the list
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("position")]
                public ChatPosition Position { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd