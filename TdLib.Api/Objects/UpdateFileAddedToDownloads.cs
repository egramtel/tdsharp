using System;
using Newtonsoft.Json;

// REUSE-IgnoreStart
namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        public partial class Update : Object
        {
            /// <summary>
            /// A file was added to the file download list. This update is sent only after file download list is loaded for the first time
            /// </summary>
            public class UpdateFileAddedToDownloads : Update
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "updateFileAddedToDownloads";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// The added file download
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("file_download")]
                public FileDownload FileDownload { get; set; }

                /// <summary>
                /// New number of being downloaded and recently downloaded files found
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("counts")]
                public DownloadedFileCounts Counts { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd