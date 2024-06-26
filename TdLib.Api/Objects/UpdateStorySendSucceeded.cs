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
            /// A story has been successfully sent
            /// </summary>
            public class UpdateStorySendSucceeded : Update
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "updateStorySendSucceeded";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// The sent story
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("story")]
                public Story Story { get; set; }

                /// <summary>
                /// The previous temporary story identifier
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("old_story_id")]
                public int OldStoryId { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd