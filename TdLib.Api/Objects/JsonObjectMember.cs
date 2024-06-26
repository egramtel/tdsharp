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
        /// Represents one member of a JSON object
        /// </summary>
        public partial class JsonObjectMember : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "jsonObjectMember";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Member's key
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("key")]
            public string Key { get; set; }

            /// <summary>
            /// Member's value
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("value")]
            public JsonValue Value { get; set; }
        }
    }
}
// REUSE-IgnoreEnd