using System;
using System.Threading.Tasks;
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
        /// Deletes specified quick reply messages
        /// </summary>
        public class DeleteQuickReplyShortcutMessages : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "deleteQuickReplyShortcutMessages";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Unique identifier of the quick reply shortcut to which the messages belong
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("shortcut_id")]
            public int ShortcutId { get; set; }

            /// <summary>
            /// Unique identifiers of the messages
            /// </summary>
            [JsonProperty("message_ids", ItemConverterType = typeof(Converter))]
            public long[] MessageIds { get; set; }
        }

        /// <summary>
        /// Deletes specified quick reply messages
        /// </summary>
        public static Task<Ok> DeleteQuickReplyShortcutMessagesAsync(
            this Client client, int shortcutId = default, long[] messageIds = default)
        {
            return client.ExecuteAsync(new DeleteQuickReplyShortcutMessages
            {
                ShortcutId = shortcutId, MessageIds = messageIds
            });
        }
    }
}
// REUSE-IgnoreEnd