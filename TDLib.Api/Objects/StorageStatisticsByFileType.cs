using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        /// <summary>
        /// Contains the storage usage statistics for a specific file type
        /// </summary>
        public partial class StorageStatisticsByFileType : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "storageStatisticsByFileType";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// File type
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("file_type")]
            public FileType FileType { get; set; }

            /// <summary>
            /// Total size of the files, in bytes
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("size")]
            public long Size { get; set; }

            /// <summary>
            /// Total number of files
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("count")]
            public int Count { get; set; }
        }
    }
}