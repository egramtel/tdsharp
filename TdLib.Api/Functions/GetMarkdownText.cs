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
        /// Replaces text entities with Markdown formatting in a human-friendly format. Entities that can't be represented in Markdown unambiguously are kept as is. Can be called synchronously
        /// </summary>
        public class GetMarkdownText : Function<FormattedText>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getMarkdownText";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The text
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("text")]
            public FormattedText Text { get; set; }
        }

        /// <summary>
        /// Replaces text entities with Markdown formatting in a human-friendly format. Entities that can't be represented in Markdown unambiguously are kept as is. Can be called synchronously
        /// </summary>
        public static Task<FormattedText> GetMarkdownTextAsync(
            this Client client, FormattedText text = default)
        {
            return client.ExecuteAsync(new GetMarkdownText
            {
                Text = text
            });
        }
    }
}
// REUSE-IgnoreEnd