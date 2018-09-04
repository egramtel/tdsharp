using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// AUTOGENERATED: DO NOT EDIT!
    /// </summary>
    public partial class TdApi
    {
        public partial class DeviceToken : Object
        {
            public class DeviceTokenMicrosoftPushVoIP : DeviceToken
            {
                [JsonProperty("@type")] public override string DataType { get; set; } = "deviceTokenMicrosoftPushVoIP";

                [JsonProperty("@extra")] public override string Extra { get; set; }

                [JsonConverter(typeof(Converter))]
                [JsonProperty("channel_uri")]
                public string ChannelUri { get; set; }
            }
        }
    }
}