using System;
using System.Threading.Tasks;
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
        /// Returns an IETF language tag of the language preferred in the country, which must be used to fill native fields in Telegram Passport personal details. Returns a 404 error if unknown
        /// </summary>
        public class GetPreferredCountryLanguage : Function<Text>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getPreferredCountryLanguage";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// A two-letter ISO 3166-1 alpha-2 country code
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("country_code")]
            public string CountryCode { get; set; }
        }

        /// <summary>
        /// Returns an IETF language tag of the language preferred in the country, which must be used to fill native fields in Telegram Passport personal details. Returns a 404 error if unknown
        /// </summary>
        public static Task<Text> GetPreferredCountryLanguageAsync(
            this Client client, string countryCode = default)
        {
            return client.ExecuteAsync(new GetPreferredCountryLanguage
            {
                CountryCode = countryCode
            });
        }
    }
}
// REUSE-IgnoreEnd