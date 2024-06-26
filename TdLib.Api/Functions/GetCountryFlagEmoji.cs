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
        /// Returns an emoji for the given country. Returns an empty string on failure. Can be called synchronously
        /// </summary>
        public class GetCountryFlagEmoji : Function<Text>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getCountryFlagEmoji";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// A two-letter ISO 3166-1 alpha-2 country code as received from getCountries
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("country_code")]
            public string CountryCode { get; set; }
        }

        /// <summary>
        /// Returns an emoji for the given country. Returns an empty string on failure. Can be called synchronously
        /// </summary>
        public static Task<Text> GetCountryFlagEmojiAsync(
            this Client client, string countryCode = default)
        {
            return client.ExecuteAsync(new GetCountryFlagEmoji
            {
                CountryCode = countryCode
            });
        }
    }
}
// REUSE-IgnoreEnd