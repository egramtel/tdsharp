using System;
using System.Collections.Concurrent;
using System.Threading;
using System.Threading.Tasks;
using Newtonsoft.Json;
using TDLib.Bindings;

namespace TdLib
{
    /// <summary>
    /// TDLib client for using with generated APIs
    /// </summary>
    public class TdClient : IDisposable
    {
        private readonly bool _disposeJsonClient;
        private readonly TdJsonClient _tdJsonClient;
        private readonly Action<TdApi.Update> _updatesHandler;
        
        private static int _id = 0;
        private readonly ConcurrentDictionary<int, Action<TdApi.Object>> _tasks;
        
        private readonly Hub _hub;
        
        public TdClient(
            TdJsonClient tdJsonClient,
            Action<TdApi.Update> updatesHandler)
        {
            _tdJsonClient = tdJsonClient;
            _updatesHandler = updatesHandler;
            
            _tasks = new ConcurrentDictionary<int, Action<TdApi.Object>>();
            
            _hub = new Hub(tdJsonClient);
            _hub.Received += OnReceived;
            _hub.Start();
        }

        public TdClient(
            TdJsonClient tdJsonClient)
            : this(tdJsonClient, _ => { })
        {
        }

        public TdClient(
            Action<TdApi.Update> updatesHandler)
            : this(new TdJsonClient(), updatesHandler)
        {
            _disposeJsonClient = true;
        }

        public TdClient()
            : this(new TdJsonClient(), _ => { })
        {
            _disposeJsonClient = true;
        }

        private void OnReceived(object _, TdApi.Object obj)
        {
            if (int.TryParse(obj.Extra, out int id) && _tasks.TryRemove(id, out var action))
            {
                action(obj);
            }
            else if (obj is TdApi.Update update)
            {
                _updatesHandler(update);
            }
        }
        
        /// <summary>
        /// Executes function and ignores response
        /// </summary>
        public void Send<TResut>(TdApi.Function<TResut> function)
        {
            if (_hub.WasStopped)
            {
                throw new ObjectDisposedException("TDLib client was disposed");
            }
            
            var data = JsonConvert.SerializeObject(function);
            _tdJsonClient.Send(data);
        }

        /// <summary>
        /// Synchronously executes function and returns response
        /// </summary>
        public TdApi.Object Execute<TResult>(TdApi.Function<TResult> function)
        {
            if (_hub.WasStopped)
            {
                throw new ObjectDisposedException("TDLib client was disposed");
            }
            
            var data = JsonConvert.SerializeObject(function);
            data = _tdJsonClient.Execute(data);
            var structure = JsonConvert.DeserializeObject<TdApi.Object>(data, new Converter());
            return structure;
        }
        
        /// <summary>
        /// Asynchronously executes function and returns response
        /// </summary>
        public Task<TResult> ExecuteAsync<TResult>(TdApi.Function<TResult> function)
            where TResult : TdApi.Object
        {
            if (_hub.WasStopped)
            {
                throw new ObjectDisposedException("TDLib client was disposed");
            }
            
            var id = Interlocked.Increment(ref _id);
            var tcs = new TaskCompletionSource<TResult>();

            function.Extra = id.ToString();
            _tasks.TryAdd(id, structure =>
            {
                if (structure is TdApi.Error err)
                {
                    tcs.SetException(new TdException(err));
                }
                else if (structure is TResult result)
                {
                    tcs.SetResult(result);
                }
            });
            
            Send(function);
            
            return tcs.Task;
        }

        /// <summary>
        /// Disposes client and json client (if it was created inside this class)
        /// Updates are stopped from being sent to updates handler
        /// </summary>
        public void Dispose()
        {
            _hub.Stop();
            _hub.Received -= OnReceived;

            if (_disposeJsonClient)
            {
                _tdJsonClient.Dispose();
            }
        }
    }
}