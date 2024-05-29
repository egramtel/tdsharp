using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        public partial class ReportChatSponsoredMessageResult : Object
        {
            /// <summary>
            /// The user must choose an option to report the message and repeat request with the chosen option
            /// </summary>
            public class ReportChatSponsoredMessageResultOptionRequired : ReportChatSponsoredMessageResult
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "reportChatSponsoredMessageResultOptionRequired";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Title for the option choice
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("title")]
                public string Title { get; set; }

                /// <summary>
                /// List of available options
                /// </summary>
                [JsonProperty("options", ItemConverterType = typeof(Converter))]
                public ReportChatSponsoredMessageOption[] Options { get; set; }
            }
        }
    }
}