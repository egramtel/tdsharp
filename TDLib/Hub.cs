using System;
using System.Threading;
using Newtonsoft.Json;

namespace TD
{
    public class Hub
    {
        private readonly CancellationTokenSource _cts;
        private readonly Client _client;
        
        public event EventHandler<Structure> Received;
        
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
                    Log(data);
                    var structure = JsonConvert.DeserializeObject<Structure>(data, new Converter());
                    Received?.Invoke(this, structure);
                }
            }
        }

        public void Stop()
        {
            _cts.Cancel();
        }

        private void Log(string data)
        {
            Console.WriteLine(data);
        }
    }
}