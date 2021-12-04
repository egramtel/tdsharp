using System;
using Newtonsoft.Json;

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
            /// The link is a link to a chat by its username. Call searchPublicChat with the given chat username to process the link
            /// </summary>
            public class InternalLinkTypePublicChat : InternalLinkType
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "internalLinkTypePublicChat";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Username of the chat
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("chat_username")]
                public string ChatUsername { get; set; }
            }
        }
    }
}