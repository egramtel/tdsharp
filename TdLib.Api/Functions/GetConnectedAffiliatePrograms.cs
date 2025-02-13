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
        /// Returns affiliate programs that were connected to the given affiliate
        /// </summary>
        public class GetConnectedAffiliatePrograms : Function<ConnectedAffiliatePrograms>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getConnectedAffiliatePrograms";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The affiliate to which the affiliate program were connected
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("affiliate")]
            public AffiliateType Affiliate { get; set; }

            /// <summary>
            /// Offset of the first affiliate program to return as received from the previous request; use empty string to get the first chunk of results
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("offset")]
            public string Offset { get; set; }

            /// <summary>
            /// The maximum number of affiliate programs to return
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("limit")]
            public int Limit { get; set; }
        }

        /// <summary>
        /// Returns affiliate programs that were connected to the given affiliate
        /// </summary>
        public static Task<ConnectedAffiliatePrograms> GetConnectedAffiliateProgramsAsync(
            this Client client, AffiliateType affiliate = default, string offset = default, int limit = default)
        {
            return client.ExecuteAsync(new GetConnectedAffiliatePrograms
            {
                Affiliate = affiliate, Offset = offset, Limit = limit
            });
        }
    }
}
// REUSE-IgnoreEnd