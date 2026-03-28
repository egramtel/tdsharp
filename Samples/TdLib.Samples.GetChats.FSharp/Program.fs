// SPDX-FileCopyrightText: 2024 tdsharp contributors <https://github.com/egramtel/tdsharp>
//
// SPDX-License-Identifier: MIT

open System
open System.IO
open System.Threading
open System.Threading.Tasks
open TdLib.Bindings
open TdLib
open TdLib.TdApi
open TdLib.TdApi.Objects

let apiId = 0
let apiHash = ""
// PhoneNumber must contain international phone with (+) prefix.
// For example +16171234567
let phoneNumber = ""
let applicationVersion = "1.0.0"

let mutable client = Unchecked.defaultof<TdClient>

let readyToAuthenticate = new ManualResetEventSlim()

let mutable authNeeded = false
let mutable passwordNeeded = false

let handleAuthentication() = task {
    do! client.ExecuteAsync(SetAuthenticationPhoneNumber(PhoneNumber = phoneNumber)) :> Task

    // Telegram servers will send code to us
    printfn "Insert the login code: "
    let code = Console.ReadLine()
    do! client.ExecuteAsync(CheckAuthenticationCode(Code = code)) :> Task

    if passwordNeeded then
        // 2FA may be enabled. Cloud password is required in that case.
        printf "Insert the password: "
        let password = Console.ReadLine()
        do! client.ExecuteAsync(CheckAuthenticationPassword(Password = password)) :> Task
}

let processUpdates (update : Update) = task {
    // Since Tdlib was made to be used in GUI application we need to struggle a bit and catch required events to determine our state.
    // Below you can find example of simple authentication handling.
    // Please note that AuthorizationStateWaitOtherDeviceConfirmation is not implemented.
    let filesLocation = Path.Combine(AppContext.BaseDirectory, "db")

    match update with
    | :? Update.UpdateAuthorizationState as update ->
        match update.AuthorizationState with
        | :? AuthorizationState.AuthorizationStateWaitTdlibParameters ->
            do! client.ExecuteAsync(SetTdlibParameters(
                ApiId = apiId,
                ApiHash = apiHash,
                ApplicationVersion = applicationVersion,
                DeviceModel = "PC",
                SystemLanguageCode = "en",
                DatabaseDirectory = filesLocation,
                FilesDirectory = filesLocation)) :> Task
        | :? AuthorizationState.AuthorizationStateWaitPhoneNumber
        | :? AuthorizationState.AuthorizationStateWaitCode ->
            authNeeded <- true
            readyToAuthenticate.Set()
        | :? AuthorizationState.AuthorizationStateWaitPassword ->
            authNeeded <- true
            passwordNeeded <- true
            readyToAuthenticate.Set()
        | _ -> ()
    | :? Update.UpdateUser -> readyToAuthenticate.Set()
    | :? Update.UpdateConnectionState as update ->
        match update.State with
        | :? ConnectionState.ConnectionStateReady -> ()
            // You may trigger additional event on connection state change
        | _ -> ()
    | _ -> ()
}

let getCurrentUser() = client.ExecuteAsync(GetMe())

let getChannels limit = task {
    let result = ResizeArray<Chat>()
    let! chats = client.ExecuteAsync(GetChats(Limit = limit))
    for chatId in chats.ChatIds do
        let! chat = client.ExecuteAsync(GetChat(ChatId = chatId))
        match chat.Type with
        | :? ChatType.ChatTypeSupergroup
        | :? ChatType.ChatTypeBasicGroup
        | :? ChatType.ChatTypePrivate ->
            result.Add chat
        | _ -> ()

    return result
}

let main() = task {
    // Creating Telegram client and setting minimal verbosity to Fatal since we don't need a lot of logs :)
    client <- new TdClient()
    client.Bindings.SetLogVerbosityLevel(TdLogLevel.Fatal)

    // Subscribing to all events
    client.UpdateReceived.Add(fun update ->
        task {
            try
                do! processUpdates(update)
            with e -> printfn $"{e}"
        } |> ignore)

    // Waiting until we get enough events to be in 'authentication ready' state
    readyToAuthenticate.Wait()

    // We may not need to authenticate since TdLib persists session in 'td.binlog' file.
    // See 'TdlibParameters' class for more information, or:
    // https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1tdlib_parameters.html
    if authNeeded then
        // Interactively handling authentication
        do! handleAuthentication()

    // Querying info about current user and some channels
    let! currentUser = getCurrentUser()

    let fullUserName = $"{currentUser.FirstName} {currentUser.LastName}".Trim()
    let userName =
        Option.ofObj currentUser.Usernames
        |> Option.map (fun u -> u.ActiveUsernames[0])
        |> Option.defaultValue ""
    printfn $"Successfully logged in as [{currentUser.Id}] / [@{userName}] / [{fullUserName}]"

    let channelLimit = 5
    printfn $"Top {channelLimit} channels:"
    let! channels = getChannels(channelLimit)
    for channel in channels do
        printfn $"[{channel.Id}] -> [{channel.Title}] ({channel.UnreadCount} messages unread)"

    Console.ReadLine() |> ignore
}

main().GetAwaiter().GetResult()
