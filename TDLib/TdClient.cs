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
        
        private int _taskId;
        private readonly ConcurrentDictionary<int, Action<TdApi.Object>> _tasks;
        
        private Receiver _receiver;
        
        public TdClient(
            TdJsonClient tdJsonClient)
        {
            _tdJsonClient = tdJsonClient;
            
            _tasks = new ConcurrentDictionary<int, Action<TdApi.Object>>();
            
            _receiver = new Receiver(tdJsonClient);
            _receiver.Received += OnReceived;
        }

        public TdClient()
            : this(new TdJsonClient())
        {
            _disposeJsonClient = true;
        }
        
        /// <summary>
        /// Provides updates.
        /// Updates start when at least one subscriber exists.
        /// Updates stop when there are no subscribers.
        /// </summary>
        public event EventHandler<TdApi.Update> UpdateReceived
        {
            add
            {
                lock (_receiverLock)
                {
                    _updateReceived += value;

                    if (_receiverCount == 0)
                    {
                        _receiver.Start();
                    }

                    _receiverCount++;
                }
            }
            remove
            {
                lock (_receiverLock)
                {
                    _updateReceived -= value;

                    if (_receiverCount == 1)
                    {
                        _receiver.Stop();
                    }
                    
                    _receiverCount--;
                }
            }
        }

        private void OnReceived(object _, TdApi.Object obj)
        {
            if (int.TryParse(obj.Extra, out int id) && _tasks.TryRemove(id, out var action))
            {
                action(obj);
            }
            else if (obj is TdApi.Update update)
            {
                _updateReceived?.Invoke(this, update);
            }
        }

        private readonly object _receiverLock = new object();
        private int _receiverCount;
        private EventHandler<TdApi.Update> _updateReceived;
        
        /// <summary>
        /// Executes function and ignores response
        /// </summary>
        public void Send<TResut>(TdApi.Function<TResut> function)
        {
            if (_receiver == null)
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
            if (_receiver == null)
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
            if (_receiver == null)
            {
                throw new ObjectDisposedException("TDLib client was disposed");
            }
            
            var id = Interlocked.Increment(ref _taskId);
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
            _receiver.Stop();
            _receiver.Received -= OnReceived;
            _receiver = null;

            if (_disposeJsonClient)
            {
                _tdJsonClient.Dispose();
            }
        }
    }
}