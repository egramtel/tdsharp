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
        /// Deletes saved order information
        /// </summary>
        public class DeleteSavedOrderInfo : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "deleteSavedOrderInfo";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }


        }

        /// <summary>
        /// Deletes saved order information
        /// </summary>
        public static Task<Ok> DeleteSavedOrderInfoAsync(
            this Client client)
        {
            return client.ExecuteAsync(new DeleteSavedOrderInfo
            {
                
            });
        }
    }
}
// REUSE-IgnoreEnd