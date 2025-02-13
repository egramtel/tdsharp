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
            /// A request can't be completed unless application verification is performed; for official mobile applications only.
            /// The method setApplicationVerificationToken must be called once the verification is completed or failed
            /// </summary>
            public class UpdateApplicationVerificationRequired : Update
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "updateApplicationVerificationRequired";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Unique identifier for the verification process
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("verification_id")]
                public long VerificationId { get; set; }

                /// <summary>
                /// Unique base64url-encoded nonce for the classic Play Integrity verification (https://developer.android.com/google/play/integrity/classic) for Android,
                /// or a unique string to compare with verify_nonce field from a push notification for iOS
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("nonce")]
                public string Nonce { get; set; }

                /// <summary>
                /// Cloud project number to pass to the Play Integrity API on Android
                /// </summary>
                [JsonConverter(typeof(Converter.Int64))]
                [JsonProperty("cloud_project_number")]
                public long CloudProjectNumber { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd