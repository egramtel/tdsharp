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
        /// <summary>
        /// Represents a ready to send inline message. Use sendInlineQueryResultMessage to send the message
        /// </summary>
        public partial class PreparedInlineMessage : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "preparedInlineMessage";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Unique identifier of the inline query to pass to sendInlineQueryResultMessage
            /// </summary>
            [JsonConverter(typeof(Converter.Int64))]
            [JsonProperty("inline_query_id")]
            public long InlineQueryId { get; set; }

            /// <summary>
            /// Resulted inline message of the query
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("result")]
            public InlineQueryResult Result { get; set; }

            /// <summary>
            /// Types of the chats to which the message can be sent
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("chat_types")]
            public TargetChatTypes ChatTypes { get; set; }
        }
    }
}
// REUSE-IgnoreEnd