// SPDX-FileCopyrightText: 2024-2026 tdsharp contributors <https://github.com/egramtel/tdsharp>
//
// SPDX-License-Identifier: MIT

using System;
using TdLib.Bindings;

namespace TdLib;

/// <summary>A client object that's responsible for Telegram server interaction.</summary>
public interface ITdJsonClient : IDisposable
{
    /// <summary>Bindings to native TDLib.</summary>
    public ITdLibBindings Bindings { get; }

    /// <summary>Synchronously send a JSON string to TDLib and get the response.</summary>
    public string Execute(string data);

    /// <summary>Send a JSON string to TDLib (ignores the response).</summary>
    public void Send(string data);

    /// <summary>Receive one JSON string from TDLib.</summary>
    /// <param name="timeout">Timeout in seconds.</param>
    public string Receive(double timeout);
}
