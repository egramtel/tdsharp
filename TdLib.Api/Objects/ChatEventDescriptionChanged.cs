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
        public partial class ChatEventAction : Object
        {
            /// <summary>
            /// The chat description was changed
            /// </summary>
            public class ChatEventDescriptionChanged : ChatEventAction
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "chatEventDescriptionChanged";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Previous chat description
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("old_description")]
                public string OldDescription { get; set; }

                /// <summary>
                /// New chat description
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("new_description")]
                public string NewDescription { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd