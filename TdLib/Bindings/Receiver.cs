// SPDX-FileCopyrightText: 2024-2026 tdsharp contributors <https://github.com/egramtel/tdsharp>
//
// SPDX-License-Identifier: MIT

using System;
using System.Threading;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace TdLib.Bindings
{
    public interface IReceiver: IDisposable
    {
        event EventHandler<TdApi.Object> Received;
        event EventHandler<TdApi.AuthorizationState> AuthorizationStateChanged;
        event EventHandler<Exception> ExceptionThrown;

        void Start();
    }
    public sealed class Receiver(ITdJsonClient tdJsonClient, TimeSpan receiverTimeOut) : IReceiver
    {
        private readonly Converter _converter = new();
        private readonly double _receiverTimeOutSeconds = receiverTimeOut.TotalSeconds;

        private readonly CancellationTokenSource _cts = new CancellationTokenSource();
        private readonly ManualResetEventSlim _stopped = new ManualResetEventSlim(false);

        public event EventHandler<TdApi.Object> Received;
        public event EventHandler<TdApi.AuthorizationState> AuthorizationStateChanged;
        public event EventHandler<Exception> ExceptionThrown;

        public void Start()
        {
            _ = Task.Factory.StartNew(async () =>
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
                },
                TaskCreationOptions.LongRunning);
        }

        private void ProcessEvents()
        {
            var ct = _cts.Token;
            while (!ct.IsCancellationRequested)
            {
                var data = tdJsonClient.Receive(_receiverTimeOutSeconds);

                if (!string.IsNullOrEmpty(data))
                {
                    try
                    {
                        var structure = JsonConvert.DeserializeObject<TdApi.Object>(data, _converter);

                        Received?.Invoke(this, structure);

                        if (structure is TdApi.Update.UpdateAuthorizationState update)
                        {
                            AuthorizationStateChanged?.Invoke(this, update.AuthorizationState);
                        }
                    }
                    catch (Exception e)
                    {
                        ExceptionThrown?.Invoke(this, e);
                    }
                }
            }
        }

        public void Dispose()
        {
            if (!_cts.IsCancellationRequested)
            {
                _cts.Cancel();
            }

            _stopped.Wait();
        }
    }
}
