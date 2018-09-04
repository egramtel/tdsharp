using System;
using Newtonsoft.Json;

namespace TdLib
{
    /// <summary>
    /// AUTOGENERATED: DO NOT EDIT!
    /// </summary>
    public partial class TdApi
    {
        public class ChangeImportedContacts : Function<ImportedContacts>
        {
            [JsonProperty("@type")] public override string DataType { get; set; } = "changeImportedContacts";

            [JsonProperty("@extra")] public override string Extra { get; set; }

            [JsonConverter(typeof(Converter))]
            [JsonProperty("contacts")]
            public Contact[] Contacts { get; set; }
        }
    }
}