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
        private static readonly TimeSpan MaxTimeoutToClose = TimeSpan.FromMinutes(1.0); 
        
        private readonly bool _disposeJsonClient;
        private readonly TdJsonClient _tdJsonClient;
        private volatile bool _isClosed; // TODO: Think better about possible race conditions 
        
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
            _receiver.Start();
        }

        public TdClient()
            : this(new TdJsonClient())
        {
            _disposeJsonClient = true;
        }
        
        /// <summary>
        /// Provides updates from TDLib
        /// </summary>
        public event EventHandler<TdApi.Update> UpdateReceived
        {
            add
            {
                lock (_updateLock)
                {
                    _updateReceived += value;
                    
                    while (_updateBuffer.TryDequeue(out var update))
                    {
                        _updateReceived(this, update);
                    }

                    _updateReceiverCount++;
                }
            }
            remove
            {
                lock (_updateLock)
                {
                    _updateReceived -= value;
                    _updateReceiverCount--;
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
                if (_updateReceiverCount == 0)
                {
                    _updateBuffer.Enqueue(update);
                }
                else
                {
                    if (update.IsAuthorizationStateClosed())
                        _isClosed = true;
                    
                    _updateReceived(this, update);
                }
            }
        }

        private readonly object _updateLock = new object();
        private readonly ConcurrentQueue<TdApi.Update> _updateBuffer = new ConcurrentQueue<TdApi.Update>();
        private EventHandler<TdApi.Update> _updateReceived;
        private int _updateReceiverCount;
        
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
        public TResult Execute<TResult>(TdApi.Function<TResult> function)
            where TResult : TdApi.Object
        {
            if (_receiver == null)
            {
                throw new ObjectDisposedException("TDLib client was disposed");
            }
            
            var data = JsonConvert.SerializeObject(function);
            data = _tdJsonClient.Execute(data);
            var structure = JsonConvert.DeserializeObject<TdApi.Object>(data, new Converter());
            
            if (structure is TdApi.Error error)
            {
                throw new TdException(error);
            }
            
            return (TResult)structure;
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
                if (structure is TdApi.Error error)
                {
                    tcs.SetException(new TdException(error));
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
            if (_disposeJsonClient)
            {
                CloseSynchronously();
            }
            
            _receiver.Stop();
            _receiver.Received -= OnReceived;
            _receiver = null;

            if (_disposeJsonClient)
            {
                _tdJsonClient.Dispose();
            }
        }

        private void CloseSynchronously()
        {
            if (_isClosed) return;

            var task = this.WaitForUpdate(UpdateEx.IsAuthorizationStateClosed, MaxTimeoutToClose);
            _ = ExecuteAsync(new TdApi.Close());
            
            var result = task.Result;
            if (result == null)
            {
                throw new Exception("Timeout when trying to close the client");
            }
        }
    }
}