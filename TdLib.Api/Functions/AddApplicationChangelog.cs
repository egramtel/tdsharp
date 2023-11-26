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
        /// Adds server-provided application changelog as messages to the chat 777000 (Telegram) or as a stories; for official applications only. Returns a 404 error if nothing changed
        /// </summary>
        public class AddApplicationChangelog : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "addApplicationChangelog";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The previous application version
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("previous_application_version")]
            public string PreviousApplicationVersion { get; set; }
        }

        /// <summary>
        /// Adds server-provided application changelog as messages to the chat 777000 (Telegram) or as a stories; for official applications only. Returns a 404 error if nothing changed
        /// </summary>
        public static Task<Ok> AddApplicationChangelogAsync(
            this Client client, string previousApplicationVersion = default)
        {
            return client.ExecuteAsync(new AddApplicationChangelog
            {
                PreviousApplicationVersion = previousApplicationVersion
            });
        }
    }
}