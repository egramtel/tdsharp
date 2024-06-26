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
            /// The has_protected_content setting of a channel was toggled
            /// </summary>
            public class ChatEventHasProtectedContentToggled : ChatEventAction
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "chatEventHasProtectedContentToggled";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// New value of has_protected_content
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("has_protected_content")]
                public bool HasProtectedContent { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd