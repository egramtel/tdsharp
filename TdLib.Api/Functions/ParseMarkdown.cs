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
        /// Parses Markdown entities in a human-friendly format, ignoring markup errors. Can be called synchronously
        /// </summary>
        public class ParseMarkdown : Function<FormattedText>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "parseMarkdown";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The text to parse. For example, "__italic__ ~~strikethrough~~ ||spoiler|| **bold** `code` ```pre``` __[italic__ text_url](telegram.org) __italic**bold italic__bold**"
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("text")]
            public FormattedText Text { get; set; }
        }

        /// <summary>
        /// Parses Markdown entities in a human-friendly format, ignoring markup errors. Can be called synchronously
        /// </summary>
        public static Task<FormattedText> ParseMarkdownAsync(
            this Client client, FormattedText text = default)
        {
            return client.ExecuteAsync(new ParseMarkdown
            {
                Text = text
            });
        }
    }
}
// REUSE-IgnoreEnd