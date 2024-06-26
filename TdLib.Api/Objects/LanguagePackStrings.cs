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
        /// Contains a list of language pack strings
        /// </summary>
        public partial class LanguagePackStrings : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "languagePackStrings";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// A list of language pack strings
            /// </summary>
            [JsonProperty("strings", ItemConverterType = typeof(Converter))]
            public LanguagePackString[] Strings { get; set; }
        }
    }
}
// REUSE-IgnoreEnd