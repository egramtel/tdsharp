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
        public partial class RichText : Object
        {
            /// <summary>
            /// A link to an anchor on the same page
            /// </summary>
            public class RichTextAnchorLink : RichText
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "richTextAnchorLink";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// The link text
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("text")]
                public RichText Text { get; set; }

                /// <summary>
                /// The anchor name. If the name is empty, the link must bring back to top
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("anchor_name")]
                public string AnchorName { get; set; }

                /// <summary>
                /// An HTTP URL, opening the anchor
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("url")]
                public string Url { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd