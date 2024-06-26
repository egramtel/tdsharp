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
        public partial class InputPassportElement : Object
        {
            /// <summary>
            /// A Telegram Passport element to be saved containing the user's email address
            /// </summary>
            public class InputPassportElementEmailAddress : InputPassportElement
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "inputPassportElementEmailAddress";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// The email address to be saved
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("email_address")]
                public string EmailAddress { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd