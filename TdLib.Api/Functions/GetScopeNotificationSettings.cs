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
        /// Returns the notification settings for chats of a given type
        /// </summary>
        public class GetScopeNotificationSettings : Function<ScopeNotificationSettings>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getScopeNotificationSettings";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Types of chats for which to return the notification settings information
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("scope")]
            public NotificationSettingsScope Scope { get; set; }
        }

        /// <summary>
        /// Returns the notification settings for chats of a given type
        /// </summary>
        public static Task<ScopeNotificationSettings> GetScopeNotificationSettingsAsync(
            this Client client, NotificationSettingsScope scope = default)
        {
            return client.ExecuteAsync(new GetScopeNotificationSettings
            {
                Scope = scope
            });
        }
    }
}
// REUSE-IgnoreEnd