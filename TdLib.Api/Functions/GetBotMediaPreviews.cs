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
        /// Returns the list of media previews of a bot
        /// </summary>
        public class GetBotMediaPreviews : Function<BotMediaPreviews>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getBotMediaPreviews";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the target bot. The bot must have the main Web App
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("bot_user_id")]
            public long BotUserId { get; set; }
        }

        /// <summary>
        /// Returns the list of media previews of a bot
        /// </summary>
        public static Task<BotMediaPreviews> GetBotMediaPreviewsAsync(
            this Client client, long botUserId = default)
        {
            return client.ExecuteAsync(new GetBotMediaPreviews
            {
                BotUserId = botUserId
            });
        }
    }
}
// REUSE-IgnoreEnd