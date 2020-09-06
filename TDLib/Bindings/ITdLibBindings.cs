using System;
using TdLib.Bindings;

namespace TDLib.Bindings
{
    public interface ITdLibBindings
    {
        /// <returns>A client handle.</returns>
        IntPtr ClientCreate();
        void ClientDestroy(IntPtr clientHandle);
        void ClientSend(IntPtr clientHandle, IntPtr str);
        /// <returns>A pointer to a string.</returns>
        IntPtr ClientReceive(IntPtr clientHandle, double time);
        /// <returns>A pointer to a string.</returns>
        IntPtr ClientExecute(IntPtr clientHandle, IntPtr str);
        int SetLogFilePath(IntPtr str);
        void SetLogFileMaxSize(long size);
        void SetLogVerbosityLevel(int level);
        void SetLogFatalErrorCallback(Callback stringCallback);
    }
}