using System;
using System.Threading;
using System.Threading.Tasks;
using Newtonsoft.Json;
using TdLib;

namespace TDLib.Bindings
{
    internal class Receiver : IDisposable
    {
        private readonly ManualResetEventSlim _stopped = new ManualResetEventSlim(false);
        private readonly TdJsonClient _tdJsonClient;
        private CancellationTokenSource _cts;
        
        internal event EventHandler<TdApi.Object> Received;
        
        internal Receiver(
            TdJsonClient tdJsonClient
            )
        {
            _cts = new CancellationTokenSource();
            _tdJsonClient = tdJsonClient;
        }
        
        internal void Start()
        {   
            Task.Factory.StartNew(async () =>
            {
                try
                {
                    await Task.Yield();
                    _cts = new CancellationTokenSource();

                    var ct = _cts.Token;
                    while (!ct.IsCancellationRequested)
                    {
                        var data = _tdJsonClient.Receive(1);

                        if (!string.IsNullOrEmpty(data))
                        {
                            var structure = JsonConvert.DeserializeObject<TdApi.Object>(data, new Converter());
                            Received?.Invoke(this, structure);
                        }
                    }
                }
                finally
                {
                    _stopped.Set();
                }
            }, TaskCreationOptions.LongRunning);
        }

        internal void Stop()
        {
            _cts.Cancel();
            _stopped.Wait();
        }

        public void Dispose()
        {
            _stopped.Dispose();
        }
    }
}