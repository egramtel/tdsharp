using System;
using TdLib.Bindings;

namespace TdLib;

public interface ITdJsonClient : IDisposable
{
    public ITdLibBindings Bindings { get; }
    public string Execute(string data);
    public void Send(string data);
    public string Receive(double timeout);
}
