using System;

// ReSharper disable once CheckNamespace
namespace TDLib.Bindings;

#pragma warning disable MA0048

// TODO[#114]: Delete these obsolete types in the next update.

[Obsolete("Use TdLib.Bindings.ITdLibBindings instead (check the namespace case)", error: true)]
public interface ITdLibBindings : TdLib.Bindings.ITdLibBindings {}

[Obsolete("Use TdLib.Bindings.TdLibBindingsExtensions instead (check the namespace case)", error: true)]
public static class TdLibBindingsExtensions
{
    public static void SetLogFilePath(this ITdLibBindings bindings, string path)
    {
        TdLib.Bindings.TdLibBindingsExtensions.SetLogFilePath(bindings, path);
    }

    public static void SetLogVerbosityLevel(this ITdLibBindings bindings, TdLogLevel level)
    {
        TdLib.Bindings.TdLibBindingsExtensions.SetLogVerbosityLevel(bindings, (TdLib.Bindings.TdLogLevel)level);
    }
}

[Obsolete("Use TdLib.Bindings.TdLogLevel instead (check the namespace case)", error: true)]
public enum TdLogLevel
{
    Fatal = 0,
    Error = 1,
    Warning = 2,
    Info = 3,
    Debug = 4,
    Verbose = 5,
    All = 1024
}
