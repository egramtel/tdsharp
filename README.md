# TDSharp

TDSharp - .NET bindings for TDLib (Telegram Database Library) JSON API: https://github.com/tdlib/td
* Generated API bindings
* .NET Core and .NET Standard support

### Dependencies

[Build TDLib](https://core.telegram.org/tdlib/docs/index.html#building) and put the compiled library into your project's output directory
* libtdjson.dll (Windows)
* libtdjson.dylib (MacOS)
* libtdjson.so (Linux)

### Simple example

```csharp
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

```csharp
// receiving data
var hub = new Hub(client);
hub.Received += data =>
{
    if (data is Ok)
    {
        // do something
    }
    else if (data is Error)
    {
        // handle error
    }
}

// asynchronous execution
var dialer = new Dialer(client, hub);
var ok = await dialer.ExecuteAsync(new Methods.setAuthenticationPhoneNumber
{
    phone_number_ = phoneNumber
});
```
