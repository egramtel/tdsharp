using System;
using System.Threading;
using Newtonsoft.Json;

namespace TdLib
{
    public class Hub
    {
        private readonly CancellationTokenSource _cts;
        private readonly Client _client;
        
        public event EventHandler<TdApi.Object> Received;
        
        public Hub(
            Client client
            )
        {
            _cts = new CancellationTokenSource();
            _client = client;
        }

        public void Start()
        {
            var ct = _cts.Token;
            while (!ct.IsCancellationRequested)
            {
                var data = _client.Receive(10.0);
                if (!string.IsNullOrEmpty(data))
                {
                    var structure = JsonConvert.DeserializeObject<TdApi.Object>(data, new Converter());
                    Received?.Invoke(this, structure);
                }
            }
        }

        public void Stop()
        {
            _cts.Cancel();
        }
    }
}