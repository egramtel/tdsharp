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
        public partial class FileType : Object
        {
            /// <summary>
            /// The file is a file from Secure storage used for storing Telegram Passport files
            /// </summary>
            public class FileTypeSecure : FileType
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "fileTypeSecure";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }


            }
        }
    }
}
// REUSE-IgnoreEnd