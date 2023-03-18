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
        /// Informs TDLib that messages are being viewed by the user. Sponsored messages must be marked as viewed only when the entire text of the message is shown on the screen (excluding the button).
        /// Many useful activities depend on whether the messages are currently being viewed or not (e.g., marking messages as read, incrementing a view counter, updating a view counter, removing deleted messages in supergroups and channels)
        /// </summary>
        public class ViewMessages : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "viewMessages";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Chat identifier
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("chat_id")]
            public long ChatId { get; set; }

            /// <summary>
            /// The identifiers of the messages being viewed
            /// </summary>
            [JsonProperty("message_ids", ItemConverterType = typeof(Converter))]
            public long[] MessageIds { get; set; }

            /// <summary>
            /// Source of the message view
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("source")]
            public MessageSource Source { get; set; }

            /// <summary>
            /// Pass true to mark as read the specified messages even the chat is closed; pass null to guess the source based on chat open state
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("force_read")]
            public bool ForceRead { get; set; }
        }

        /// <summary>
        /// Informs TDLib that messages are being viewed by the user. Sponsored messages must be marked as viewed only when the entire text of the message is shown on the screen (excluding the button).
        /// Many useful activities depend on whether the messages are currently being viewed or not (e.g., marking messages as read, incrementing a view counter, updating a view counter, removing deleted messages in supergroups and channels)
        /// </summary>
        public static Task<Ok> ViewMessagesAsync(
            this Client client, long chatId = default, long[] messageIds = default, MessageSource source = default, bool forceRead = default)
        {
            return client.ExecuteAsync(new ViewMessages
            {
                ChatId = chatId, MessageIds = messageIds, Source = source, ForceRead = forceRead
            });
        }
    }
}