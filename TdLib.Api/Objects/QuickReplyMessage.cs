using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        /// <summary>
        /// Describes a message that can be used for quick reply
        /// </summary>
        public partial class QuickReplyMessage : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "quickReplyMessage";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Unique message identifier among all quick replies
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("id")]
            public long Id { get; set; }

            /// <summary>
            /// The sending state of the message; may be null if the message isn't being sent and didn't fail to be sent
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("sending_state")]
            public MessageSendingState SendingState { get; set; }

            /// <summary>
            /// True, if the message can be edited
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("can_be_edited")]
            public bool CanBeEdited { get; set; }

            /// <summary>
            /// The identifier of the quick reply message to which the message replies; 0 if none
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("reply_to_message_id")]
            public long ReplyToMessageId { get; set; }

            /// <summary>
            /// If non-zero, the user identifier of the bot through which this message was sent
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("via_bot_user_id")]
            public long ViaBotUserId { get; set; }

            /// <summary>
            /// Unique identifier of an album this message belongs to; 0 if none. Only audios, documents, photos and videos can be grouped together in albums
            /// </summary>
            [JsonConverter(typeof(Converter.Int64))]
            [JsonProperty("media_album_id")]
            public long MediaAlbumId { get; set; }

            /// <summary>
            /// Content of the message
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("content")]
            public MessageContent Content { get; set; }

            /// <summary>
            /// Inline keyboard reply markup for the message; may be null if none
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("reply_markup")]
            public ReplyMarkup ReplyMarkup { get; set; }
        }
    }
}