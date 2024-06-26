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
        /// Represents a button to be shown above inline query results
        /// </summary>
        public partial class InlineQueryResultsButton : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "inlineQueryResultsButton";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The text of the button
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("text")]
            public string Text { get; set; }

            /// <summary>
            /// Type of the button
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("type")]
            public InlineQueryResultsButtonType Type { get; set; }
        }
    }
}
// REUSE-IgnoreEnd