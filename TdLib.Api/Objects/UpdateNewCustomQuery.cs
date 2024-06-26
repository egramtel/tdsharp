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
            /// A new incoming query; for bots only
            /// </summary>
            public class UpdateNewCustomQuery : Update
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "updateNewCustomQuery";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// The query identifier
                /// </summary>
                [JsonConverter(typeof(Converter.Int64))]
                [JsonProperty("id")]
                public long Id { get; set; }

                /// <summary>
                /// JSON-serialized query data
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("data")]
                public string Data { get; set; }

                /// <summary>
                /// Query timeout
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("timeout")]
                public int Timeout { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd