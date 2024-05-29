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
        /// Loads more Saved Messages topics. The loaded topics will be sent through updateSavedMessagesTopic. Topics are sorted by their topic.order in descending order. Returns a 404 error if all topics have been loaded
        /// </summary>
        public class LoadSavedMessagesTopics : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "loadSavedMessagesTopics";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The maximum number of topics to be loaded. For optimal performance, the number of loaded topics is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("limit")]
            public int Limit { get; set; }
        }

        /// <summary>
        /// Loads more Saved Messages topics. The loaded topics will be sent through updateSavedMessagesTopic. Topics are sorted by their topic.order in descending order. Returns a 404 error if all topics have been loaded
        /// </summary>
        public static Task<Ok> LoadSavedMessagesTopicsAsync(
            this Client client, int limit = default)
        {
            return client.ExecuteAsync(new LoadSavedMessagesTopics
            {
                Limit = limit
            });
        }
    }
}