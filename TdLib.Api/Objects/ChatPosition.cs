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
        /// Describes a position of a chat in a chat list
        /// </summary>
        public partial class ChatPosition : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "chatPosition";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The chat list
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("list")]
            public ChatList List { get; set; }

            /// <summary>
            /// A parameter used to determine order of the chat in the chat list. Chats must be sorted by the pair (order, chat.id) in descending order
            /// </summary>
            [JsonConverter(typeof(Converter.Int64))]
            [JsonProperty("order")]
            public long Order { get; set; }

            /// <summary>
            /// True, if the chat is pinned in the chat list
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("is_pinned")]
            public bool IsPinned { get; set; }

            /// <summary>
            /// Source of the chat in the chat list; may be null
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("source")]
            public ChatSource Source { get; set; }
        }
    }
}
// REUSE-IgnoreEnd