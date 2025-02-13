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
        /// Toggles whether a gift is shown on the current user's or the channel's profile page; requires can_post_messages administrator right in the chat
        /// </summary>
        public class ToggleGiftIsSaved : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "toggleGiftIsSaved";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the gift
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("received_gift_id")]
            public string ReceivedGiftId { get; set; }

            /// <summary>
            /// Pass true to display the gift on the user's or the channel's profile page; pass false to remove it from the profile page
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("is_saved")]
            public bool IsSaved { get; set; }
        }

        /// <summary>
        /// Toggles whether a gift is shown on the current user's or the channel's profile page; requires can_post_messages administrator right in the chat
        /// </summary>
        public static Task<Ok> ToggleGiftIsSavedAsync(
            this Client client, string receivedGiftId = default, bool isSaved = default)
        {
            return client.ExecuteAsync(new ToggleGiftIsSaved
            {
                ReceivedGiftId = receivedGiftId, IsSaved = isSaved
            });
        }
    }
}
// REUSE-IgnoreEnd