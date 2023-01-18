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
        /// Changes order of active usernames of a supergroup or channel, requires owner privileges in the supergroup or channel
        /// </summary>
        public class ReorderSupergroupActiveUsernames : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "reorderSupergroupActiveUsernames";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the supergroup or channel
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("supergroup_id")]
            public long SupergroupId { get; set; }

            /// <summary>
            /// The new order of active usernames. All currently active usernames must be specified
            /// </summary>
            [JsonProperty("usernames", ItemConverterType = typeof(Converter))]
            public string[] Usernames { get; set; }
        }

        /// <summary>
        /// Changes order of active usernames of a supergroup or channel, requires owner privileges in the supergroup or channel
        /// </summary>
        public static Task<Ok> ReorderSupergroupActiveUsernamesAsync(
            this Client client, long supergroupId = default, string[] usernames = default)
        {
            return client.ExecuteAsync(new ReorderSupergroupActiveUsernames
            {
                SupergroupId = supergroupId, Usernames = usernames
            });
        }
    }
}