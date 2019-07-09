using System;
using System.Collections.Concurrent;
using System.Threading;
using System.Threading.Tasks;
using Newtonsoft.Json;
using TdLib;

namespace TDLib.Bindings
{
    internal class Receiver : IDisposable
    {
        /// <summary>Should never be directly exposed outside of the Receiver thread, thus ref struct.</summary>
        internal ref struct ReceiverInternalState
        {
            public bool IsAuthenticationClosed;
        }

        internal delegate void ReceiverStateAction(ref ReceiverInternalState state);
        
        private readonly ManualResetEventSlim _stopped = new ManualResetEventSlim(false);
        private readonly ConcurrentQueue<ReceiverStateAction> _actionQueue = new ConcurrentQueue<ReceiverStateAction>();
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
                    ProcessEvents();
                }
                finally
                {
                    _stopped.Set();
                }
            }, TaskCreationOptions.LongRunning);
        }

        public void ScheduleAction(ReceiverStateAction action)
        {
            _actionQueue.Enqueue(action);
        }

        private void ProcessEvents()
        {
            _cts = new CancellationTokenSource();

            var state = new ReceiverInternalState();
            var ct = _cts.Token;
            while (!ct.IsCancellationRequested)
            {
                var data = _tdJsonClient.Receive(1);

                if (!string.IsNullOrEmpty(data))
                {
                    var structure = JsonConvert.DeserializeObject<TdApi.Object>(data, new Converter());
                    UpdateState(ref state, structure);
                    Received?.Invoke(this, structure);
                }

                PerformQueuedActions(ref state);
            }
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

        private void PerformQueuedActions(ref ReceiverInternalState state)
        {
            if (_actionQueue.IsEmpty) return;
            while (_actionQueue.TryDequeue(out var action))
            {
                action(ref state);
            }
        }
        
        private void UpdateState(ref ReceiverInternalState state, TdApi.Object obj)
        {
            if (obj is TdApi.Update.UpdateAuthorizationState authStateUpdate)
            {
                state.IsAuthenticationClosed = authStateUpdate.IsAuthorizationStateClosed();
            }
        }
    }
}