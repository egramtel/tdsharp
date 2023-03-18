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
        /// Returns default message auto-delete time setting for new chats
        /// </summary>
        public class GetDefaultMessageAutoDeleteTime : Function<MessageAutoDeleteTime>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getDefaultMessageAutoDeleteTime";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }


        }

        /// <summary>
        /// Returns default message auto-delete time setting for new chats
        /// </summary>
        public static Task<MessageAutoDeleteTime> GetDefaultMessageAutoDeleteTimeAsync(
            this Client client)
        {
            return client.ExecuteAsync(new GetDefaultMessageAutoDeleteTime
            {
                
            });
        }
    }
}