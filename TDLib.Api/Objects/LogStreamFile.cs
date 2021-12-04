using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        public partial class LogStream : Object
        {
            /// <summary>
            /// The log is written to a file
            /// </summary>
            public class LogStreamFile : LogStream
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "logStreamFile";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Path to the file to where the internal TDLib log will be written
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("path")]
                public string Path { get; set; }

                /// <summary>
                /// The maximum size of the file to where the internal TDLib log is written before the file will be auto-rotated, in bytes
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("max_file_size")]
                public long MaxFileSize { get; set; }

                /// <summary>
                /// Pass true to additionally redirect stderr to the log file. Ignored on Windows
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("redirect_stderr")]
                public bool RedirectStderr { get; set; }
            }
        }
    }
}