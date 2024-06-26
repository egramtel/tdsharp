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
        public partial class AuthenticationCodeType : Object
        {
            /// <summary>
            /// An authentication code is delivered by an immediately canceled call to the specified phone number. The last digits of the phone number that calls are the code that must be entered manually by the user
            /// </summary>
            public class AuthenticationCodeTypeMissedCall : AuthenticationCodeType
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "authenticationCodeTypeMissedCall";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Prefix of the phone number from which the call will be made
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("phone_number_prefix")]
                public string PhoneNumberPrefix { get; set; }

                /// <summary>
                /// Number of digits in the code, excluding the prefix
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("length")]
                public int Length { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd