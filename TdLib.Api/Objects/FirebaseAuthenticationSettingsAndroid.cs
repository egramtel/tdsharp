using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        public partial class FirebaseAuthenticationSettings : Object
        {
            /// <summary>
            /// Contains settings for Firebase Authentication in the official applications
            /// </summary>
            public class FirebaseAuthenticationSettingsAndroid : FirebaseAuthenticationSettings
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "firebaseAuthenticationSettingsAndroid";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }


            }
        }
    }
}