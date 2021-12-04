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
        /// Returns an existing chat corresponding to a known basic group
        /// </summary>
        public class CreateBasicGroupChat : Function<Chat>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "createBasicGroupChat";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Basic group identifier
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("basic_group_id")]
            public long BasicGroupId { get; set; }

            /// <summary>
            /// If true, the chat will be created without network request. In this case all information about the chat except its type, title and photo can be incorrect
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("force")]
            public bool Force { get; set; }
        }

        /// <summary>
        /// Returns an existing chat corresponding to a known basic group
        /// </summary>
        public static Task<Chat> CreateBasicGroupChatAsync(
            this Client client, long basicGroupId = default, bool force = default)
        {
            return client.ExecuteAsync(new CreateBasicGroupChat
            {
                BasicGroupId = basicGroupId, Force = force
            });
        }
    }
}