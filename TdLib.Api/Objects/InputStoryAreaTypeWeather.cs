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
        public partial class InputStoryAreaType : Object
        {
            /// <summary>
            /// An area with information about weather
            /// </summary>
            public class InputStoryAreaTypeWeather : InputStoryAreaType
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "inputStoryAreaTypeWeather";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Temperature, in degree Celsius
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("temperature")]
                public double? Temperature { get; set; }

                /// <summary>
                /// Emoji representing the weather
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("emoji")]
                public string Emoji { get; set; }

                /// <summary>
                /// A color of the area background in the ARGB format
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("background_color")]
                public int BackgroundColor { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd