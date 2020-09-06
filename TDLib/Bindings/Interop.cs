using System;
using System.IO;
using System.Runtime.InteropServices;
using System.Text;
using TDLib.Bindings;

namespace TdLib.Bindings
{
    internal static class Interop
    {
        private static readonly object Lock = new object();
        private static volatile ITdLibBindings _bindings;
        public static ITdLibBindings Bindings
        {
            get
            {
                if (_bindings == null)
                {
                    lock (Lock)
                    {
                        if (_bindings == null)
                            _bindings = AutoDetectBindings();
                    }
                }

                return _bindings;
            }
            set
            {
                if (value == null) throw new ArgumentNullException();
                lock(Lock) _bindings = value;
            }
        }
        
        private static ITdLibBindings AutoDetectBindings()
        {
            if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
            {
                return new WindowsBindings();
            }
            else if (RuntimeInformation.IsOSPlatform(OSPlatform.OSX))
            {
                return new MacosBindings();
            }
            else if (RuntimeInformation.IsOSPlatform(OSPlatform.Linux))
            {
                return new LinuxBindings();
            }

            throw new PlatformNotSupportedException($"Current platform is not supported by TdLib. Please override static property {typeof(Interop).FullName}.{nameof(Bindings)}.");
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