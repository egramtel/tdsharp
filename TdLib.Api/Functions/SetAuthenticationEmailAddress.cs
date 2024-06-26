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
        /// Sets the email address of the user and sends an authentication code to the email address. Works only when the current authorization state is authorizationStateWaitEmailAddress
        /// </summary>
        public class SetAuthenticationEmailAddress : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "setAuthenticationEmailAddress";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The email address of the user
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("email_address")]
            public string EmailAddress { get; set; }
        }

        /// <summary>
        /// Sets the email address of the user and sends an authentication code to the email address. Works only when the current authorization state is authorizationStateWaitEmailAddress
        /// </summary>
        public static Task<Ok> SetAuthenticationEmailAddressAsync(
            this Client client, string emailAddress = default)
        {
            return client.ExecuteAsync(new SetAuthenticationEmailAddress
            {
                EmailAddress = emailAddress
            });
        }
    }
}
// REUSE-IgnoreEnd