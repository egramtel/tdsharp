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
        /// Contains custom information about the user
        /// </summary>
        public partial class UserSupportInfo : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "userSupportInfo";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Information message
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("message")]
            public FormattedText Message { get; set; }

            /// <summary>
            /// Information author
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("author")]
            public string Author { get; set; }

            /// <summary>
            /// Information change date
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("date")]
            public int Date { get; set; }
        }
    }
}
// REUSE-IgnoreEnd