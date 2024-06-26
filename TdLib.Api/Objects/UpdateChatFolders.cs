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
            /// The list of chat folders or a chat folder has changed
            /// </summary>
            public class UpdateChatFolders : Update
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "updateChatFolders";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// The new list of chat folders
                /// </summary>
                [JsonProperty("chat_folders", ItemConverterType = typeof(Converter))]
                public ChatFolderInfo[] ChatFolders { get; set; }

                /// <summary>
                /// Position of the main chat list among chat folders, 0-based
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("main_chat_list_position")]
                public int MainChatListPosition { get; set; }

                /// <summary>
                /// True, if folder tags are enabled
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("are_tags_enabled")]
                public bool AreTagsEnabled { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd