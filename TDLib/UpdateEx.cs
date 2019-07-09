namespace TdLib
{
    internal static class UpdateEx
    {
        public static bool IsAuthorizationStateClosed(this TdApi.Update update) =>
            update is TdApi.Update.UpdateAuthorizationState stateUpdate
            && stateUpdate.AuthorizationState is TdApi.AuthorizationState.AuthorizationStateClosed;
    }
}