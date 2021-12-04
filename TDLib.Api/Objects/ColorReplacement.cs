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
        /// Describes a color replacement for animated emoji
        /// </summary>
        public partial class ColorReplacement : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "colorReplacement";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Original animated emoji color in the RGB24 format
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("old_color")]
            public int OldColor { get; set; }

            /// <summary>
            /// Replacement animated emoji color in the RGB24 format
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("new_color")]
            public int NewColor { get; set; }
        }
    }
}