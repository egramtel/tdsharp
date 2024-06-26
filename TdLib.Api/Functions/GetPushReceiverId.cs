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
        /// Returns a globally unique push notification subscription identifier for identification of an account, which has received a push notification. Can be called synchronously
        /// </summary>
        public class GetPushReceiverId : Function<PushReceiverId>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getPushReceiverId";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// JSON-encoded push notification payload
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("payload")]
            public string Payload { get; set; }
        }

        /// <summary>
        /// Returns a globally unique push notification subscription identifier for identification of an account, which has received a push notification. Can be called synchronously
        /// </summary>
        public static Task<PushReceiverId> GetPushReceiverIdAsync(
            this Client client, string payload = default)
        {
            return client.ExecuteAsync(new GetPushReceiverId
            {
                Payload = payload
            });
        }
    }
}
// REUSE-IgnoreEnd