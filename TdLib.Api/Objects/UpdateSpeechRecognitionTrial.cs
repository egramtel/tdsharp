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
        public partial class Update : Object
        {
            /// <summary>
            /// The parameters of speech recognition without Telegram Premium subscription has changed
            /// </summary>
            public class UpdateSpeechRecognitionTrial : Update
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "updateSpeechRecognitionTrial";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// The maximum allowed duration of media for speech recognition without Telegram Premium subscription, in seconds
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("max_media_duration")]
                public int MaxMediaDuration { get; set; }

                /// <summary>
                /// The total number of allowed speech recognitions per week; 0 if none
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("weekly_count")]
                public int WeeklyCount { get; set; }

                /// <summary>
                /// Number of left speech recognition attempts this week
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("left_count")]
                public int LeftCount { get; set; }

                /// <summary>
                /// Point in time (Unix timestamp) when the weekly number of tries will reset; 0 if unknown
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("next_reset_date")]
                public int NextResetDate { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd