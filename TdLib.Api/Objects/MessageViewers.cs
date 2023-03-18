using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        /// <summary>
        /// Represents a list of message viewers
        /// </summary>
        public partial class MessageViewers : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "messageViewers";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// List of message viewers
            /// </summary>
            [JsonProperty("viewers", ItemConverterType = typeof(Converter))]
            public MessageViewer[] Viewers { get; set; }
        }
    }
}