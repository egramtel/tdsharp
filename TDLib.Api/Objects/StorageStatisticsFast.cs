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
        /// Contains approximate storage usage statistics, excluding files of unknown file type
        /// </summary>
        public partial class StorageStatisticsFast : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "storageStatisticsFast";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Approximate total size of files, in bytes
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("files_size")]
            public long FilesSize { get; set; }

            /// <summary>
            /// Approximate number of files
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("file_count")]
            public int FileCount { get; set; }

            /// <summary>
            /// Size of the database
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("database_size")]
            public long DatabaseSize { get; set; }

            /// <summary>
            /// Size of the language pack database
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("language_pack_database_size")]
            public long LanguagePackDatabaseSize { get; set; }

            /// <summary>
            /// Size of the TDLib internal log
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("log_size")]
            public long LogSize { get; set; }
        }
    }
}