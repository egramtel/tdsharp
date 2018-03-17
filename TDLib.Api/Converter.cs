using System;
using System.Collections.Generic;
using System.Reflection;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace TD
{
    public class Converter : JsonConverter
    {
        private static Assembly _assembly;
        private static Dictionary<string, Type> _mapper;
        
        static Converter()
        {
            _assembly = typeof(Converter).Assembly;
            _mapper = new Dictionary<string, Type>();

            foreach (var type in _assembly.GetExportedTypes())
            {
                var name = type.Name;
                var arr = name.ToCharArray();
                arr[0] = arr[0].ToString().ToLower()[0];
                name = new string(arr);
                
                _mapper.Add(name, type);
            }
        }
        
        public override bool CanRead => true;

        public override bool CanWrite => false;

        public override bool CanConvert(Type type)
        {
            var name = type.Name;
            var arr = name.ToCharArray();
            arr[0] = arr[0].ToString().ToLower()[0];
            name = new string(arr);
            
            return _mapper.ContainsKey(name);
        }

        public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
        {
            var jToken = JToken.Load(reader);

            if (jToken.Type == JTokenType.Object)
            {
                var jObject = (JObject) jToken;
                
                var typeProp = jObject["@type"];
                if (typeProp != null)
                {
                    var typeName = (string)typeProp;
                    if (typeName != null && _mapper.TryGetValue(typeName, out var type))
                    {
                        return jObject.ToObject(type);
                    }
                }
            }

            return jToken.ToObject(objectType);
        }
        
        public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
        {
            throw new NotImplementedException();
        }
    }
}