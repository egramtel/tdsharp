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
        /// Represents a list of emoji categories
        /// </summary>
        public partial class EmojiCategories : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "emojiCategories";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// List of categories
            /// </summary>
            [JsonProperty("categories", ItemConverterType = typeof(Converter))]
            public EmojiCategory[] Categories { get; set; }
        }
    }
}
// REUSE-IgnoreEnd