using System;

namespace TdLib.Bindings;

public interface IReceiver: IDisposable
{
    event EventHandler<TdApi.Object> Received;
    event EventHandler<TdApi.AuthorizationState> AuthorizationStateChanged;
    event EventHandler<Exception> ExceptionThrown;

    void Start();
}
