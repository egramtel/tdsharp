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
                return Interop.SetLogFilePath(ptr) != 0;
            }
            finally
            {
                Interop.FreeIntPtr(ptr);
            }
        }

        public static void SetMaxFileSize(long size)
        {
            Interop.SetLogFileMaxSize(size);
        }

        public static void SetVerbosityLevel(int level)
        {
            Interop.SetLogVerbosityLevel(level);
        }

        public static void SetFatalErrorCallback(Action<string> callback)
        {
            Interop.SetLogFatalErrorCallback(ptr =>
            {
                var str = Interop.IntPtrToString(ptr);
                callback(str);
            });
        }
    }
}