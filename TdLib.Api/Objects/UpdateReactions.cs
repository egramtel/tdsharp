using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        public partial class Update : Object
        {
            /// <summary>
            /// The list of supported reactions has changed
            /// </summary>
            public class UpdateReactions : Update
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "updateReactions";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// The new list of supported reactions
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("reactions")]
                public Reaction[] Reactions { get; set; }
            }
        }
    }
}