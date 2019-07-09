using System.Threading.Tasks;

namespace TDLib.Bindings
{
    internal static class ReceiverEx
    {
        public delegate T ReceiverStateFunc<T>(ref Receiver.ReceiverInternalState state);
        public static Task<T> Queue<T>(this Receiver receiver, ReceiverStateFunc<T> func)
        {
            var tcs = new TaskCompletionSource<T>();

            receiver.ScheduleAction((ref Receiver.ReceiverInternalState state) =>
            {
                var result = func(ref state);
                tcs.SetResult(result);
            });

            return tcs.Task;
        }

        public static Task Queue(this Receiver receiver, Receiver.ReceiverStateAction action) =>
            receiver.Queue<object>((ref Receiver.ReceiverInternalState state) =>
            {
                action(ref state);
                return null;
            });
    }
}