# TDLib

.NET bindings for TDLib (Telegram Database Library): https://github.com/tdlib/td
* Generated API bindings
* .NET Core and .NET Standard support

### Installation

Install via NuGet: ```TDLib```

[![NuGet](https://img.shields.io/nuget/v/TDLib.svg)](https://www.nuget.org/packages/TDLib/)

### Dependencies

[Build TDLib](https://core.telegram.org/tdlib/docs/index.html#building) and put the compiled library into your project's output directory
* tdjson.dll (Windows)
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
    result = cient.Receive(timeout);
}
```

### Using generated APIs

This library contains generated classes for API objects and functions. It handles json serialization/deserialization behind the scenes. Use Hub to subscribe to events. Use Dialer to asynchronously call functions.

```csharp
using TdLib;

// receiving data
var hub = new Hub(client);
hub.Received += data =>
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
