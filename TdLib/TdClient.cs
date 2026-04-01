// SPDX-FileCopyrightText: 2024-2026 tdsharp contributors <https://github.com/egramtel/tdsharp>
//
// SPDX-License-Identifier: MIT

using System;
using System.Collections.Concurrent;
using System.Globalization;
using System.Threading;
using System.Threading.Tasks;
using Newtonsoft.Json;
using TdLib.Bindings;

namespace TdLib
{
    /// <summary>
    /// TDLib client for using with generated APIs
    /// </summary>
    public class TdClient : TdApi.Client, IDisposable
    {
        private ITdJsonClient _tdJsonClient;

        private int _taskId;
        private readonly ConcurrentDictionary<int, Action<TdApi.Object>> _tasks;

        private IReceiver _receiver;
        private TdApi.AuthorizationState _authorizationState;

        /// <summary>
        /// Create a new client using the default bindings obtained via <see cref="Interop.AutoDetectBindings"/>, start
        /// the receival loop with the default <see cref="Receiver"/>.
        /// </summary>
        public TdClient() : this(Interop.AutoDetectBindings())
        {
        }

        /// <summary>Create a new client and start the receival loop with the default <see cref="Receiver"/>.</summary>
        /// <param name="bindings">Bindings for the client to call functions of TDLib.</param>
        public TdClient(ITdLibBindings bindings) : this(new TdJsonClient(bindings), TimeSpan.FromSeconds(0.1))
        {
        }

        /// <summary>Create a new client and start the receival loop with the default <see cref="Receiver"/>.</summary>
        /// <param name="bindings">Bindings for the client to call functions of TDLib.</param>
        /// <param name="receiverTimeOut">Timeout for <c>td_json_client_receive</c>.</param>
        public TdClient(ITdLibBindings bindings, TimeSpan receiverTimeOut)
            : this(new TdJsonClient(bindings), receiverTimeOut)
        {
        }

        /// <summary>
        /// Create a new client and start the receival loop with the default <see cref="Receiver"/> constructed from
        /// the passed client object.
        /// </summary>
        /// <param name="tdJsonClient">
        /// The client to execute Telegram functions. <b>Note</b> that the ownership over this object gets passed to
        /// the current <see cref="TdClient"/>.
        /// </param>
        /// <param name="receiverTimeOut">Timeout for <c>td_json_client_receive</c>.</param>
        public TdClient(ITdJsonClient tdJsonClient, TimeSpan receiverTimeOut)
            : this(tdJsonClient, new Receiver(tdJsonClient, receiverTimeOut))
        {
        }

        /// <summary>Create a new client and start the receival loop with the passed <see cref="IReceiver"/>.</summary>
        /// <param name="tdJsonClient">
        /// The client to execute Telegram functions. <b>Note</b> that the ownership over this object gets passed to
        /// the <see cref="TdClient"/>.
        /// </param>
        /// <param name="receiver">
        /// An implementation of <see cref="IReceiver"/> that manages the processing of the Telegram responses.
        /// <b>Note</b> that the ownership over this object gets passed to the current <see cref="TdClient"/>.
        /// </param>
        public TdClient(ITdJsonClient tdJsonClient, IReceiver receiver)
        {
            _tasks = new ConcurrentDictionary<int, Action<TdApi.Object>>();
            _tdJsonClient = tdJsonClient;
            _receiver = receiver;
            _receiver.Received += OnReceived;
            _receiver.AuthorizationStateChanged += OnAuthorizationStateChanged;
            _receiver.Start();
        }

        public ITdLibBindings Bindings => _tdJsonClient.Bindings;

        /// <summary>
        /// How much time should wait for closed state
        /// </summary>
        public TimeSpan TimeoutToClose { get; set; } = TimeSpan.FromMinutes(1.0);

        /// <summary>
        /// Provides updates from TDLib
        /// </summary>
        public override event EventHandler<TdApi.Update> UpdateReceived
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
            if (int.TryParse(obj.Extra, NumberStyles.Integer, CultureInfo.InvariantCulture, out int id)
                && _tasks.TryRemove(id, out var action))
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
                    _updateReceived(this, update);
                }
            }
        }

        private void OnAuthorizationStateChanged(object sender, TdApi.AuthorizationState state)
        {
            _authorizationState = state;
        }

        private readonly object _disposeLock = new object();
        private readonly object _updateLock = new object();
        private readonly ConcurrentQueue<TdApi.Update> _updateBuffer = new ConcurrentQueue<TdApi.Update>();
        private EventHandler<TdApi.Update> _updateReceived;
        private int _updateReceiverCount;

        /// <summary>
        /// Executes function and ignores response
        /// </summary>
        public override void Send<TResut>(TdApi.Function<TResut> function)
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
        public override TResult Execute<TResult>(TdApi.Function<TResult> function)
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
        public override Task<TResult> ExecuteAsync<TResult>(TdApi.Function<TResult> function)
        {
            if (_receiver == null)
            {
                throw new ObjectDisposedException("TDLib client was disposed");
            }

            var id = Interlocked.Increment(ref _taskId);
            var tcs = new TaskCompletionSource<TResult>(TaskCreationOptions.RunContinuationsAsynchronously);

            function.Extra = id.ToString(CultureInfo.InvariantCulture);
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
        /// Disposes client and json client
        /// Updates are stopped from being sent to updates handler
        /// </summary>
        public void Dispose()
        {
            lock (_disposeLock)
            {
                if (_receiver == null || _tdJsonClient == null)
                {
                    return;
                }

                CloseSynchronously();

                _receiver.Dispose();
                _receiver.Received -= OnReceived;
                _receiver.AuthorizationStateChanged -= OnAuthorizationStateChanged;
                _receiver = null;

                _tdJsonClient.Dispose();
                _tdJsonClient = null;
            }
        }

        private async Task CloseAsync()
        {
            var tcs = new TaskCompletionSource<TdApi.AuthorizationState>(
                TaskCreationOptions.RunContinuationsAsynchronously);

            EventHandler<TdApi.AuthorizationState> handler = (_, state) =>
            {
                if (state is TdApi.AuthorizationState.AuthorizationStateClosed)
                {
                    tcs.SetResult(state);
                }
            };

            try
            {
                _receiver.AuthorizationStateChanged += handler;

                if (_authorizationState is TdApi.AuthorizationState.AuthorizationStateClosed)
                {
                    return;
                }

                await ExecuteAsync(new TdApi.Close()).ConfigureAwait(false);
                await Task.WhenAny(tcs.Task, Task.Delay(TimeoutToClose)).ConfigureAwait(false);
            }
            finally
            {
                _receiver.AuthorizationStateChanged -= handler;
            }
        }

        private void CloseSynchronously()
        {
            CloseAsync().GetAwaiter().GetResult();
        }
    }
}
