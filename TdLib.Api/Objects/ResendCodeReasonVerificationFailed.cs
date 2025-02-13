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
        public partial class ResendCodeReason : Object
        {
            /// <summary>
            /// The code is re-sent, because device verification has failed
            /// </summary>
            public class ResendCodeReasonVerificationFailed : ResendCodeReason
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "resendCodeReasonVerificationFailed";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Cause of the verification failure, for example, PLAY_SERVICES_NOT_AVAILABLE, APNS_RECEIVE_TIMEOUT, or APNS_INIT_FAILED
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("error_message")]
                public string ErrorMessage { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd