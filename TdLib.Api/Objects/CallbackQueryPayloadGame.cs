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
        public partial class CallbackQueryPayload : Object
        {
            /// <summary>
            /// The payload for a game callback button
            /// </summary>
            public class CallbackQueryPayloadGame : CallbackQueryPayload
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "callbackQueryPayloadGame";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// A short name of the game that was attached to the callback button
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("game_short_name")]
                public string GameShortName { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd