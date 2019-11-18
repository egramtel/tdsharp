﻿using System;
using System.Collections.Concurrent;
using System.Threading;
using System.Threading.Tasks;
using Newtonsoft.Json;
using TdLib;

namespace TDLib.Bindings
{
    internal class Receiver : IDisposable
    {
        private readonly Converter _converter;
        private readonly TdJsonClient _tdJsonClient;
        
        private readonly CancellationTokenSource _cts = new CancellationTokenSource();
        private readonly ManualResetEventSlim _stopped = new ManualResetEventSlim(false);
        
        internal event EventHandler<TdApi.Object> Received;
        internal event EventHandler<TdApi.AuthorizationState> AuthorizationStateChanged;
        
        internal Receiver(TdJsonClient tdJsonClient)
        {
            _converter = new Converter();
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
                },
                TaskCreationOptions.LongRunning);
        }

        private void ProcessEvents()
        {
            var ct = _cts.Token;
            while (!ct.IsCancellationRequested)
            {
                string data = null;
                try
                {
                    data = _tdJsonClient.Receive(0.1);

                    if (!string.IsNullOrEmpty(data))
                    {
                        var structure = JsonConvert.DeserializeObject<TdApi.Object>(data, _converter);

                        Received?.Invoke(this, structure);

                        if (structure is TdApi.Update.UpdateAuthorizationState update)
                        {
                            AuthorizationStateChanged?.Invoke(this, update.AuthorizationState);
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw new TdApiNotFoundException(data, ex);
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