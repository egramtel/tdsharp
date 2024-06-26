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
        /// Checks whether the current session can be used to transfer a chat ownership to another user
        /// </summary>
        public class CanTransferOwnership : Function<CanTransferOwnershipResult>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "canTransferOwnership";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }


        }

        /// <summary>
        /// Checks whether the current session can be used to transfer a chat ownership to another user
        /// </summary>
        public static Task<CanTransferOwnershipResult> CanTransferOwnershipAsync(
            this Client client)
        {
            return client.ExecuteAsync(new CanTransferOwnership
            {
                
            });
        }
    }
}
// REUSE-IgnoreEnd