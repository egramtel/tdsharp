# TDLib

.NET bindings for TDLib (Telegram Database Library): https://github.com/tdlib/td
* Generated API bindings
* .NET Core and .NET Standard support

### Installation

Install via NuGet: ```TDLib```

[![NuGet](https://img.shields.io/nuget/v/TDLib.svg)](https://www.nuget.org/packages/TDLib/)

### Dependencies

You're recommended to use precompiled version of TDLib native artifacts from NuGet:

[![NuGet](https://img.shields.io/nuget/v/tdlib.native.svg)](https://www.nuget.org/packages/tdlib.native/)

Note that `tdlib.native` is not a dependency of `TDLib`, so you may choose to build the binaries yourself and provide them at the runtime.

To do that, [build TDLib](https://core.telegram.org/tdlib/docs/index.html#building) and put the compiled library into your project's output directory
* tdjson.dll (Windows) (optionally accompanied by other DLL files from the build directory if you want to bundle OpenSSL and ZLib dependencies as well)
* libtdjson.dylib (MacOS)
* libtdjson.so (Linux)

### Simple example

Client is a wrapper around native JSON API. Use it to send/receive data as strings.

```csharp
using TdLib;

// create client
var client = new Client();
// sending data
client.Send(json);
// synchronous execution
var result = client.Execute(json);
// receiving data
while (true)
{
    result = client.Receive(timeout);
}
```

### Using generated APIs

This library contains generated classes for API objects and functions. It handles json serialization/deserialization behind the scenes. Use Hub to subscribe to events. Use Dialer to asynchronously call functions.

```csharp
using TdLib;

// receiving data (subscribing to events)
var hub = new Hub(client);
hub.Received += (sender, data) =>
{
    if (data is TdApi.Ok)
    {
        // do something
    }
    else if (data is TdApi.Error)
    {
        // handle error
    }
}
hub.Start();

// asynchronous execution
var dialer = new Dialer(client, hub);
try
{
    TdApi.Ok ok = await dialer.ExecuteAsync(new TdApi.SetAuthenticationPhoneNumber
    {
        PhoneNumber = phoneNumber
    });
    // do something
}
catch (ErrorException e)
{
    TdApi.Error error = e.Error;
    // handle error
}
```

### Authentication example

```csharp
_hub.Received += async (sender, data) =>
{
    switch (data)
    {
        case TdApi.AuthorizationState.AuthorizationStateWaitTdlibParameters _:
            await _dialer.ExecuteAsync(new TdApi.SetTdlibParameters
            {
                Parameters = new TdApi.TdlibParameters
                {
                    UseTestDc = false,
                    DatabaseDirectory = "./path", // directory here
                    FilesDirectory = "./path", // directory here
                    UseFileDatabase = true,
                    UseChatInfoDatabase = true,
                    UseMessageDatabase = true,
                    UseSecretChats = true,
                    ApiId = 123456, // your API ID
                    ApiHash = "hash", // your API HASH
                    SystemLanguageCode = "en",
                    DeviceModel = "Windows",
                    SystemVersion = "0.1",
                    ApplicationVersion = "0.1",
                    EnableStorageOptimizer = true,
                    IgnoreFileNames = false
                }
            });
            break;
            
        case TdApi.AuthorizationState.AuthorizationStateWaitEncryptionKey _:
            await _dialer.ExecuteAsync(new TdApi.CheckDatabaseEncryptionKey());
            break;
        
        case TdApi.AuthorizationState.AuthorizationStateWaitPhoneNumber _:
            await _dialer.ExecuteAsync(new TdApi.SetAuthenticationPhoneNumber
            {
                PhoneNumber = "+01234567789" // your phone
            });
            break;
        
        case TdApi.AuthorizationState.AuthorizationStateWaitCode _:
            await _dialer.ExecuteAsync(new TdApi.CheckAuthenticationCode
            {
                Code = "123456", // your auth code
            });
            break;
        
        case TdApi.AuthorizationState.AuthorizationStateWaitPassword _:
            await _dialer.ExecuteAsync(new TdApi.CheckAuthenticationPassword
            {
                Password = "P@$$w0rd" // your password
            });
            break;
        
        case TdApi.AuthorizationState.AuthorizationStateReady _:
            // now authenticated. do something here
            break;
    }
};
```
