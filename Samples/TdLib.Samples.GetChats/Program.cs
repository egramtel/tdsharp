using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace TdLib.Samples.GetChats
{
    class Program
    {
        private static readonly int ApiId = 0;
        private static readonly string ApiHash = "";
        private static readonly string PhoneNumber = ""; // must contain prefix

        private static readonly ManualResetEventSlim ResetEvent = new ManualResetEventSlim();
        private static bool _authNeeded;
        private static TdClient _client;

        static async Task Main(string[] args)
        {
            _client = new TdClient();
            _client.Bindings.SetLogVerbosityLevel(0);

            _client.UpdateReceived += async (sender, update) =>
            {
                switch (update)
                {
                    case TdApi.Update.UpdateOption option:
                        await _client.ExecuteAsync(new TdApi.SetOption
                        {
                            DataType = option.DataType,
                            Extra = option.Extra,
                            Name = option.Name,
                            Value = option.Value
                        });
                        break;
                    case TdApi.Update.UpdateAuthorizationState updateAuthorizationState when updateAuthorizationState.AuthorizationState.GetType() == typeof(TdApi.AuthorizationState.AuthorizationStateWaitTdlibParameters):
                        await _client.ExecuteAsync(new TdApi.SetTdlibParameters
                        {
                            Parameters = new TdApi.TdlibParameters
                            {
                                ApiId = ApiId,
                                ApiHash = ApiHash,
                                ApplicationVersion = "1.3.0",
                                DeviceModel = "PC",
                                SystemLanguageCode = "en",
                                SystemVersion = "Win 10.0"
                            }
                        });
                        break;
                    case TdApi.Update.UpdateAuthorizationState updateAuthorizationState when updateAuthorizationState.AuthorizationState.GetType() == typeof(TdApi.AuthorizationState.AuthorizationStateWaitEncryptionKey):
                        await _client.ExecuteAsync(new TdApi.CheckDatabaseEncryptionKey());
                        break;
                    case TdApi.Update.UpdateAuthorizationState updateAuthorizationState when updateAuthorizationState.AuthorizationState.GetType() == typeof(TdApi.AuthorizationState.AuthorizationStateWaitPhoneNumber):
                        _authNeeded = true;
                        ResetEvent.Set();
                        break;
                    case TdApi.Update.UpdateAuthorizationState updateAuthorizationState when updateAuthorizationState.AuthorizationState.GetType() == typeof(TdApi.AuthorizationState.AuthorizationStateWaitCode):
                        _authNeeded = true;
                        ResetEvent.Set();
                        break;
                    case TdApi.Update.UpdateUser updateUser:
                        ResetEvent.Set();
                        break;
                    case TdApi.Update.UpdateConnectionState updateConnectionState when updateConnectionState.State.GetType() == typeof(TdApi.ConnectionState.ConnectionStateReady):
                        break;

                    default:
                        ; // add a breakpoint here to see other events
                        break;
                }
            };

            ResetEvent.Wait();
            if (_authNeeded)
            {
                await _client.ExecuteAsync(new TdApi.SetAuthenticationPhoneNumber
                {
                    PhoneNumber = PhoneNumber
                });
                Console.Write("Insert the login code: ");
                var code = Console.ReadLine();
                await _client.ExecuteAsync(new TdApi.CheckAuthenticationCode
                {
                    Code = code
                });
            }

            await foreach (var chat in GetChannels())
            {
                Console.WriteLine(chat.Title);
            }

            Console.ReadLine();
        }

        public static async IAsyncEnumerable<TdApi.Chat> GetChannels(long offsetOrder = long.MaxValue, long offsetId = 0, int limit = 1000)
        {
            var chats = await _client.ExecuteAsync(new TdApi.GetChats { OffsetOrder = offsetOrder, Limit = limit, OffsetChatId = offsetId });
            foreach (var chatId in chats.ChatIds)
            {
                var chat = await _client.ExecuteAsync(new TdApi.GetChat { ChatId = chatId });
                if (chat.Type is TdApi.ChatType.ChatTypeSupergroup || chat.Type is TdApi.ChatType.ChatTypeBasicGroup || chat.Type is TdApi.ChatType.ChatTypePrivate)
                {
                    yield return chat;
                }
            }
        }
    }
}
