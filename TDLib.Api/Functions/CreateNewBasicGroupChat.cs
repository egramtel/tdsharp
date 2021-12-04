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
        /// Creates a new basic group and sends a corresponding messageBasicGroupChatCreate. Returns the newly created chat
        /// </summary>
        public class CreateNewBasicGroupChat : Function<Chat>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "createNewBasicGroupChat";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifiers of users to be added to the basic group
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("user_ids")]
            public long[] UserIds { get; set; }

            /// <summary>
            /// Title of the new basic group; 1-128 characters
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("title")]
            public string Title { get; set; }
        }

        /// <summary>
        /// Creates a new basic group and sends a corresponding messageBasicGroupChatCreate. Returns the newly created chat
        /// </summary>
        public static Task<Chat> CreateNewBasicGroupChatAsync(
            this Client client, long[] userIds = default, string title = default)
        {
            return client.ExecuteAsync(new CreateNewBasicGroupChat
            {
                UserIds = userIds, Title = title
            });
        }
    }
}