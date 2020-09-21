using System;
using System.IO;
using System.Runtime.InteropServices;
using System.Text;
using TDLib.Bindings;

namespace TdLib.Bindings
{
    internal static class Interop
    {
        internal static ITdLibBindings AutoDetectBindings()
        {
            if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
            {
                return WindowsBindings.Instance;
            }
            else if (RuntimeInformation.IsOSPlatform(OSPlatform.OSX))
            {
                return MacosBindings.Instance;
            }
            else if (RuntimeInformation.IsOSPlatform(OSPlatform.Linux))
            {
                return LinuxBindings.Instance;
            }

            throw new PlatformNotSupportedException($"Current platform is not supported by TdLib. Please pass your own instance of {typeof(ITdLibBindings).FullName} to a constructor of {typeof(TdClient).FullName} or {typeof(TdJsonClient).FullName}.");
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