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
        public partial class InputPassportElement : Object
        {
            /// <summary>
            /// A Telegram Passport element to be saved containing the user's phone number
            /// </summary>
            public class InputPassportElementPhoneNumber : InputPassportElement
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "inputPassportElementPhoneNumber";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// The phone number to be saved
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("phone_number")]
                public string PhoneNumber { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd