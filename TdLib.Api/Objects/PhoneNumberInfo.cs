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
        /// Contains information about a phone number
        /// </summary>
        public partial class PhoneNumberInfo : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "phoneNumberInfo";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Information about the country to which the phone number belongs; may be null
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("country")]
            public CountryInfo Country { get; set; }

            /// <summary>
            /// The part of the phone number denoting country calling code or its part
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("country_calling_code")]
            public string CountryCallingCode { get; set; }

            /// <summary>
            /// The phone number without country calling code formatted accordingly to local rules. Expected digits are returned as '-', but even more digits might be entered by the user
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("formatted_phone_number")]
            public string FormattedPhoneNumber { get; set; }

            /// <summary>
            /// True, if the phone number was bought at https://fragment.com and isn't tied to a SIM card. Information about the phone number can be received using getCollectibleItemInfo
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("is_anonymous")]
            public bool IsAnonymous { get; set; }
        }
    }
}
// REUSE-IgnoreEnd