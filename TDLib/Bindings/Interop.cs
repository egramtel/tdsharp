﻿using System;
using System.IO;
using System.Runtime.InteropServices;
using System.Text;

namespace TdLib.Bindings
{
    internal static class Interop
    {
        internal static readonly Func<IntPtr> ClientCreate; // handle
        internal static readonly Action<IntPtr> ClientDestroy; // handle
        internal static readonly Action<IntPtr, IntPtr> ClientSend; // handle, str
        internal static readonly Func<IntPtr, double, IntPtr> ClientReceive; // handle, time -> str
        internal static readonly Func<IntPtr, IntPtr, IntPtr> ClientExecute; // handle, str -> str
        
        internal static readonly Func<IntPtr, int> SetLogFilePath; // str -> int
        internal static readonly Action<long> SetLogFileMaxSize; // long
        internal static readonly Action<int> SetLogVerbosityLevel; // int
        internal static readonly Action<Callback> SetLogFatalErrorCallback; // callback(str)
        
        static Interop()
        {
            if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
            {
                ClientCreate = WindowsBindings.td_json_client_create;
                ClientDestroy = WindowsBindings.td_json_client_destroy;
                ClientSend = WindowsBindings.td_json_client_send;
                ClientReceive = WindowsBindings.td_json_client_receive;
                ClientExecute = WindowsBindings.td_json_client_execute;
                SetLogFilePath = WindowsBindings.td_set_log_file_path;
                SetLogFileMaxSize = WindowsBindings.td_set_log_max_file_size;
                SetLogVerbosityLevel = WindowsBindings.td_set_log_verbosity_level;
                SetLogFatalErrorCallback = WindowsBindings.td_set_log_fatal_error_callback;
            }
            else if (RuntimeInformation.IsOSPlatform(OSPlatform.OSX))
            {
                ClientCreate = MacosBindings.td_json_client_create;
                ClientDestroy = MacosBindings.td_json_client_destroy;
                ClientSend = MacosBindings.td_json_client_send;
                ClientReceive = MacosBindings.td_json_client_receive;
                ClientExecute = MacosBindings.td_json_client_execute;
                SetLogFilePath = MacosBindings.td_set_log_file_path;
                SetLogFileMaxSize = MacosBindings.td_set_log_max_file_size;
                SetLogVerbosityLevel = MacosBindings.td_set_log_verbosity_level;
                SetLogFatalErrorCallback = MacosBindings.td_set_log_fatal_error_callback;
            }
            else if (RuntimeInformation.IsOSPlatform(OSPlatform.Linux))
            {
                ClientCreate = LinuxBindings._td_json_client_create;
                ClientDestroy = LinuxBindings._td_json_client_destroy;
                ClientSend = LinuxBindings._td_json_client_send;
                ClientReceive = LinuxBindings._td_json_client_receive;
                ClientExecute = LinuxBindings._td_json_client_execute;
                SetLogFilePath = LinuxBindings.td_set_log_file_path;
                SetLogFileMaxSize = LinuxBindings.td_set_log_max_file_size;
                SetLogVerbosityLevel = LinuxBindings.td_set_log_verbosity_level;
                SetLogFatalErrorCallback = LinuxBindings.td_set_log_fatal_error_callback;
            }
        }
        
        internal static string IntPtrToString(IntPtr ptr)
        {
            if (ptr == IntPtr.Zero)
            {
                return null;
            }
            
            using (var data = new MemoryStream())
            {
                int offset = 0;
            
                while (true)
                {
                    byte b = Marshal.ReadByte(ptr, offset++);
                    
                    if (b == 0)
                    {
                        break;
                    }
                    
                    data.WriteByte(b);
                }
            
                return Encoding.UTF8.GetString(data.ToArray());
            }
        }

        internal static IntPtr StringToIntPtr(string str)
        {
            var n = Encoding.UTF8.GetByteCount(str);
            var buf = new byte[n + 1];
 
            Encoding.UTF8.GetBytes(str, 0, str.Length, buf, 0);
            var ptr = Marshal.AllocHGlobal(buf.Length);
            Marshal.Copy(buf, 0, ptr, buf.Length);

            return ptr;
        }

        internal static void FreeIntPtr(IntPtr ptr)
        {
            Marshal.FreeHGlobal(ptr);
        }
    }
}
