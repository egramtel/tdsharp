using System;
using System.Threading.Tasks;
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
        /// Disconnects an affiliate program from the given affiliate and immediately deactivates its referral link. Returns updated information about the disconnected affiliate program
        /// </summary>
        public class DisconnectAffiliateProgram : Function<ConnectedAffiliateProgram>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "disconnectAffiliateProgram";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The affiliate to which the affiliate program is connected
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("affiliate")]
            public AffiliateType Affiliate { get; set; }

            /// <summary>
            /// The referral link of the affiliate program
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("url")]
            public string Url { get; set; }
        }

        /// <summary>
        /// Disconnects an affiliate program from the given affiliate and immediately deactivates its referral link. Returns updated information about the disconnected affiliate program
        /// </summary>
        public static Task<ConnectedAffiliateProgram> DisconnectAffiliateProgramAsync(
            this Client client, AffiliateType affiliate = default, string url = default)
        {
            return client.ExecuteAsync(new DisconnectAffiliateProgram
            {
                Affiliate = affiliate, Url = url
            });
        }
    }
}
// REUSE-IgnoreEnd