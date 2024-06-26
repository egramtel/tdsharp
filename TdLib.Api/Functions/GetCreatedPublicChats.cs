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
        /// Returns a list of public chats of the specified type, owned by the user
        /// </summary>
        public class GetCreatedPublicChats : Function<Chats>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getCreatedPublicChats";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Type of the public chats to return
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("type")]
            public PublicChatType Type { get; set; }
        }

        /// <summary>
        /// Returns a list of public chats of the specified type, owned by the user
        /// </summary>
        public static Task<Chats> GetCreatedPublicChatsAsync(
            this Client client, PublicChatType type = default)
        {
            return client.ExecuteAsync(new GetCreatedPublicChats
            {
                Type = type
            });
        }
    }
}
// REUSE-IgnoreEnd