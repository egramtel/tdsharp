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
        /// Adds a file from a message to the list of file downloads. Download progress and completion of the download will be notified through updateFile updates.
        /// If message database is used, the list of file downloads is persistent across application restarts. The downloading is independent of download using downloadFile, i.e. it continues if downloadFile is canceled or is used to download a part of the file
        /// </summary>
        public class AddFileToDownloads : Function<File>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "addFileToDownloads";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Identifier of the file to download
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("file_id")]
            public int FileId { get; set; }

            /// <summary>
            /// Chat identifier of the message with the file
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("chat_id")]
            public long ChatId { get; set; }

            /// <summary>
            /// Message identifier
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("message_id")]
            public long MessageId { get; set; }

            /// <summary>
            /// Priority of the download (1-32). The higher the priority, the earlier the file will be downloaded. If the priorities of two files are equal, then the last one for which downloadFile/addFileToDownloads was called will be downloaded first
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("priority")]
            public int Priority { get; set; }
        }

        /// <summary>
        /// Adds a file from a message to the list of file downloads. Download progress and completion of the download will be notified through updateFile updates.
        /// If message database is used, the list of file downloads is persistent across application restarts. The downloading is independent of download using downloadFile, i.e. it continues if downloadFile is canceled or is used to download a part of the file
        /// </summary>
        public static Task<File> AddFileToDownloadsAsync(
            this Client client, int fileId = default, long chatId = default, long messageId = default, int priority = default)
        {
            return client.ExecuteAsync(new AddFileToDownloads
            {
                FileId = fileId, ChatId = chatId, MessageId = messageId, Priority = priority
            });
        }
    }
}
// REUSE-IgnoreEnd