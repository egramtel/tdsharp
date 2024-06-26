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
        public partial class StoryOrigin : Object
        {
            /// <summary>
            /// The original story was sent by an unknown user
            /// </summary>
            public class StoryOriginHiddenUser : StoryOrigin
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "storyOriginHiddenUser";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Name of the story sender
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("sender_name")]
                public string SenderName { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd