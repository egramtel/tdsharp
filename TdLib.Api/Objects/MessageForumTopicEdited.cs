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
            /// A forum topic has been edited
            /// </summary>
            public class MessageForumTopicEdited : MessageContent
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "messageForumTopicEdited";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// If non-empty, the new name of the topic
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("name")]
                public string Name { get; set; }

                /// <summary>
                /// True, if icon's custom_emoji_id is changed
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("edit_icon_custom_emoji_id")]
                public bool EditIconCustomEmojiId { get; set; }

                /// <summary>
                /// New unique identifier of the custom emoji shown on the topic icon; 0 if none. Must be ignored if edit_icon_custom_emoji_id is false
                /// </summary>
                [JsonConverter(typeof(Converter.Int64))]
                [JsonProperty("icon_custom_emoji_id")]
                public long IconCustomEmojiId { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd