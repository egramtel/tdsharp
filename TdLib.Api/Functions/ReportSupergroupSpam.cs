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
        /// Reports messages in a supergroup as spam; requires administrator rights in the supergroup
        /// </summary>
        public class ReportSupergroupSpam : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "reportSupergroupSpam";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Supergroup identifier
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("supergroup_id")]
            public long SupergroupId { get; set; }

            /// <summary>
            /// Identifiers of messages to report. Use messageProperties.can_report_supergroup_spam to check whether the message can be reported
            /// </summary>
            [JsonProperty("message_ids", ItemConverterType = typeof(Converter))]
            public long[] MessageIds { get; set; }
        }

        /// <summary>
        /// Reports messages in a supergroup as spam; requires administrator rights in the supergroup
        /// </summary>
        public static Task<Ok> ReportSupergroupSpamAsync(
            this Client client, long supergroupId = default, long[] messageIds = default)
        {
            return client.ExecuteAsync(new ReportSupergroupSpam
            {
                SupergroupId = supergroupId, MessageIds = messageIds
            });
        }
    }
}
// REUSE-IgnoreEnd