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
        /// Searches public chats by looking for specified query in their username and title. Currently, only private chats, supergroups and channels can be public. Returns a meaningful number of results.
        /// Excludes private chats with contacts and chats from the chat list from the results
        /// </summary>
        public class SearchPublicChats : Function<Chats>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "searchPublicChats";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Query to search for
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("query")]
            public string Query { get; set; }
        }

        /// <summary>
        /// Searches public chats by looking for specified query in their username and title. Currently, only private chats, supergroups and channels can be public. Returns a meaningful number of results.
        /// Excludes private chats with contacts and chats from the chat list from the results
        /// </summary>
        public static Task<Chats> SearchPublicChatsAsync(
            this Client client, string query = default)
        {
            return client.ExecuteAsync(new SearchPublicChats
            {
                Query = query
            });
        }
    }
}