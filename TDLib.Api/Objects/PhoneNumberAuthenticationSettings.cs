using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public partial class TdApi
    {
        /// <summary>
        /// A personal document, containing some information about a user 
        /// </summary>
        public class PhoneNumberAuthenticationSettings : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "phoneNumberAuthenticationSettings";

            /// <summary>
            /// Extra data attached to the message
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }
            
            /// <summary>
            /// Pass true if the authentication code may be sent via flash call to the specified phone number 
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("allow_flash_call")]
            public bool AllowFlashCall { get; set; }

            /// <summary>
            /// Pass true if the phone number is used on the current device. Ignored if allow_flash_call is false
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("is_current_phone_number")]
            public bool IsCurrentPhoneNumber { get; set; }
            
            /// <summary>
            /// For official applications only. True, if the app can use Android SMS Retriever API (requires Google Play Services >= 10.2) to automatically receive the authentication code from the SMS. See https://developers.google.com/identity/sms-retriever/ for more details.
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("allow_sms_retriever_api")]
            public bool AllowSmsRetrieverApi { get; set; }
        }
    }
}