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
        /// Returns network data usage statistics. Can be called before authorization
        /// </summary>
        public class GetNetworkStatistics : Function<NetworkStatistics>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getNetworkStatistics";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Pass true to get statistics only for the current library launch
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("only_current")]
            public bool OnlyCurrent { get; set; }
        }

        /// <summary>
        /// Returns network data usage statistics. Can be called before authorization
        /// </summary>
        public static Task<NetworkStatistics> GetNetworkStatisticsAsync(
            this Client client, bool onlyCurrent = default)
        {
            return client.ExecuteAsync(new GetNetworkStatistics
            {
                OnlyCurrent = onlyCurrent
            });
        }
    }
}
// REUSE-IgnoreEnd