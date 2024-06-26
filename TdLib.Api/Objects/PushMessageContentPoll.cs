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
        public partial class PushMessageContent : Object
        {
            /// <summary>
            /// A message with a poll
            /// </summary>
            public class PushMessageContentPoll : PushMessageContent
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "pushMessageContentPoll";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Poll question
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("question")]
                public string Question { get; set; }

                /// <summary>
                /// True, if the poll is regular and not in quiz mode
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("is_regular")]
                public bool IsRegular { get; set; }

                /// <summary>
                /// True, if the message is a pinned message with the specified content
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("is_pinned")]
                public bool IsPinned { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd