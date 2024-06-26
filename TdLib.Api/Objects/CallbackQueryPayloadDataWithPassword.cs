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
        public partial class CallbackQueryPayload : Object
        {
            /// <summary>
            /// The payload for a callback button requiring password
            /// </summary>
            public class CallbackQueryPayloadDataWithPassword : CallbackQueryPayload
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "callbackQueryPayloadDataWithPassword";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// The 2-step verification password for the current user
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("password")]
                public string Password { get; set; }

                /// <summary>
                /// Data that was attached to the callback button
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("data")]
                public byte[] Data { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd