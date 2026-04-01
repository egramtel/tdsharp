// SPDX-FileCopyrightText: 2024-2026 tdsharp contributors <https://github.com/egramtel/tdsharp>
//
// SPDX-License-Identifier: MIT

using System;

namespace TdLib.Bindings;

/// <summary>An object responsible for the loop of processing the data received from the Telegram server.</summary>
public interface IReceiver : IDisposable
{
    /// <summary>An event that happens when any data object is received from Telegram.</summary>
    event EventHandler<TdApi.Object> Received;
    /// <summary>An event that happens when the authorization state changes.</summary>
    event EventHandler<TdApi.AuthorizationState> AuthorizationStateChanged;
    /// <summary>
    /// An event that happens when any exception (except cancellation) is thrown during the data processing loop.
    /// </summary>
    event EventHandler<Exception> ExceptionThrown;

    /// <summary>Start the data processing loop asynchronously. Not a blocking method.</summary>
    void Start();
}
