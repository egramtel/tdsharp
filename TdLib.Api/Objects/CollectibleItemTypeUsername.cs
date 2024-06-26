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
        public partial class CollectibleItemType : Object
        {
            /// <summary>
            /// Describes a collectible item that can be purchased at https://fragment.com
            /// </summary>
            public class CollectibleItemTypeUsername : CollectibleItemType
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "collectibleItemTypeUsername";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// The username
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("username")]
                public string Username { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd