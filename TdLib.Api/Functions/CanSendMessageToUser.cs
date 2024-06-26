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
        /// Check whether the current user can message another user or try to create a chat with them
        /// </summary>
        public class CanSendMessageToUser : Function<CanSendMessageToUserResult>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "canSendMessageToUser";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the other user
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("user_id")]
            public long UserId { get; set; }

            /// <summary>
            /// Pass true to get only locally available information without sending network requests
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("only_local")]
            public bool OnlyLocal { get; set; }
        }

        /// <summary>
        /// Check whether the current user can message another user or try to create a chat with them
        /// </summary>
        public static Task<CanSendMessageToUserResult> CanSendMessageToUserAsync(
            this Client client, long userId = default, bool onlyLocal = default)
        {
            return client.ExecuteAsync(new CanSendMessageToUser
            {
                UserId = userId, OnlyLocal = onlyLocal
            });
        }
    }
}
// REUSE-IgnoreEnd