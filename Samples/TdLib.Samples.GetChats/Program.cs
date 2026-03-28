// SPDX-FileCopyrightText: 2024 tdsharp contributors <https://github.com/egramtel/tdsharp>
//
// SPDX-License-Identifier: MIT

using System;
using System.Collections.Generic;
using System.IO;
using System.Threading;
using System.Threading.Tasks;
using TdLib.Bindings;
using TdLib.TdApi;
using TdLib.TdApi.Objects;

namespace TdLib.Samples.GetChats;

internal static class Program
{
    private const int ApiId = 0;
    private const string ApiHash = "";
    // PhoneNumber must contain international phone with (+) prefix.
    // For example +16171234567
    private const string PhoneNumber = "";
    private const string ApplicationVersion = "1.0.0";

    private static TdClient _client;
    private static readonly ManualResetEventSlim ReadyToAuthenticate = new();

    private static bool _authNeeded;
    private static bool _passwordNeeded;

    private static async Task Main()
    {
        // Creating Telegram client and setting minimal verbosity to Fatal since we don't need a lot of logs :)
        _client = new TdClient();
        _client.Bindings.SetLogVerbosityLevel(TdLogLevel.Fatal);

        // Subscribing to all events
        _client.UpdateReceived += async (_, update) => { await ProcessUpdates(update); };

        // Waiting until we get enough events to be in 'authentication ready' state
        ReadyToAuthenticate.Wait();

        // We may not need to authenticate since TdLib persists session in 'td.binlog' file.
        // See 'TdlibParameters' class for more information, or:
        // https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1tdlib_parameters.html
        if (_authNeeded)
        {
            // Interactively handling authentication
            await HandleAuthentication();
        }

        // Querying info about current user and some channels
        var currentUser = await GetCurrentUser();

        var fullUserName = $"{currentUser.FirstName} {currentUser.LastName}".Trim();
        Console.WriteLine($"Successfully logged in as [{currentUser.Id}] / [@{currentUser.Usernames?.ActiveUsernames[0]}] / [{fullUserName}]");

        const int channelLimit = 5;
        var channels = GetChannels(channelLimit);

        Console.WriteLine($"Top {channelLimit} channels:");

        await foreach (var channel in channels)
        {
            Console.WriteLine($"[{channel.Id}] -> [{channel.Title}] ({channel.UnreadCount} messages unread)");
        }

        Console.WriteLine("Press ENTER to exit from application");
        Console.ReadLine();
    }

    private static async Task HandleAuthentication()
    {
        // Setting phone number
        await _client.ExecuteAsync(new SetAuthenticationPhoneNumber
        {
            PhoneNumber = PhoneNumber
        });

        // Telegram servers will send code to us
        Console.Write("Insert the login code: ");
        var code = Console.ReadLine();

        await _client.ExecuteAsync(new CheckAuthenticationCode
        {
            Code = code
        });

        if(!_passwordNeeded) { return; }

        // 2FA may be enabled. Cloud password is required in that case.
        Console.Write("Insert the password: ");
        var password = Console.ReadLine();

        await _client.ExecuteAsync(new CheckAuthenticationPassword
        {
            Password = password
        });
    }

    private static async Task ProcessUpdates(Update update)
    {
        // Since Tdlib was made to be used in GUI application we need to struggle a bit and catch required events to determine our state.
        // Below you can find example of simple authentication handling.
        // Please note that AuthorizationStateWaitOtherDeviceConfirmation is not implemented.

        switch (update)
        {
            case Update.UpdateAuthorizationState { AuthorizationState: AuthorizationState.AuthorizationStateWaitTdlibParameters }:
                // TdLib creates database in the current directory.
                // so create separate directory and switch to that dir.
                var filesLocation = Path.Combine(AppContext.BaseDirectory, "db");
                await _client.ExecuteAsync(new SetTdlibParameters
                {
                    ApiId = ApiId,
                    ApiHash = ApiHash,
                    DeviceModel = "PC",
                    SystemLanguageCode = "en",
                    ApplicationVersion = ApplicationVersion,
                    DatabaseDirectory = filesLocation,
                    FilesDirectory = filesLocation,
                    // More parameters available!
                });
                break;

            case Update.UpdateAuthorizationState { AuthorizationState: AuthorizationState.AuthorizationStateWaitPhoneNumber }:
            case Update.UpdateAuthorizationState { AuthorizationState: AuthorizationState.AuthorizationStateWaitCode }:
                _authNeeded = true;
                ReadyToAuthenticate.Set();
                break;

            case Update.UpdateAuthorizationState { AuthorizationState: AuthorizationState.AuthorizationStateWaitPassword }:
                _authNeeded = true;
                _passwordNeeded = true;
                ReadyToAuthenticate.Set();
                break;

            case Update.UpdateUser:
                ReadyToAuthenticate.Set();
                break;

            case Update.UpdateConnectionState { State: ConnectionState.ConnectionStateReady }:
                // You may trigger additional event on connection state change
                break;

            default:
                // ReSharper disable once EmptyStatement
                ;
                // Add a breakpoint here to see other events
                break;
        }
    }

    private static async Task<User> GetCurrentUser()
    {
        return await _client.ExecuteAsync(new GetMe());
    }

    private static async IAsyncEnumerable<Chat> GetChannels(int limit)
    {
        var chats = await _client.ExecuteAsync(new TdApi.GetChats
        {
            Limit = limit
        });

        foreach (var chatId in chats.ChatIds)
        {
            var chat = await _client.ExecuteAsync(new GetChat
            {
                ChatId = chatId
            });

            if (chat.Type is ChatType.ChatTypeSupergroup or ChatType.ChatTypeBasicGroup or ChatType.ChatTypePrivate)
            {
                yield return chat;
            }
        }
    }
}
