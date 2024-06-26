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
        /// Describes a background set for a specific chat
        /// </summary>
        public partial class ChatBackground : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "chatBackground";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The background
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("background")]
            public Background Background { get; set; }

            /// <summary>
            /// Dimming of the background in dark themes, as a percentage; 0-100. Applied only to Wallpaper and Fill types of background
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("dark_theme_dimming")]
            public int DarkThemeDimming { get; set; }
        }
    }
}
// REUSE-IgnoreEnd