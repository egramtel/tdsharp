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
        /// Extracts text or caption of the given message and translates it to the given language. If the current user is a Telegram Premium user, then text formatting is preserved
        /// </summary>
        public class TranslateMessageText : Function<FormattedText>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "translateMessageText";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the chat to which the message belongs
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("chat_id")]
            public long ChatId { get; set; }

            /// <summary>
            /// Identifier of the message
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("message_id")]
            public long MessageId { get; set; }

            /// <summary>
            /// Language code of the language to which the message is translated. Must be one of
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("to_language_code")]
            public string ToLanguageCode { get; set; }
        }

        /// <summary>
        /// Extracts text or caption of the given message and translates it to the given language. If the current user is a Telegram Premium user, then text formatting is preserved
        /// </summary>
        public static Task<FormattedText> TranslateMessageTextAsync(
            this Client client, long chatId = default, long messageId = default, string toLanguageCode = default)
        {
            return client.ExecuteAsync(new TranslateMessageText
            {
                ChatId = chatId, MessageId = messageId, ToLanguageCode = toLanguageCode
            });
        }
    }
}