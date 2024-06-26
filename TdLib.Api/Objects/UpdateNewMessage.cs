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
            /// A new message was received; can also be an outgoing message
            /// </summary>
            public class UpdateNewMessage : Update
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "updateNewMessage";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// The new message
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("message")]
                public Message Message { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd