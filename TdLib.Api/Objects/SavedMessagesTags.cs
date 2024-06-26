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
        /// Contains a list of tags used in Saved Messages
        /// </summary>
        public partial class SavedMessagesTags : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "savedMessagesTags";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// List of tags
            /// </summary>
            [JsonProperty("tags", ItemConverterType = typeof(Converter))]
            public SavedMessagesTag[] Tags { get; set; }
        }
    }
}
// REUSE-IgnoreEnd