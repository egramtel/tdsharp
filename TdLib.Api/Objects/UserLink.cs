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
        /// Contains an HTTPS URL, which can be used to get information about a user
        /// </summary>
        public partial class UserLink : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "userLink";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The URL
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("url")]
            public string Url { get; set; }

            /// <summary>
            /// Left time for which the link is valid, in seconds; 0 if the link is a public username link
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("expires_in")]
            public int ExpiresIn { get; set; }
        }
    }
}
// REUSE-IgnoreEnd