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
        public partial class PageBlock : Object
        {
            /// <summary>
            /// Related articles
            /// </summary>
            public class PageBlockRelatedArticles : PageBlock
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "pageBlockRelatedArticles";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Block header
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("header")]
                public RichText Header { get; set; }

                /// <summary>
                /// List of related articles
                /// </summary>
                [JsonProperty("articles", ItemConverterType = typeof(Converter))]
                public PageBlockRelatedArticle[] Articles { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd