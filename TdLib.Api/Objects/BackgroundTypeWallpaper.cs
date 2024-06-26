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
        public partial class BackgroundType : Object
        {
            /// <summary>
            /// Describes the type of background
            /// </summary>
            public class BackgroundTypeWallpaper : BackgroundType
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "backgroundTypeWallpaper";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// True, if the wallpaper must be downscaled to fit in 450x450 square and then box-blurred with radius 12
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("is_blurred")]
                public bool IsBlurred { get; set; }

                /// <summary>
                /// True, if the background needs to be slightly moved when device is tilted
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("is_moving")]
                public bool IsMoving { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd