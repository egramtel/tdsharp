using System;
using System.Collections.Concurrent;
using System.Threading;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace TdLib
{
    public class Dialer : IDisposable
    {
        private static int _id = 0;
        private readonly ConcurrentDictionary<int, Action<TdApi.Object>> _tasks;

        private readonly Client _client;
        private readonly Hub _hub;

        public Dialer(
            Client client,
            Hub hub
            )
        {
            _tasks = new ConcurrentDictionary<int, Action<TdApi.Object>>();
            _client = client;
            _hub = hub;

            _hub.Received += OnReceived;
        }

        private void OnReceived(object _, TdApi.Object structure)
        {
            if (int.TryParse(structure.Extra, out int id) && _tasks.TryRemove(id, out var action))
            {
                action(structure);
            }
        }
        
        public void Send<TResut>(TdApi.Function<TResut> function)
        {
            var data = JsonConvert.SerializeObject(function);
            _client.Send(data);
        }

        public TdApi.Object Execute<TResult>(TdApi.Function<TResult> function)
        {
            var data = JsonConvert.SerializeObject(function);
            data = _client.Execute(data);
            var structure = JsonConvert.DeserializeObject<TdApi.Object>(data, new Converter());
            return structure;
        }
        
        public Task<TResult> ExecuteAsync<TResult>(TdApi.Function<TResult> function)
            where TResult : TdApi.Object
        {
            var id = Interlocked.Increment(ref _id);
            var tcs = new TaskCompletionSource<TResult>();

            function.Extra = id.ToString();
            _tasks.TryAdd(id, structure =>
            {
                if (structure is TdApi.Error err)
                {
                    tcs.SetException(new ErrorException(err));
                }
                else if (structure is TResult result)
                {
                    tcs.SetResult(result);
                }
            });
            
            Send(function);
            
            return tcs.Task;
        }

        public void Dispose()
        {
            _hub.Received -= OnReceived;
        }
    }
}