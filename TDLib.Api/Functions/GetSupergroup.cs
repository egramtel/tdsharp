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
        /// Returns information about a supergroup or a channel by its identifier. This is an offline request if the current user is not a bot
        /// </summary>
        public class GetSupergroup : Function<Supergroup>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getSupergroup";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Supergroup or channel identifier
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("supergroup_id")]
            public long SupergroupId { get; set; }
        }

        /// <summary>
        /// Returns information about a supergroup or a channel by its identifier. This is an offline request if the current user is not a bot
        /// </summary>
        public static Task<Supergroup> GetSupergroupAsync(
            this Client client, long supergroupId = default)
        {
            return client.ExecuteAsync(new GetSupergroup
            {
                SupergroupId = supergroupId
            });
        }
    }
}