using Newtonsoft.Json;

namespace TdLib
{
    public partial class TdApi
    {
        /// <summary>
        /// Base class for all objects
        /// </summary>
        public abstract class Object
        {
            [JsonProperty("@type")] public virtual string DataType { get; set; }

            [JsonProperty("@extra")] public virtual string Extra { get; set; }
        }
    }
}