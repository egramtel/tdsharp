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
        /// Returns examples of possible upgraded gifts for a regular gift
        /// </summary>
        public class GetGiftUpgradePreview : Function<GiftUpgradePreview>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getGiftUpgradePreview";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the gift
            /// </summary>
            [JsonConverter(typeof(Converter.Int64))]
            [JsonProperty("gift_id")]
            public long GiftId { get; set; }
        }

        /// <summary>
        /// Returns examples of possible upgraded gifts for a regular gift
        /// </summary>
        public static Task<GiftUpgradePreview> GetGiftUpgradePreviewAsync(
            this Client client, long giftId = default)
        {
            return client.ExecuteAsync(new GetGiftUpgradePreview
            {
                GiftId = giftId
            });
        }
    }
}
// REUSE-IgnoreEnd