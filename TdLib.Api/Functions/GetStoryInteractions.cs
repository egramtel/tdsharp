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
        /// Returns interactions with a story. The method can be called only for stories posted on behalf of the current user
        /// </summary>
        public class GetStoryInteractions : Function<StoryInteractions>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getStoryInteractions";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Story identifier
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("story_id")]
            public int StoryId { get; set; }

            /// <summary>
            /// Query to search for in names, usernames and titles; may be empty to get all relevant interactions
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("query")]
            public string Query { get; set; }

            /// <summary>
            /// Pass true to get only interactions by contacts; pass false to get all relevant interactions
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("only_contacts")]
            public bool OnlyContacts { get; set; }

            /// <summary>
            /// Pass true to get forwards and reposts first, then reactions, then other views; pass false to get interactions sorted just by interaction date
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("prefer_forwards")]
            public bool PreferForwards { get; set; }

            /// <summary>
            /// Pass true to get interactions with reaction first; pass false to get interactions sorted just by interaction date. Ignored if prefer_forwards == true
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("prefer_with_reaction")]
            public bool PreferWithReaction { get; set; }

            /// <summary>
            /// Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("offset")]
            public string Offset { get; set; }

            /// <summary>
            /// The maximum number of story interactions to return
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("limit")]
            public int Limit { get; set; }
        }

        /// <summary>
        /// Returns interactions with a story. The method can be called only for stories posted on behalf of the current user
        /// </summary>
        public static Task<StoryInteractions> GetStoryInteractionsAsync(
            this Client client, int storyId = default, string query = default, bool onlyContacts = default, bool preferForwards = default, bool preferWithReaction = default, string offset = default, int limit = default)
        {
            return client.ExecuteAsync(new GetStoryInteractions
            {
                StoryId = storyId, Query = query, OnlyContacts = onlyContacts, PreferForwards = preferForwards, PreferWithReaction = preferWithReaction, Offset = offset, Limit = limit
            });
        }
    }
}
// REUSE-IgnoreEnd