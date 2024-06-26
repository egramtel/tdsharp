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
        /// Changes active state for a username of the current user. The editable username can't be disabled. May return an error with a message "USERNAMES_ACTIVE_TOO_MUCH" if the maximum number of active usernames has been reached
        /// </summary>
        public class ToggleUsernameIsActive : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "toggleUsernameIsActive";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The username to change
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("username")]
            public string Username { get; set; }

            /// <summary>
            /// Pass true to activate the username; pass false to disable it
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("is_active")]
            public bool IsActive { get; set; }
        }

        /// <summary>
        /// Changes active state for a username of the current user. The editable username can't be disabled. May return an error with a message "USERNAMES_ACTIVE_TOO_MUCH" if the maximum number of active usernames has been reached
        /// </summary>
        public static Task<Ok> ToggleUsernameIsActiveAsync(
            this Client client, string username = default, bool isActive = default)
        {
            return client.ExecuteAsync(new ToggleUsernameIsActive
            {
                Username = username, IsActive = isActive
            });
        }
    }
}
// REUSE-IgnoreEnd