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
        /// <summary>
        /// Contains information about a newly created basic group chat
        /// </summary>
        public partial class CreatedBasicGroupChat : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "createdBasicGroupChat";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Chat identifier
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("chat_id")]
            public long ChatId { get; set; }

            /// <summary>
            /// Information about failed to add members
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("failed_to_add_members")]
            public FailedToAddMembers FailedToAddMembers { get; set; }
        }
    }
}
// REUSE-IgnoreEnd