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
        public partial class ResetPasswordResult : Object
        {
            /// <summary>
            /// The password reset request was declined
            /// </summary>
            public class ResetPasswordResultDeclined : ResetPasswordResult
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "resetPasswordResultDeclined";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Point in time (Unix timestamp) when the password reset can be retried
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("retry_date")]
                public int RetryDate { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd