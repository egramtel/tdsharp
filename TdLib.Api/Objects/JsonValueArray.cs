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
        public partial class JsonValue : Object
        {
            /// <summary>
            /// Represents a JSON array
            /// </summary>
            public class JsonValueArray : JsonValue
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "jsonValueArray";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// The list of array elements
                /// </summary>
                [JsonProperty("values", ItemConverterType = typeof(Converter))]
                public JsonValue[] Values { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd