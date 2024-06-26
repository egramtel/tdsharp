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
        /// Returns information about a limit, increased for Premium users. Returns a 404 error if the limit is unknown
        /// </summary>
        public class GetPremiumLimit : Function<PremiumLimit>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getPremiumLimit";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Type of the limit
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("limit_type")]
            public PremiumLimitType LimitType { get; set; }
        }

        /// <summary>
        /// Returns information about a limit, increased for Premium users. Returns a 404 error if the limit is unknown
        /// </summary>
        public static Task<PremiumLimit> GetPremiumLimitAsync(
            this Client client, PremiumLimitType limitType = default)
        {
            return client.ExecuteAsync(new GetPremiumLimit
            {
                LimitType = limitType
            });
        }
    }
}
// REUSE-IgnoreEnd