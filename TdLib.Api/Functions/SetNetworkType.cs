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
        /// Sets the current network type. Can be called before authorization. Calling this method forces all network connections to reopen, mitigating the delay in switching between different networks,
        /// so it must be called whenever the network is changed, even if the network type remains the same. Network type is used to check whether the library can use the network at all and also for collecting detailed network data usage statistics
        /// </summary>
        public class SetNetworkType : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "setNetworkType";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The new network type; pass null to set network type to networkTypeOther
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("type")]
            public NetworkType Type { get; set; }
        }

        /// <summary>
        /// Sets the current network type. Can be called before authorization. Calling this method forces all network connections to reopen, mitigating the delay in switching between different networks,
        /// so it must be called whenever the network is changed, even if the network type remains the same. Network type is used to check whether the library can use the network at all and also for collecting detailed network data usage statistics
        /// </summary>
        public static Task<Ok> SetNetworkTypeAsync(
            this Client client, NetworkType type = default)
        {
            return client.ExecuteAsync(new SetNetworkType
            {
                Type = type
            });
        }
    }
}