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
        public partial class InputPassportElementErrorSource : Object
        {
            /// <summary>
            /// The selfie contains an error. The error is considered resolved when the file with the selfie changes
            /// </summary>
            public class InputPassportElementErrorSourceSelfie : InputPassportElementErrorSource
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "inputPassportElementErrorSourceSelfie";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Current hash of the file containing the selfie
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("file_hash")]
                public byte[] FileHash { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd