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
        public partial class MessageContent : Object
        {
            /// <summary>
            /// A newly created video chat
            /// </summary>
            public class MessageVideoChatStarted : MessageContent
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "messageVideoChatStarted";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Identifier of the video chat. The video chat can be received through the method getGroupCall
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("group_call_id")]
                public int GroupCallId { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd