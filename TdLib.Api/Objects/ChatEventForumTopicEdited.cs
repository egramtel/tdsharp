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
            /// A forum topic was edited
            /// </summary>
            public class ChatEventForumTopicEdited : ChatEventAction
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "chatEventForumTopicEdited";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Old information about the topic
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("old_topic_info")]
                public ForumTopicInfo OldTopicInfo { get; set; }

                /// <summary>
                /// New information about the topic
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("new_topic_info")]
                public ForumTopicInfo NewTopicInfo { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd