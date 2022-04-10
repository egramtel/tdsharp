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
        /// Translates a text to the given language. Returns a 404 error if the translation can't be performed
        /// </summary>
        public class TranslateText : Function<Text>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "translateText";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Text to translate
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("text")]
            public string Text { get; set; }

            /// <summary>
            /// A two-letter ISO 639-1 language code of the language from which the message is translated. If empty, the language will be detected automatically
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("from_language_code")]
            public string FromLanguageCode { get; set; }

            /// <summary>
            /// A two-letter ISO 639-1 language code of the language to which the message is translated
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("to_language_code")]
            public string ToLanguageCode { get; set; }
        }

        /// <summary>
        /// Translates a text to the given language. Returns a 404 error if the translation can't be performed
        /// </summary>
        public static Task<Text> TranslateTextAsync(
            this Client client, string text = default, string fromLanguageCode = default, string toLanguageCode = default)
        {
            return client.ExecuteAsync(new TranslateText
            {
                Text = text, FromLanguageCode = fromLanguageCode, ToLanguageCode = toLanguageCode
            });
        }
    }
}