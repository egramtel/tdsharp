using System;
using Newtonsoft.Json;

namespace TD {

    /// <summary>
    /// AUTOGENERATED: DO NOT EDIT!
    /// </summary>
    public partial class ChatMemberStatus : Structure
    {

        public class ChatMemberStatusLeft : ChatMemberStatus
        {

                [JsonProperty("@type")]
                public override string DataType { get; set; } = "chatMemberStatusLeft";

                [JsonProperty("@extra")]
                public override string Extra { get; set; }

        }

    }

}