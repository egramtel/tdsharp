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
        /// Toggles whether a session can accept incoming secret chats
        /// </summary>
        public class ToggleSessionCanAcceptSecretChats : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "toggleSessionCanAcceptSecretChats";

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

            /// <summary>
            /// Pass true to allow accepting secret chats by the session; pass false otherwise
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("can_accept_secret_chats")]
            public bool CanAcceptSecretChats { get; set; }
        }

        /// <summary>
        /// Toggles whether a session can accept incoming secret chats
        /// </summary>
        public static Task<Ok> ToggleSessionCanAcceptSecretChatsAsync(
            this Client client, long sessionId = default, bool canAcceptSecretChats = default)
        {
            return client.ExecuteAsync(new ToggleSessionCanAcceptSecretChats
            {
                SessionId = sessionId, CanAcceptSecretChats = canAcceptSecretChats
            });
        }
    }
}