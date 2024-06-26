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
        /// Contains information about the current recovery email address
        /// </summary>
        public partial class RecoveryEmailAddress : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "recoveryEmailAddress";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Recovery email address
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("recovery_email_address")]
            public string RecoveryEmailAddress_ { get; set; }
        }
    }
}
// REUSE-IgnoreEnd