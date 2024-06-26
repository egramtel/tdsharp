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
        public partial class CheckChatUsernameResult : Object
        {
            /// <summary>
            /// The username can be purchased at https://fragment.com. Information about the username can be received using getCollectibleItemInfo
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
// REUSE-IgnoreEnd