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
        /// Describes a voice note
        /// </summary>
        public partial class VoiceNote : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "voiceNote";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// Duration of the voice note, in seconds; as defined by the sender
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("duration")]
            public int Duration { get; set; }

            /// <summary>
            /// A waveform representation of the voice note in 5-bit format
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("waveform")]
            public byte[] Waveform { get; set; }

            /// <summary>
            /// MIME type of the file; as defined by the sender. Usually, one of "audio/ogg" for Opus in an OGG container, "audio/mpeg" for an MP3 audio, or "audio/mp4" for an M4A audio
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("mime_type")]
            public string MimeType { get; set; }

            /// <summary>
            /// Result of speech recognition in the voice note; may be null
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("speech_recognition_result")]
            public SpeechRecognitionResult SpeechRecognitionResult { get; set; }

            /// <summary>
            /// File containing the voice note
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("voice")]
            public File Voice { get; set; }
        }
    }
}
// REUSE-IgnoreEnd