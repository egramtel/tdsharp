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
        /// Adds the specified data to data usage statistics. Can be called before authorization
        /// </summary>
        public class AddNetworkStatistics : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "addNetworkStatistics";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The network statistics entry with the data to be added to statistics
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("entry")]
            public NetworkStatisticsEntry Entry { get; set; }
        }

        /// <summary>
        /// Adds the specified data to data usage statistics. Can be called before authorization
        /// </summary>
        public static Task<Ok> AddNetworkStatisticsAsync(
            this Client client, NetworkStatisticsEntry entry = default)
        {
            return client.ExecuteAsync(new AddNetworkStatistics
            {
                Entry = entry
            });
        }
    }
}
// REUSE-IgnoreEnd