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
        /// Describes position of a clickable rectangle area on a story media
        /// </summary>
        public partial class StoryAreaPosition : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "storyAreaPosition";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The abscissa of the rectangle's center, as a percentage of the media width
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("x_percentage")]
            public double? XPercentage { get; set; }

            /// <summary>
            /// The ordinate of the rectangle's center, as a percentage of the media height
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("y_percentage")]
            public double? YPercentage { get; set; }

            /// <summary>
            /// The width of the rectangle, as a percentage of the media width
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("width_percentage")]
            public double? WidthPercentage { get; set; }

            /// <summary>
            /// The height of the rectangle, as a percentage of the media height
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("height_percentage")]
            public double? HeightPercentage { get; set; }

            /// <summary>
            /// Clockwise rotation angle of the rectangle, in degrees; 0-360
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("rotation_angle")]
            public double? RotationAngle { get; set; }
        }
    }
}