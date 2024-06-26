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
        /// Toggles whether the message history of a supergroup is available to new members; requires can_change_info member right
        /// </summary>
        public class ToggleSupergroupIsAllHistoryAvailable : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "toggleSupergroupIsAllHistoryAvailable";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The identifier of the supergroup
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("supergroup_id")]
            public long SupergroupId { get; set; }

            /// <summary>
            /// The new value of is_all_history_available
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("is_all_history_available")]
            public bool IsAllHistoryAvailable { get; set; }
        }

        /// <summary>
        /// Toggles whether the message history of a supergroup is available to new members; requires can_change_info member right
        /// </summary>
        public static Task<Ok> ToggleSupergroupIsAllHistoryAvailableAsync(
            this Client client, long supergroupId = default, bool isAllHistoryAvailable = default)
        {
            return client.ExecuteAsync(new ToggleSupergroupIsAllHistoryAvailable
            {
                SupergroupId = supergroupId, IsAllHistoryAvailable = isAllHistoryAvailable
            });
        }
    }
}
// REUSE-IgnoreEnd