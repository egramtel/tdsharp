using System;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        /// <summary>
        /// Returns the text shown on the bot's profile page and sent together with the link when users share the bot in the given language; bots only
        /// </summary>
        public class GetBotInfoShortDescription : Function<Text>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getBotInfoShortDescription";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// A two-letter ISO 639-1 language code or an empty string
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("language_code")]
            public string LanguageCode { get; set; }
        }

        /// <summary>
        /// Returns the text shown on the bot's profile page and sent together with the link when users share the bot in the given language; bots only
        /// </summary>
        public static Task<Text> GetBotInfoShortDescriptionAsync(
            this Client client, string languageCode = default)
        {
            return client.ExecuteAsync(new GetBotInfoShortDescription
            {
                LanguageCode = languageCode
            });
        }
    }
}