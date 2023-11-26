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
        /// Confirms an unconfirmed session of the current user from another device
        /// </summary>
        public class ConfirmSession : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "confirmSession";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Session identifier
            /// </summary>
            [JsonConverter(typeof(Converter.Int64))]
            [JsonProperty("session_id")]
            public long SessionId { get; set; }
        }

        /// <summary>
        /// Confirms an unconfirmed session of the current user from another device
        /// </summary>
        public static Task<Ok> ConfirmSessionAsync(
            this Client client, long sessionId = default)
        {
            return client.ExecuteAsync(new ConfirmSession
            {
                SessionId = sessionId
            });
        }
    }
}