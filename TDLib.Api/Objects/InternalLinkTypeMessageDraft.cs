using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        public partial class InternalLinkType : Object
        {
            /// <summary>
            /// The link contains a message draft text. A share screen needs to be shown to the user, then the chosen chat must be opened and the text is added to the input field
            /// </summary>
            public class InternalLinkTypeMessageDraft : InternalLinkType
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "internalLinkTypeMessageDraft";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Message draft text
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("text")]
                public FormattedText Text { get; set; }

                /// <summary>
                /// True, if the first line of the text contains a link. If true, the input field needs to be focused and the text after the link must be selected
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("contains_link")]
                public bool ContainsLink { get; set; }
            }
        }
    }
}