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
        /// A simple object containing a vector of objects that hold a number; for testing only
        /// </summary>
        public partial class TestVectorIntObject : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "testVectorIntObject";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Vector of objects
            /// </summary>
            [JsonProperty("value", ItemConverterType = typeof(Converter))]
            public TestInt[] Value { get; set; }
        }
    }
}
// REUSE-IgnoreEnd