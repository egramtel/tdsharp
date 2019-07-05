using System;
using System.Threading.Tasks;

namespace TdLib
{
    public static class TdClientEx
    {
        public static async Task<TdApi.Update> WaitForUpdate(
            this TdClient client, 
            Func<TdApi.Update, bool> condition, 
            TimeSpan timeout)
        {
            var tcs = new TaskCompletionSource<TdApi.Update>();
            EventHandler<TdApi.Update> handler = (_, update) =>
            {
                if (condition(update))
                {
                    tcs.SetResult(update);
                }
            };

            try
            {
                client.UpdateReceived += handler;

                var delay = Task.Delay(timeout);
                var result = await Task.WhenAny(tcs.Task, delay);
                if (result == delay) return null;
                
                return tcs.Task.Result;
            }
            finally
            {
                client.UpdateReceived -= handler;
            }
        }
    }
}