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
        /// Adds a local message to a chat. The message is persistent across application restarts only if the message database is used. Returns the added message
        /// </summary>
        public class AddLocalMessage : Function<Message>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "addLocalMessage";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Target chat
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("chat_id")]
            public long ChatId { get; set; }

            /// <summary>
            /// The sender of the message
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("sender")]
            public MessageSender Sender { get; set; }

            /// <summary>
            /// Identifier of the message to reply to or 0
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("reply_to_message_id")]
            public long ReplyToMessageId { get; set; }

            /// <summary>
            /// Pass true to disable notification for the message
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("disable_notification")]
            public bool DisableNotification { get; set; }

            /// <summary>
            /// The content of the message to be added
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("input_message_content")]
            public InputMessageContent InputMessageContent { get; set; }
        }

        /// <summary>
        /// Adds a local message to a chat. The message is persistent across application restarts only if the message database is used. Returns the added message
        /// </summary>
        public static Task<Message> AddLocalMessageAsync(
            this Client client, long chatId = default, MessageSender sender = default, long replyToMessageId = default,
            bool disableNotification = default, InputMessageContent inputMessageContent = default)
        {
            return client.ExecuteAsync(new AddLocalMessage
            {
                ChatId = chatId, Sender = sender, ReplyToMessageId = replyToMessageId,
                DisableNotification = disableNotification, InputMessageContent = inputMessageContent
            });
        }
    }
}