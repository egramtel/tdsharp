using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        public partial class InternalLinkType : Object
        {
            /// <summary>
            /// The link is a link to the edit profile section of the app settings
            /// </summary>
            public class InternalLinkTypeEditProfileSettings : InternalLinkType
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "internalLinkTypeEditProfileSettings";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }


            }
        }
    }
}