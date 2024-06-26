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
        /// Returns saved notification sound by its identifier. Returns a 404 error if there is no saved notification sound with the specified identifier
        /// </summary>
        public class GetSavedNotificationSound : Function<NotificationSounds>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getSavedNotificationSound";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the notification sound
            /// </summary>
            [JsonConverter(typeof(Converter.Int64))]
            [JsonProperty("notification_sound_id")]
            public long NotificationSoundId { get; set; }
        }

        /// <summary>
        /// Returns saved notification sound by its identifier. Returns a 404 error if there is no saved notification sound with the specified identifier
        /// </summary>
        public static Task<NotificationSounds> GetSavedNotificationSoundAsync(
            this Client client, long notificationSoundId = default)
        {
            return client.ExecuteAsync(new GetSavedNotificationSound
            {
                NotificationSoundId = notificationSoundId
            });
        }
    }
}
// REUSE-IgnoreEnd