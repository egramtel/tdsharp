<!--
SPDX-FileCopyrightText: 2024 tdsharp contributors <https://github.com/egramtel/tdsharp>

SPDX-License-Identifier: MIT
-->

# TDLib

.NET bindings for **TDLib** (Telegram Database Library): https://github.com/tdlib/td
* Generated API bindings
* Supports .NET Standard 2.0 and later

### Installation

Install via NuGet: ```TDLib```

[![NuGet](https://img.shields.io/nuget/v/TDLib.svg)](https://www.nuget.org/packages/TDLib/)

### Dependencies

You're recommended to use precompiled version of TDLib native artifacts from NuGet: **tdlib.native**.

[![NuGet](https://img.shields.io/nuget/v/tdlib.native.svg)](https://www.nuget.org/packages/tdlib.native/)

Note that this is the main cross-platform package, and there are per-platform packages and additional options described in [the tdlib.native documentation][tdlib-native.docs].

Note that `tdlib.native` is not a dependency of `TDLib`, so you may choose to build the binaries yourself and provide them at the runtime.

To do that, [build TDLib](https://core.telegram.org/tdlib/docs/index.html#building) and put the compiled library into your project's output directory
* tdjson.dll (Windows) (optionally accompanied by other DLL files from the build directory if you want to bundle OpenSSL and ZLib dependencies as well)
* libtdjson.dylib (MacOS)
* libtdjson.so (Linux)

### Have a question?

Report bugs to the [issue tracker][issues].

Ask questions at [the discussion section on GitHub][discussions].

### Using json client

TdJsonClient is a wrapper around native JSON APIs. Use it to send/receive data as strings.

```csharp
using TdLib;

var json = ""; // json data
double timeout = 1.0; // 1 second

using (var jsonClient = new TdJsonClient())
{
    jsonClient.Send(json); // send request
    var result = jsonClient.Receive(timeout); // receive response
}
```

### Using strongly typed APIs

This library contains generated classes for objects and functions. JSON serialization and deserialization is handled automatically. Use TdClient to asynchronously execute functions.

```csharp
using TdLib;

using (var client = new TdClient())
{
    try
    {
        // asynchronously execute function
        TdApi.Ok ok = await client.ExecuteAsync(new TdApi.SetAuthenticationPhoneNumber
        {
            PhoneNumber = phoneNumber
        });

        // or use extension method
        ok = await client.SetAuthenticationPhoneNumberAsync(phoneNumber);

        // do something...
    }
    catch (ErrorException e)
    {
        TdApi.Error error = e.Error;

        // handle error...
    }
}
```

### Overriding native bindings

By default, TdSharp will try to detect the platform and use the corresponding bindings to native td library. In case you want to override it (e.g. for Xamarin), create a custom implementation of `ITdLibBindings` (which corresponds to native library interface used by TdSharp) and pass it to `TdClient` constructor.

### Documentation

- [Changelog][docs.changelog]
- [Contributor Guide][docs.contributing]
- [Instructions for Maintainers][docs.maintainership]

### License
All the project code is licensed under [the MIT license][docs.license].

The code generated from the upstream TDLib has the same license as TDLib, which is [the Boost Software License - Version 1.0][docs.license.bsl].

The license indication in the project's sources is compliant with the [REUSE specification v3.0][reuse.spec].

[discussions]: https://github.com/egramtel/tdsharp/discussions
[docs.changelog]: ./CHANGELOG.md
[docs.contributing]: CONTRIBUTING.md
[docs.license.bsl]: https://github.com/tdlib/td/blob/f35dea776cdaa8b986e2a634dfabf0dafe659be7/LICENSE_1_0.txt
[docs.license]: ./LICENSE
[docs.maintainership]: ./MAINTAINERSHIP.md
[issues]: https://github.com/egramtel/tdsharp/issues
[tdlib-native.docs]: https://github.com/ForNeVeR/tdlib.native
