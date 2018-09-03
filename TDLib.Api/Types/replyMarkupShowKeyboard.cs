using System;
using Newtonsoft.Json;

namespace TD {

    /// <summary>
    /// AUTOGENERATED: DO NOT EDIT!
    /// </summary>
    public partial class ReplyMarkup : Structure
    {

        public class ReplyMarkupShowKeyboard : ReplyMarkup
        {

                [JsonProperty("@type")]
                public override string DataType { get; set; } = "replyMarkupShowKeyboard";

                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                [JsonConverter(typeof(Converter))]
                [JsonProperty("rows")]
                public KeyboardButton[][] Rows { get; set; }

                [JsonConverter(typeof(Converter))]
                [JsonProperty("resize_keyboard")]
                public bool ResizeKeyboard { get; set; }

                [JsonConverter(typeof(Converter))]
                [JsonProperty("one_time")]
                public bool OneTime { get; set; }

                [JsonConverter(typeof(Converter))]
                [JsonProperty("is_personal")]
                public bool IsPersonal { get; set; }

        }

    }

}