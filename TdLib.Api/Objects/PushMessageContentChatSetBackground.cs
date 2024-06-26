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
            /// A chat background was edited
            /// </summary>
            public class PushMessageContentChatSetBackground : PushMessageContent
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "pushMessageContentChatSetBackground";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// True, if the set background is the same as the background of the current user
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("is_same")]
                public bool IsSame { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd