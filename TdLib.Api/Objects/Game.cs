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
        /// Describes a game. Use getInternalLink with internalLinkTypeGame to share the game
        /// </summary>
        public partial class Game : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "game";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Unique game identifier
            /// </summary>
            [JsonConverter(typeof(Converter.Int64))]
            [JsonProperty("id")]
            public long Id { get; set; }

            /// <summary>
            /// Game short name
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("short_name")]
            public string ShortName { get; set; }

            /// <summary>
            /// Game title
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("title")]
            public string Title { get; set; }

            /// <summary>
            /// Game text, usually containing scoreboards for a game
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("text")]
            public FormattedText Text { get; set; }

            /// <summary>
            /// 
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("description")]
            public string Description { get; set; }

            /// <summary>
            /// Game photo
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("photo")]
            public Photo Photo { get; set; }

            /// <summary>
            /// Game animation; may be null
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("animation")]
            public Animation Animation { get; set; }
        }
    }
}
// REUSE-IgnoreEnd