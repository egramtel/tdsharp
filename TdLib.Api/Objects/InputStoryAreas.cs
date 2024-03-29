using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        /// <summary>
        /// Contains a list of story areas to be added
        /// </summary>
        public partial class InputStoryAreas : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "inputStoryAreas";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// List of 0-10 input story areas
            /// </summary>
            [JsonProperty("areas", ItemConverterType = typeof(Converter))]
            public InputStoryArea[] Areas { get; set; }
        }
    }
}