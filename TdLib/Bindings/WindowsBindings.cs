using System;
using System.Runtime.InteropServices;

namespace TdLib.Bindings
{
    internal class WindowsBindings : ITdLibBindings
    {
        private const string Dll = "tdjson.dll";
        
        [DllImport(Dll)]
        internal static extern IntPtr td_json_client_create();
        
        [DllImport(Dll)]
        internal static extern void td_json_client_destroy(IntPtr handle);
        
        [DllImport(Dll)]
        internal static extern void td_json_client_send(IntPtr handle, IntPtr data);
        
        [DllImport(Dll)]
        internal static extern IntPtr td_json_client_receive(IntPtr handle, double t);
        
        [DllImport(Dll)]
        internal static extern IntPtr td_json_client_execute(IntPtr handle, IntPtr data);
        
        [DllImport(Dll)]
        internal static extern int td_set_log_file_path(IntPtr path);
        
        [DllImport(Dll)]
        internal static extern void td_set_log_max_file_size(long size);
        
        [DllImport(Dll)]
        internal static extern void td_set_log_verbosity_level(int level);
        
        [DllImport(Dll)]
        internal static extern void td_set_log_fatal_error_callback([MarshalAs(UnmanagedType.FunctionPtr)]Callback callback);

        public IntPtr ClientCreate() => td_json_client_create();
        public void ClientDestroy(IntPtr clientHandle) => td_json_client_destroy(clientHandle);
        public void ClientSend(IntPtr clientHandle, IntPtr str) => td_json_client_send(clientHandle, str);
        public IntPtr ClientReceive(IntPtr clientHandle, double time) => td_json_client_receive(clientHandle, time);
        public IntPtr ClientExecute(IntPtr clientHandle, IntPtr str) => td_json_client_execute(clientHandle, str);
        public int SetLogFilePath(IntPtr str) => td_set_log_file_path(str);
        public void SetLogFileMaxSize(long size) => td_set_log_max_file_size(size);
        public void SetLogVerbosityLevel(int level) => td_set_log_verbosity_level(level);
        public void SetLogFatalErrorCallback(Callback stringCallback) => td_set_log_fatal_error_callback(stringCallback);

        private WindowsBindings() {}
        public static readonly WindowsBindings Instance = new WindowsBindings();
    }
}