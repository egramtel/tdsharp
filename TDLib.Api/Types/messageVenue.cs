using System;
using Newtonsoft.Json;

namespace TD {

    /// <summary>
    /// AUTOGENERATED: DO NOT EDIT!
    /// </summary>
    public partial class MessageContent : Structure
    {

        public class MessageVenue : MessageContent
        {

                [JsonProperty("@type")]
                public override string DataType { get; set; } = "messageVenue";

                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                [JsonConverter(typeof(Converter))]
                [JsonProperty("venue")]
                public Venue Venue { get; set; }

        }

    }

}