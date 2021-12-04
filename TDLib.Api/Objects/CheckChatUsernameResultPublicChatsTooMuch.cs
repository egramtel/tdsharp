using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        public partial class CheckChatUsernameResult : Object
        {
            /// <summary>
            /// The user has too much chats with username, one of them must be made private first
            /// </summary>
            public class CheckChatUsernameResultPublicChatsTooMuch : CheckChatUsernameResult
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "checkChatUsernameResultPublicChatsTooMuch";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }
            }
        }
    }
}