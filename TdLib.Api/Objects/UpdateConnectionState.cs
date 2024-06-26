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
            /// The connection state has changed. This update must be used only to show a human-readable description of the connection state
            /// </summary>
            public class UpdateConnectionState : Update
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "updateConnectionState";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// The new connection state
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("state")]
                public ConnectionState State { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd