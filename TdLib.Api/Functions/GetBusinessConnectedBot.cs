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
        /// Returns the business bot that is connected to the current user account. Returns a 404 error if there is no connected bot
        /// </summary>
        public class GetBusinessConnectedBot : Function<BusinessConnectedBot>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getBusinessConnectedBot";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }


        }

        /// <summary>
        /// Returns the business bot that is connected to the current user account. Returns a 404 error if there is no connected bot
        /// </summary>
        public static Task<BusinessConnectedBot> GetBusinessConnectedBotAsync(
            this Client client)
        {
            return client.ExecuteAsync(new GetBusinessConnectedBot
            {
                
            });
        }
    }
}
// REUSE-IgnoreEnd