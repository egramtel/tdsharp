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
        /// Cancels verification of the 2-step verification recovery email address
        /// </summary>
        public class CancelRecoveryEmailAddressVerification : Function<PasswordState>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "cancelRecoveryEmailAddressVerification";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }


        }

        /// <summary>
        /// Cancels verification of the 2-step verification recovery email address
        /// </summary>
        public static Task<PasswordState> CancelRecoveryEmailAddressVerificationAsync(
            this Client client)
        {
            return client.ExecuteAsync(new CancelRecoveryEmailAddressVerification
            {
                
            });
        }
    }
}
// REUSE-IgnoreEnd