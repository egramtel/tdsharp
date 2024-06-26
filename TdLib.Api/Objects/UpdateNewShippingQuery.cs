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
        public partial class Update : Object
        {
            /// <summary>
            /// A new incoming shipping query; for bots only. Only for invoices with flexible price
            /// </summary>
            public class UpdateNewShippingQuery : Update
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "updateNewShippingQuery";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Unique query identifier
                /// </summary>
                [JsonConverter(typeof(Converter.Int64))]
                [JsonProperty("id")]
                public long Id { get; set; }

                /// <summary>
                /// Identifier of the user who sent the query
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("sender_user_id")]
                public long SenderUserId { get; set; }

                /// <summary>
                /// Invoice payload
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("invoice_payload")]
                public string InvoicePayload { get; set; }

                /// <summary>
                /// User shipping address
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("shipping_address")]
                public Address ShippingAddress { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd