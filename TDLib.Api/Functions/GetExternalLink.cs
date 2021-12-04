using System;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        /// <summary>
        /// Returns an HTTP URL which can be used to automatically authorize the current user on a website after clicking an HTTP link. Use the method getExternalLinkInfo to find whether a prior user confirmation is needed
        /// </summary>
        public class GetExternalLink : Function<HttpUrl>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getExternalLink";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The HTTP link
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("link")]
            public string Link { get; set; }

            /// <summary>
            /// True, if the current user allowed the bot, returned in getExternalLinkInfo, to send them messages
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("allow_write_access")]
            public bool AllowWriteAccess { get; set; }
        }

        /// <summary>
        /// Returns an HTTP URL which can be used to automatically authorize the current user on a website after clicking an HTTP link. Use the method getExternalLinkInfo to find whether a prior user confirmation is needed
        /// </summary>
        public static Task<HttpUrl> GetExternalLinkAsync(
            this Client client, string link = default, bool allowWriteAccess = default)
        {
            return client.ExecuteAsync(new GetExternalLink
            {
                Link = link, AllowWriteAccess = allowWriteAccess
            });
        }
    }
}