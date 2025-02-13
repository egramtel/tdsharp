using System;
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
        /// Represents a gift received by a user or a chat
        /// </summary>
        public partial class ReceivedGift : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "receivedGift";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Unique identifier of the received gift for the current user; only for the receiver of the gift
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("received_gift_id")]
            public string ReceivedGiftId { get; set; }

            /// <summary>
            /// Identifier of a user or a chat that sent the gift; may be null if unknown
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("sender_id")]
            public MessageSender SenderId { get; set; }

            /// <summary>
            /// Message added to the gift
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("text")]
            public FormattedText Text { get; set; }

            /// <summary>
            /// True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone are able to see them
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("is_private")]
            public bool IsPrivate { get; set; }

            /// <summary>
            /// True, if the gift is displayed on the chat's profile page; only for the receiver of the gift
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("is_saved")]
            public bool IsSaved { get; set; }

            /// <summary>
            /// True, if the gift is a regular gift that can be upgraded to a unique gift; only for the receiver of the gift
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("can_be_upgraded")]
            public bool CanBeUpgraded { get; set; }

            /// <summary>
            /// True, if the gift is an upgraded gift that can be transferred to another owner; only for the receiver of the gift
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("can_be_transferred")]
            public bool CanBeTransferred { get; set; }

            /// <summary>
            /// True, if the gift was refunded and isn't available anymore
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("was_refunded")]
            public bool WasRefunded { get; set; }

            /// <summary>
            /// Point in time (Unix timestamp) when the gift was sent
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("date")]
            public int Date { get; set; }

            /// <summary>
            /// The gift
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("gift")]
            public SentGift Gift { get; set; }

            /// <summary>
            /// Number of Telegram Stars that can be claimed by the receiver instead of the regular gift; 0 if the gift can't be sold by the current user
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("sell_star_count")]
            public long SellStarCount { get; set; }

            /// <summary>
            /// Number of Telegram Stars that were paid by the sender for the ability to upgrade the gift
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("prepaid_upgrade_star_count")]
            public long PrepaidUpgradeStarCount { get; set; }

            /// <summary>
            /// Number of Telegram Stars that must be paid to transfer the upgraded gift; only for the receiver of the gift
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("transfer_star_count")]
            public long TransferStarCount { get; set; }

            /// <summary>
            /// Point in time (Unix timestamp) when the upgraded gift can be transferred to the TON blockchain as an NFT; 0 if NFT export isn't possible; only for the receiver of the gift
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("export_date")]
            public int ExportDate { get; set; }
        }
    }
}
// REUSE-IgnoreEnd