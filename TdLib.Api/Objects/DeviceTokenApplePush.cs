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
        public partial class DeviceToken : Object
        {
            /// <summary>
            /// A token for Apple Push Notification service
            /// </summary>
            public class DeviceTokenApplePush : DeviceToken
            {
                /// <summary>
                /// Data type for serialization
                /// </summary>
                [JsonProperty("@type")]
                public override string DataType { get; set; } = "deviceTokenApplePush";

                /// <summary>
                /// Extra data attached to the message
                /// </summary>
                [JsonProperty("@extra")]
                public override string Extra { get; set; }

                /// <summary>
                /// Device token; may be empty to deregister a device
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("device_token")]
                public string DeviceToken { get; set; }

                /// <summary>
                /// True, if App Sandbox is enabled
                /// </summary>
                [JsonConverter(typeof(Converter))]
                [JsonProperty("is_app_sandbox")]
                public bool IsAppSandbox { get; set; }
            }
        }
    }
}
// REUSE-IgnoreEnd