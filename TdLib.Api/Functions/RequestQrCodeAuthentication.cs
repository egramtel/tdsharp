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
        /// Requests QR code authentication by scanning a QR code on another logged in device. Works only when the current authorization state is authorizationStateWaitPhoneNumber,
        /// </summary>
        public class RequestQrCodeAuthentication : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "requestQrCodeAuthentication";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// List of user identifiers of other users currently using the application
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("other_user_ids")]
            public long[] OtherUserIds { get; set; }
        }

        /// <summary>
        /// Requests QR code authentication by scanning a QR code on another logged in device. Works only when the current authorization state is authorizationStateWaitPhoneNumber,
        /// </summary>
        public static Task<Ok> RequestQrCodeAuthenticationAsync(
            this Client client, long[] otherUserIds = default)
        {
            return client.ExecuteAsync(new RequestQrCodeAuthentication
            {
                OtherUserIds = otherUserIds
            });
        }
    }
}