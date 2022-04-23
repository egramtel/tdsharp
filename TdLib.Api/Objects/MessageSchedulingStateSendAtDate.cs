using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        public partial class MessageSchedulingState : Object
        {
            /// <summary>
            /// Contains information about the time when a scheduled message will be sent
            /// </summary>
            public class MessageSchedulingStateSendAtDate : MessageSchedulingState
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "messageSchedulingStateSendAtDate";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Date the message will be sent. The date must be within 367 days in the future
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("send_date")]
                public int SendDate { get; set; }
            }
        }
    }
}