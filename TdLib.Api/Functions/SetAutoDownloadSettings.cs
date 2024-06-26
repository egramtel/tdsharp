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
        /// Sets auto-download settings
        /// </summary>
        public class SetAutoDownloadSettings : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "setAutoDownloadSettings";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// New user auto-download settings
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("settings")]
            public AutoDownloadSettings Settings { get; set; }

            /// <summary>
            /// Type of the network for which the new settings are relevant
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("type")]
            public NetworkType Type { get; set; }
        }

        /// <summary>
        /// Sets auto-download settings
        /// </summary>
        public static Task<Ok> SetAutoDownloadSettingsAsync(
            this Client client, AutoDownloadSettings settings = default, NetworkType type = default)
        {
            return client.ExecuteAsync(new SetAutoDownloadSettings
            {
                Settings = settings, Type = type
            });
        }
    }
}
// REUSE-IgnoreEnd