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
        public partial class InternalLinkType : Object
        {
            /// <summary>
            /// The link is a link to an invoice. Call getPaymentForm with the given invoice name to process the link
            /// </summary>
            public class InternalLinkTypeInvoice : InternalLinkType
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "internalLinkTypeInvoice";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Name of the invoice
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("invoice_name")]
                public string InvoiceName { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd