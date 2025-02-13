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
        /// Returns a URL for upgraded gift withdrawal in the TON blockchain as an NFT; requires owner privileges for gifts owned by a chat
        /// </summary>
        public class GetUpgradedGiftWithdrawalUrl : Function<HttpUrl>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getUpgradedGiftWithdrawalUrl";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the gift
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("received_gift_id")]
            public string ReceivedGiftId { get; set; }

            /// <summary>
            /// The 2-step verification password of the current user
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("password")]
            public string Password { get; set; }
        }

        /// <summary>
        /// Returns a URL for upgraded gift withdrawal in the TON blockchain as an NFT; requires owner privileges for gifts owned by a chat
        /// </summary>
        public static Task<HttpUrl> GetUpgradedGiftWithdrawalUrlAsync(
            this Client client, string receivedGiftId = default, string password = default)
        {
            return client.ExecuteAsync(new GetUpgradedGiftWithdrawalUrl
            {
                ReceivedGiftId = receivedGiftId, Password = password
            });
        }
    }
}
// REUSE-IgnoreEnd