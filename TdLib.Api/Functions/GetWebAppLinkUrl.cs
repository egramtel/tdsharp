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
        /// Returns an HTTPS URL of a Web App to open after a link of the type internalLinkTypeWebApp is clicked
        /// </summary>
        public class GetWebAppLinkUrl : Function<HttpUrl>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getWebAppLinkUrl";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the chat in which the link was clicked; pass 0 if none
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("chat_id")]
            public long ChatId { get; set; }

            /// <summary>
            /// Identifier of the target bot
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("bot_user_id")]
            public long BotUserId { get; set; }

            /// <summary>
            /// Short name of the Web App
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("web_app_short_name")]
            public string WebAppShortName { get; set; }

            /// <summary>
            /// Start parameter from internalLinkTypeWebApp
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("start_parameter")]
            public string StartParameter { get; set; }

            /// <summary>
            /// Pass true if the current user allowed the bot to send them messages
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("allow_write_access")]
            public bool AllowWriteAccess { get; set; }

            /// <summary>
            /// Parameters to use to open the Web App
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("parameters")]
            public WebAppOpenParameters Parameters { get; set; }
        }

        /// <summary>
        /// Returns an HTTPS URL of a Web App to open after a link of the type internalLinkTypeWebApp is clicked
        /// </summary>
        public static Task<HttpUrl> GetWebAppLinkUrlAsync(
            this Client client, long chatId = default, long botUserId = default, string webAppShortName = default, string startParameter = default, bool allowWriteAccess = default, WebAppOpenParameters parameters = default)
        {
            return client.ExecuteAsync(new GetWebAppLinkUrl
            {
                ChatId = chatId, BotUserId = botUserId, WebAppShortName = webAppShortName, StartParameter = startParameter, AllowWriteAccess = allowWriteAccess, Parameters = parameters
            });
        }
    }
}
// REUSE-IgnoreEnd