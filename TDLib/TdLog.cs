using System;
using TdLib.Bindings;

namespace TdLib
{
    public static class TdLog
    {
        public static bool SetFilePath(string path)
        {
            var ptr = Interop.StringToIntPtr(path);

            try
            {
                return Interop.Bindings.SetLogFilePath(ptr) != 0;
            }
            finally
            {
                Interop.FreeIntPtr(ptr);
            }
        }

        public static void SetMaxFileSize(long size)
        {
            Interop.Bindings.SetLogFileMaxSize(size);
        }

        public static void SetVerbosityLevel(int level)
        {
            Interop.Bindings.SetLogVerbosityLevel(level);
        }

        public static void SetFatalErrorCallback(Action<string> callback)
        {
            Interop.Bindings.SetLogFatalErrorCallback(ptr =>
            {
                var str = Interop.IntPtrToString(ptr);
                callback(str);
            });
        }
    }
}