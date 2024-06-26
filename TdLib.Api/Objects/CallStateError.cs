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
        public partial class CallState : Object
        {
            /// <summary>
            /// The call has ended with an error
            /// </summary>
            public class CallStateError : CallState
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "callStateError";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Error. An error with the code 4005000 will be returned if an outgoing call is missed because of an expired timeout
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("error")]
                public Error Error { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd