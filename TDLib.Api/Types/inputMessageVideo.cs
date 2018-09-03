using System;
using Newtonsoft.Json;

namespace TD {

    /// <summary>
    /// AUTOGENERATED: DO NOT EDIT!
    /// </summary>
    public partial class InputMessageContent : Structure
    {

        public class InputMessageVideo : InputMessageContent
        {

                [JsonProperty("@type")]
                public override string DataType { get; set; } = "inputMessageVideo";

                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                [JsonConverter(typeof(Converter))]
                [JsonProperty("video")]
                public InputFile Video { get; set; }

                [JsonConverter(typeof(Converter))]
                [JsonProperty("thumbnail")]
                public InputThumbnail Thumbnail { get; set; }

                [JsonConverter(typeof(Converter))]
                [JsonProperty("added_sticker_file_ids")]
                public int[] AddedStickerFileIds { get; set; }

                [JsonConverter(typeof(Converter))]
                [JsonProperty("duration")]
                public int Duration { get; set; }

                [JsonConverter(typeof(Converter))]
                [JsonProperty("width")]
                public int Width { get; set; }

                [JsonConverter(typeof(Converter))]
                [JsonProperty("height")]
                public int Height { get; set; }

                [JsonConverter(typeof(Converter))]
                [JsonProperty("supports_streaming")]
                public bool SupportsStreaming { get; set; }

                [JsonConverter(typeof(Converter))]
                [JsonProperty("caption")]
                public FormattedText Caption { get; set; }

                [JsonConverter(typeof(Converter))]
                [JsonProperty("ttl")]
                public int Ttl { get; set; }

        }

    }

}