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
        /// <summary>
        /// Contains encrypted Telegram Passport data credentials
        /// </summary>
        public partial class EncryptedCredentials : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "encryptedCredentials";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The encrypted credentials
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("data")]
            public byte[] Data { get; set; }

            /// <summary>
            /// The decrypted data hash
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("hash")]
            public byte[] Hash { get; set; }

            /// <summary>
            /// Secret for data decryption, encrypted with the service's public key
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("secret")]
            public byte[] Secret { get; set; }
        }
    }
}
// REUSE-IgnoreEnd