// SPDX-FileCopyrightText: 2024-2026 tdsharp contributors <https://github.com/egramtel/tdsharp>
//
// SPDX-License-Identifier: MIT

using System;
using System.Threading;
using System.Threading.Tasks;
using Newtonsoft.Json;
using TdLib.TdApi.Objects;

using Object = TdLib.TdApi.Object;
namespace TdLib.Bindings;

internal class Receiver : IDisposable
{
    private readonly Converter _converter;
    private readonly TdJsonClient _tdJsonClient;
    private readonly double _receiverTimeOutSeconds;

    private readonly CancellationTokenSource _cts = new CancellationTokenSource();
    private readonly ManualResetEventSlim _stopped = new ManualResetEventSlim(false);

    internal event EventHandler<Object> Received;
    internal event EventHandler<AuthorizationState> AuthorizationStateChanged;
    internal event EventHandler<Exception> ExceptionThrown;

    internal Receiver(TdJsonClient tdJsonClient, TimeSpan receiverTimeOut)
    {
        _converter = new Converter();
        _tdJsonClient = tdJsonClient;
        _receiverTimeOutSeconds = receiverTimeOut.TotalSeconds;
    }

    internal void Start()
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
            var data = _tdJsonClient.Receive(_receiverTimeOutSeconds);

            if (!string.IsNullOrEmpty(data))
            {
                try
                {
                    var structure = JsonConvert.DeserializeObject<TdApi.Object>(data, _converter);

                    Received?.Invoke(this, structure);

                    if (structure is Update.UpdateAuthorizationState update)
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
