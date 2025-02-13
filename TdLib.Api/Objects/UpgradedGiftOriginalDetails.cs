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
        /// Describes the original details about the gift
        /// </summary>
        public partial class UpgradedGiftOriginalDetails : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "upgradedGiftOriginalDetails";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the user or the chat that sent the gift; may be null if the gift was private
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("sender_id")]
            public MessageSender SenderId { get; set; }

            /// <summary>
            /// Identifier of the user or the chat that received the gift
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("receiver_id")]
            public MessageSender ReceiverId { get; set; }

            /// <summary>
            /// Message added to the gift
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("text")]
            public FormattedText Text { get; set; }

            /// <summary>
            /// Point in time (Unix timestamp) when the gift was sent
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("date")]
            public int Date { get; set; }
        }
    }
}
// REUSE-IgnoreEnd