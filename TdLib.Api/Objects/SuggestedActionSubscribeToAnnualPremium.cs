using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        public partial class SuggestedAction : Object
        {
            /// <summary>
            /// Suggests the user to subscribe to the Premium subscription with annual payments
            /// </summary>
            public class SuggestedActionSubscribeToAnnualPremium : SuggestedAction
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "suggestedActionSubscribeToAnnualPremium";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }


            }
        }
    }
}