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
        public partial class StarTransactionType : Object
        {
            /// <summary>
            /// The transaction is an upgrade of a gift; for regular users only
            /// </summary>
            public class StarTransactionTypeGiftUpgrade : StarTransactionType
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "starTransactionTypeGiftUpgrade";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// The upgraded gift
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("gift")]
                public UpgradedGift Gift { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd