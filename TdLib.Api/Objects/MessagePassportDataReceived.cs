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
        public partial class MessageContent : Object
        {
            /// <summary>
            /// Telegram Passport data has been received; for bots only
            /// </summary>
            public class MessagePassportDataReceived : MessageContent
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "messagePassportDataReceived";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// List of received Telegram Passport elements
                /// </summary>
                [JsonProperty("elements", ItemConverterType = typeof(Converter))]
                public EncryptedPassportElement[] Elements { get; set; }

                /// <summary>
                /// Encrypted data credentials
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("credentials")]
                public EncryptedCredentials Credentials { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd