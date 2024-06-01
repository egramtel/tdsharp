// SPDX-FileCopyrightText: 2024 tdsharp contributors <https://github.com/egramtel/tdsharp>
//
// SPDX-License-Identifier: MIT

namespace TdLib.Bindings
{
    public static class TdLibBindingsExtensions
    {
        public static void SetLogFilePath(this ITdLibBindings bindings, string path)
        {
            var ptr = Interop.StringToIntPtr(path);
            bindings.SetLogFilePath(ptr);
        }

        public static void SetLogVerbosityLevel(this ITdLibBindings bindings, TdLogLevel level)
        {
            bindings.SetLogVerbosityLevel((int)level);
        }
    }
}
