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
        public partial class StoryPrivacySettings : Object
        {
            /// <summary>
            /// Describes privacy settings of a story
            /// </summary>
            public class StoryPrivacySettingsEveryone : StoryPrivacySettings
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "storyPrivacySettingsEveryone";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Identifiers of the users that can't see the story; always unknown and empty for non-owned stories
                /// </summary>
                [JsonProperty("except_user_ids", ItemConverterType = typeof(Converter))]
                public long[] ExceptUserIds { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd