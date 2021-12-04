using System;
using Newtonsoft.Json;

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
            /// The user has chosen a result of an inline query; for bots only
            /// </summary>
            public class UpdateNewChosenInlineResult : Update
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "updateNewChosenInlineResult";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Identifier of the user who sent the query
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("sender_user_id")]
                public long SenderUserId { get; set; }

                /// <summary>
                /// User location; may be null
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("user_location")]
                public Location UserLocation { get; set; }

                /// <summary>
                /// Text of the query
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("query")]
                public string Query { get; set; }

                /// <summary>
                /// Identifier of the chosen result
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("result_id")]
                public string ResultId { get; set; }

                /// <summary>
                /// Identifier of the sent inline message, if known
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("inline_message_id")]
                public string InlineMessageId { get; set; }
            }
        }
    }
}