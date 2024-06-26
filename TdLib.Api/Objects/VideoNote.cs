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
        /// <summary>
        /// Describes a video note. The video must be equal in width and height, cropped to a circle, and stored in MPEG4 format
        /// </summary>
        public partial class VideoNote : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "videoNote";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Duration of the video, in seconds; as defined by the sender
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("duration")]
            public int Duration { get; set; }

            /// <summary>
            /// A waveform representation of the video note's audio in 5-bit format; may be empty if unknown
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("waveform")]
            public byte[] Waveform { get; set; }

            /// <summary>
            /// Video width and height; as defined by the sender
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("length")]
            public int Length { get; set; }

            /// <summary>
            /// Video minithumbnail; may be null
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("minithumbnail")]
            public Minithumbnail Minithumbnail { get; set; }

            /// <summary>
            /// Video thumbnail in JPEG format; as defined by the sender; may be null
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("thumbnail")]
            public Thumbnail Thumbnail { get; set; }

            /// <summary>
            /// Result of speech recognition in the video note; may be null
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("speech_recognition_result")]
            public SpeechRecognitionResult SpeechRecognitionResult { get; set; }

            /// <summary>
            /// File containing the video
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("video")]
            public File Video { get; set; }
        }
    }
}
// REUSE-IgnoreEnd