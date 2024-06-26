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
        /// Contains information about supported accent colors for user profile photo background in RGB format
        /// </summary>
        public partial class ProfileAccentColors : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "profileAccentColors";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The list of 1-2 colors in RGB format, describing the colors, as expected to be shown in the color palette settings
            /// </summary>
            [JsonProperty("palette_colors", ItemConverterType = typeof(Converter))]
            public int[] PaletteColors { get; set; }

            /// <summary>
            /// The list of 1-2 colors in RGB format, describing the colors, as expected to be used for the profile photo background
            /// </summary>
            [JsonProperty("background_colors", ItemConverterType = typeof(Converter))]
            public int[] BackgroundColors { get; set; }

            /// <summary>
            /// The list of 2 colors in RGB format, describing the colors of the gradient to be used for the unread active story indicator around profile photo
            /// </summary>
            [JsonProperty("story_colors", ItemConverterType = typeof(Converter))]
            public int[] StoryColors { get; set; }
        }
    }
}
// REUSE-IgnoreEnd