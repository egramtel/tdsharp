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
        public partial class StoryInteractionType : Object
        {
            /// <summary>
            /// Describes type of interaction with a story
            /// </summary>
            public class StoryInteractionTypeView : StoryInteractionType
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "storyInteractionTypeView";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Type of the reaction that was chosen by the viewer; may be null if none
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("chosen_reaction_type")]
                public ReactionType ChosenReactionType { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd