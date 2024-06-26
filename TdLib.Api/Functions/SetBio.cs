using System;
using System.Threading.Tasks;
using Newtonsoft.Json;

// REUSE-IgnoreStart
namespace TdLib
{
    /// <summary>
    /// Autogenerated TDLib APIs
    /// </summary>
    public static partial class TdApi
    {
        /// <summary>
        /// Changes the bio of the current user
        /// </summary>
        public class SetBio : Function<Ok>
        {
            /// <summary>
            /// Data type for serialization
            /// </summary>
            [JsonProperty("@type")]
            public override string DataType { get; set; } = "setBio";

            /// <summary>
            /// Extra data attached to the function
            /// </summary>
            [JsonProperty("@extra")]
            public override string Extra { get; set; }

            /// <summary>
            /// The new value of the user bio; 0-getOption("bio_length_max") characters without line feeds
            /// </summary>
            [JsonConverter(typeof(Converter))]
            [JsonProperty("bio")]
            public string Bio { get; set; }
        }

        /// <summary>
        /// Changes the bio of the current user
        /// </summary>
        public static Task<Ok> SetBioAsync(
            this Client client, string bio = default)
        {
            return client.ExecuteAsync(new SetBio
            {
                Bio = bio
            });
        }
    }
}
// REUSE-IgnoreEnd