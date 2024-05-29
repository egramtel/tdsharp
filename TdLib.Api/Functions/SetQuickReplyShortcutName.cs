using System;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        /// <summary>
        /// Changes name of a quick reply shortcut
        /// </summary>
        public class SetQuickReplyShortcutName : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "setQuickReplyShortcutName";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Unique identifier of the quick reply shortcut
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("shortcut_id")]
            public int ShortcutId { get; set; }

            /// <summary>
            /// New name for the shortcut. Use checkQuickReplyShortcutName to check its validness
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("name")]
            public string Name { get; set; }
        }

        /// <summary>
        /// Changes name of a quick reply shortcut
        /// </summary>
        public static Task<Ok> SetQuickReplyShortcutNameAsync(
            this Client client, int shortcutId = default, string name = default)
        {
            return client.ExecuteAsync(new SetQuickReplyShortcutName
            {
                ShortcutId = shortcutId, Name = name
            });
        }
    }
}