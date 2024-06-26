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
        /// Removes a file from the file download list
        /// </summary>
        public class RemoveFileFromDownloads : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "removeFileFromDownloads";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the downloaded file
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("file_id")]
            public int FileId { get; set; }

            /// <summary>
            /// Pass true to delete the file from the TDLib file cache
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("delete_from_cache")]
            public bool DeleteFromCache { get; set; }
        }

        /// <summary>
        /// Removes a file from the file download list
        /// </summary>
        public static Task<Ok> RemoveFileFromDownloadsAsync(
            this Client client, int fileId = default, bool deleteFromCache = default)
        {
            return client.ExecuteAsync(new RemoveFileFromDownloads
            {
                FileId = fileId, DeleteFromCache = deleteFromCache
            });
        }
    }
}
// REUSE-IgnoreEnd