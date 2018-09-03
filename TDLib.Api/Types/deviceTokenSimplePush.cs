using System;
using Newtonsoft.Json;

namespace TD {

    /// <summary>
    /// AUTOGENERATED: DO NOT EDIT!
    /// </summary>
    public partial class DeviceToken : Structure
    {

        public class DeviceTokenSimplePush : DeviceToken
        {

                [JsonProperty("@type")]
                public override string DataType { get; set; } = "deviceTokenSimplePush";

                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                [JsonConverter(typeof(Converter))]
                [JsonProperty("endpoint")]
                public string Endpoint { get; set; }

        }

    }

}