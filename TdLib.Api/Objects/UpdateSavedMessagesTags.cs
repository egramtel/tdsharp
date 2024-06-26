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
            /// Tags used in Saved Messages or a Saved Messages topic have changed
            /// </summary>
            public class UpdateSavedMessagesTags : Update
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "updateSavedMessagesTags";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Identifier of Saved Messages topic which tags were changed; 0 if tags for the whole chat has changed
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("saved_messages_topic_id")]
                public long SavedMessagesTopicId { get; set; }

                /// <summary>
                /// The new tags
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("tags")]
                public SavedMessagesTags Tags { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd