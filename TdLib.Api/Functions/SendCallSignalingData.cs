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
        /// Sends call signaling data
        /// </summary>
        public class SendCallSignalingData : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "sendCallSignalingData";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Call identifier
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("call_id")]
            public int CallId { get; set; }

            /// <summary>
            /// The data
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("data")]
            public byte[] Data { get; set; }
        }

        /// <summary>
        /// Sends call signaling data
        /// </summary>
        public static Task<Ok> SendCallSignalingDataAsync(
            this Client client, int callId = default, byte[] data = default)
        {
            return client.ExecuteAsync(new SendCallSignalingData
            {
                CallId = callId, Data = data
            });
        }
    }
}
// REUSE-IgnoreEnd