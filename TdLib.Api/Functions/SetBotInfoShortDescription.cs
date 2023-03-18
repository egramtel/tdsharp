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
        /// Sets the text shown on the bot's profile page and sent together with the link when users share the bot; bots only
        /// </summary>
        public class SetBotInfoShortDescription : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "setBotInfoShortDescription";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// A two-letter ISO 639-1 language code. If empty, the short description will be shown to all users, for which language there are no dedicated description
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("language_code")]
            public string LanguageCode { get; set; }

            /// <summary>
            /// New bot's short description on the specified language
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("short_description")]
            public string ShortDescription { get; set; }
        }

        /// <summary>
        /// Sets the text shown on the bot's profile page and sent together with the link when users share the bot; bots only
        /// </summary>
        public static Task<Ok> SetBotInfoShortDescriptionAsync(
            this Client client, string languageCode = default, string shortDescription = default)
        {
            return client.ExecuteAsync(new SetBotInfoShortDescription
            {
                LanguageCode = languageCode, ShortDescription = shortDescription
            });
        }
    }
}