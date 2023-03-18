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
        /// Options to be used when a message is sent
        /// </summary>
        public partial class MessageSendOptions : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "messageSendOptions";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Pass true to disable notification for the message
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("disable_notification")]
            public bool DisableNotification { get; set; }

            /// <summary>
            /// Pass true if the message is sent from the background
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("from_background")]
            public bool FromBackground { get; set; }

            /// <summary>
            /// Pass true if the content of the message must be protected from forwarding and saving; for bots only
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("protect_content")]
            public bool ProtectContent { get; set; }

            /// <summary>
            /// Pass true if the user explicitly chosen a sticker or a custom emoji from an installed sticker set; applicable only to sendMessage and sendMessageAlbum
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("update_order_of_installed_sticker_sets")]
            public bool UpdateOrderOfInstalledStickerSets { get; set; }

            /// <summary>
            /// Message scheduling state; pass null to send message immediately. Messages sent to a secret chat, live location messages and self-destructing messages can't be scheduled
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("scheduling_state")]
            public MessageSchedulingState SchedulingState { get; set; }

            /// <summary>
            /// Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("sending_id")]
            public int SendingId { get; set; }
        }
    }
}