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
        public partial class PollType : Object
        {
            /// <summary>
            /// A poll in quiz mode, which has exactly one correct answer option and can be answered only once
            /// </summary>
            public class PollTypeQuiz : PollType
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "pollTypeQuiz";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// 0-based identifier of the correct answer option; -1 for a yet unanswered poll
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("correct_option_id")]
                public int CorrectOptionId { get; set; }

                /// <summary>
                /// Text that is shown when the user chooses an incorrect answer or taps on the lamp icon; 0-200 characters with at most 2 line feeds; empty for a yet unanswered poll
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("explanation")]
                public FormattedText Explanation { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd