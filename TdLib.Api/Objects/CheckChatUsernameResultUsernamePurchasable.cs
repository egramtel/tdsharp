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
            /// The username can be purchased at fragment.com
            /// </summary>
            public class CheckChatUsernameResultUsernamePurchasable : CheckChatUsernameResult
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "checkChatUsernameResultUsernamePurchasable";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }


            }
        }
    }
}