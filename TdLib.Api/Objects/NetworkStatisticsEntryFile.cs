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
        public partial class NetworkStatisticsEntry : Object
        {
            /// <summary>
            /// Contains statistics about network usage
            /// </summary>
            public class NetworkStatisticsEntryFile : NetworkStatisticsEntry
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "networkStatisticsEntryFile";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Type of the file the data is part of; pass null if the data isn't related to files
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("file_type")]
                public FileType FileType { get; set; }

                /// <summary>
                /// Type of the network the data was sent through. Call setNetworkType to maintain the actual network type
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("network_type")]
                public NetworkType NetworkType { get; set; }

                /// <summary>
                /// Total number of bytes sent
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("sent_bytes")]
                public long SentBytes { get; set; }

                /// <summary>
                /// Total number of bytes received
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("received_bytes")]
                public long ReceivedBytes { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd