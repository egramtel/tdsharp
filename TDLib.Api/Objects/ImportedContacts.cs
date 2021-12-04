using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        /// <summary>
        /// Represents the result of an ImportContacts request
        /// </summary>
        public partial class ImportedContacts : Object
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "importedContacts";

            /// <summary>
            /// Extra data attached to the object
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// User identifiers of the imported contacts in the same order as they were specified in the request; 0 if the contact is not yet a registered user
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("user_ids")]
            public long[] UserIds { get; set; }

            /// <summary>
            /// The number of users that imported the corresponding contact; 0 for already registered users or if unavailable
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("importer_count")]
            public int[] ImporterCount { get; set; }
        }
    }
}