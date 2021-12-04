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
        /// Returns a list of trending sticker sets. For optimal performance, the number of returned sticker sets is chosen by TDLib
        /// </summary>
        public class GetTrendingStickerSets : Function<StickerSets>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "getTrendingStickerSets";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The offset from which to return the sticker sets; must be non-negative
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("offset")]
            public int Offset { get; set; }

            /// <summary>
            /// The maximum number of sticker sets to be returned; up to 100. For optimal performance, the number of returned sticker sets is chosen by TDLib and can be smaller than the specified limit, even if the end of the list has not been reached
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("limit")]
            public int Limit { get; set; }
        }

        /// <summary>
        /// Returns a list of trending sticker sets. For optimal performance, the number of returned sticker sets is chosen by TDLib
        /// </summary>
        public static Task<StickerSets> GetTrendingStickerSetsAsync(
            this Client client, int offset = default, int limit = default)
        {
            return client.ExecuteAsync(new GetTrendingStickerSets
            {
                Offset = offset, Limit = limit
            });
        }
    }
}