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
        public partial class InternalLinkType : Object
        {
            /// <summary>
            /// The link can be used to confirm ownership of a phone number to prevent account deletion. Call sendPhoneNumberCode with the given phone number and with phoneNumberCodeTypeConfirmOwnership with the given hash to process the link.
            /// If succeeded, call checkPhoneNumberCode to check entered by the user code, or resendPhoneNumberCode to resend it
            /// </summary>
            public class InternalLinkTypePhoneNumberConfirmation : InternalLinkType
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "internalLinkTypePhoneNumberConfirmation";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Hash value from the link
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("hash")]
                public string Hash { get; set; }

                /// <summary>
                /// Phone number value from the link
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("phone_number")]
                public string PhoneNumber { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd