//@description Returns the current authorization state; this is an offline request. For informational purposes only. Use updateAuthorizationState instead to maintain the current authorization state. Can be called before initialization
getAuthorizationState = AuthorizationState;


//@description Sets the parameters for TDLib initialization. Works only when the current authorization state is authorizationStateWaitTdlibParameters @parameters Parameters
setTdlibParameters parameters:tdlibParameters = Ok;

//@description Checks the database encryption key for correctness. Works only when the current authorization state is authorizationStateWaitEncryptionKey @encryption_key Encryption key to check or set up
checkDatabaseEncryptionKey encryption_key:bytes = Ok;

//@description Sets the phone number of the user and sends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitPhoneNumber,
//-or if there is no pending authentication query and the current authorization state is authorizationStateWaitCode, authorizationStateWaitRegistration, or authorizationStateWaitPassword
//@phone_number The phone number of the user, in international format @settings Settings for the authentication of the user's phone number
setAuthenticationPhoneNumber phone_number:string settings:phoneNumberAuthenticationSettings = Ok;

//@description Re-sends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitCode and the next_code_type of the result is not null
resendAuthenticationCode = Ok;

//@description Checks the authentication code. Works only when the current authorization state is authorizationStateWaitCode @code The verification code received via SMS, Telegram message, phone call, or flash call
checkAuthenticationCode code:string = Ok;

//@description Requests QR code authentication by scanning a QR code on another logged in device. Works only when the current authorization state is authorizationStateWaitPhoneNumber,
//-or if there is no pending authentication query and the current authorization state is authorizationStateWaitCode, authorizationStateWaitRegistration, or authorizationStateWaitPassword
//@other_user_ids List of user identifiers of other users currently using the application
requestQrCodeAuthentication other_user_ids:vector<int32> = Ok;

//@description Finishes user registration. Works only when the current authorization state is authorizationStateWaitRegistration
//@first_name The first name of the user; 1-64 characters @last_name The last name of the user; 0-64 characters
registerUser first_name:string last_name:string = Ok;

//@description Checks the authentication password for correctness. Works only when the current authorization state is authorizationStateWaitPassword @password The password to check
checkAuthenticationPassword password:string = Ok;

//@description Requests to send a password recovery code to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword
requestAuthenticationPasswordRecovery = Ok;

//@description Recovers the password with a password recovery code sent to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword @recovery_code Recovery code to check
recoverAuthenticationPassword recovery_code:string = Ok;

//@description Checks the authentication token of a bot; to log in as a bot. Works only when the current authorization state is authorizationStateWaitPhoneNumber. Can be used instead of setAuthenticationPhoneNumber and checkAuthenticationCode to log in @token The bot token
checkAuthenticationBotToken token:string = Ok;

//@description Closes the TDLib instance after a proper logout. Requires an available network connection. All local data will be destroyed. After the logout completes, updateAuthorizationState with authorizationStateClosed will be sent
logOut = Ok;

//@description Closes the TDLib instance. All databases will be flushed to disk and properly closed. After the close completes, updateAuthorizationState with authorizationStateClosed will be sent. Can be called before initialization
close = Ok;

//@description Closes the TDLib instance, destroying all local data without a proper logout. The current user session will remain in the list of all active sessions. All local data will be destroyed. After the destruction completes updateAuthorizationState with authorizationStateClosed will be sent. Can be called before authorization
destroy = Ok;


//@description Confirms QR code authentication on another device. Returns created session on success @link A link from a QR code. The link must be scanned by the in-app camera
confirmQrCodeAuthentication link:string = Session;


//@description Returns all updates needed to restore current TDLib state, i.e. all actual UpdateAuthorizationState/UpdateUser/UpdateNewChat and others. This is especially useful if TDLib is run in a separate process. Can be called before initialization
getCurrentState = Updates;


//@description Changes the database encryption key. Usually the encryption key is never changed and is stored in some OS keychain @new_encryption_key New encryption key
setDatabaseEncryptionKey new_encryption_key:bytes = Ok;


//@description Returns the current state of 2-step verification
getPasswordState = PasswordState;

//@description Changes the password for the user. If a new recovery email address is specified, then the change will not be applied until the new recovery email address is confirmed
//@old_password Previous password of the user @new_password New password of the user; may be empty to remove the password @new_hint New password hint; may be empty @set_recovery_email_address Pass true if the recovery email address should be changed @new_recovery_email_address New recovery email address; may be empty
setPassword old_password:string new_password:string new_hint:string set_recovery_email_address:Bool new_recovery_email_address:string = PasswordState;

//@description Returns a 2-step verification recovery email address that was previously set up. This method can be used to verify a password provided by the user @password The password for the current user
getRecoveryEmailAddress password:string = RecoveryEmailAddress;

//@description Changes the 2-step verification recovery email address of the user. If a new recovery email address is specified, then the change will not be applied until the new recovery email address is confirmed.
//-If new_recovery_email_address is the same as the email address that is currently set up, this call succeeds immediately and aborts all other requests waiting for an email confirmation @password Password of the current user @new_recovery_email_address New recovery email address
setRecoveryEmailAddress password:string new_recovery_email_address:string = PasswordState;

//@description Checks the 2-step verification recovery email address verification code @code Verification code
checkRecoveryEmailAddressCode code:string = PasswordState;

//@description Resends the 2-step verification recovery email address verification code
resendRecoveryEmailAddressCode = PasswordState;

//@description Requests to send a password recovery code to an email address that was previously set up
requestPasswordRecovery = EmailAddressAuthenticationCodeInfo;

//@description Recovers the password using a recovery code sent to an email address that was previously set up @recovery_code Recovery code to check
recoverPassword recovery_code:string = PasswordState;

//@description Creates a new temporary password for processing payments @password Persistent user password @valid_for Time during which the temporary password will be valid, in seconds; should be between 60 and 86400
createTemporaryPassword password:string valid_for:int32 = TemporaryPasswordState;

//@description Returns information about the current temporary password
getTemporaryPasswordState = TemporaryPasswordState;


//@description Returns the current user
getMe = User;

//@description Returns information about a user by their identifier. This is an offline request if the current user is not a bot @user_id User identifier
getUser user_id:int32 = User;

//@description Returns full information about a user by their identifier @user_id User identifier
getUserFullInfo user_id:int32 = UserFullInfo;

//@description Returns information about a basic group by its identifier. This is an offline request if the current user is not a bot @basic_group_id Basic group identifier
getBasicGroup basic_group_id:int32 = BasicGroup;

//@description Returns full information about a basic group by its identifier @basic_group_id Basic group identifier
getBasicGroupFullInfo basic_group_id:int32 = BasicGroupFullInfo;

//@description Returns information about a supergroup or a channel by its identifier. This is an offline request if the current user is not a bot @supergroup_id Supergroup or channel identifier
getSupergroup supergroup_id:int32 = Supergroup;

//@description Returns full information about a supergroup or a channel by its identifier, cached for up to 1 minute @supergroup_id Supergroup or channel identifier
getSupergroupFullInfo supergroup_id:int32 = SupergroupFullInfo;

//@description Returns information about a secret chat by its identifier. This is an offline request @secret_chat_id Secret chat identifier
getSecretChat secret_chat_id:int32 = SecretChat;

//@description Returns information about a chat by its identifier, this is an offline request if the current user is not a bot @chat_id Chat identifier
getChat chat_id:int53 = Chat;

//@description Returns information about a message @chat_id Identifier of the chat the message belongs to @message_id Identifier of the message to get
getMessage chat_id:int53 message_id:int53 = Message;

//@description Returns information about a message, if it is available locally without sending network request. This is an offline request @chat_id Identifier of the chat the message belongs to @message_id Identifier of the message to get
getMessageLocally chat_id:int53 message_id:int53 = Message;

//@description Returns information about a message that is replied by a given message. Also returns the pinned message, the game message, and the invoice message for messages of the types messagePinMessage, messageGameScore, and messagePaymentSuccessful respectively
//@chat_id Identifier of the chat the message belongs to @message_id Identifier of the message reply to which to get
getRepliedMessage chat_id:int53 message_id:int53 = Message;

//@description Returns information about a newest pinned message in the chat @chat_id Identifier of the chat the message belongs to
getChatPinnedMessage chat_id:int53 = Message;

//@description Returns information about a message with the callback button that originated a callback query; for bots only @chat_id Identifier of the chat the message belongs to @message_id Message identifier @callback_query_id Identifier of the callback query
getCallbackQueryMessage chat_id:int53 message_id:int53 callback_query_id:int64 = Message;

//@description Returns information about messages. If a message is not found, returns null on the corresponding position of the result @chat_id Identifier of the chat the messages belong to @message_ids Identifiers of the messages to get
getMessages chat_id:int53 message_ids:vector<int53> = Messages;

//@description Returns information about a message thread. Can be used only if message.can_get_message_thread == true @chat_id Chat identifier @message_id Identifier of the message
getMessageThread chat_id:int53 message_id:int53 = MessageThreadInfo;

//@description Returns information about a file; this is an offline request @file_id Identifier of the file to get
getFile file_id:int32 = File;

//@description Returns information about a file by its remote ID; this is an offline request. Can be used to register a URL as a file for further uploading, or sending as a message. Even the request succeeds, the file can be used only if it is still accessible to the user.
//-For example, if the file is from a message, then the message must be not deleted and accessible to the user. If the file database is disabled, then the corresponding object with the file must be preloaded by the application
//@remote_file_id Remote identifier of the file to get @file_type File type, if known
getRemoteFile remote_file_id:string file_type:FileType = File;

//@description Returns an ordered list of chats in a chat list. Chats are sorted by the pair (chat.position.order, chat.id) in descending order. (For example, to get a list of chats from the beginning, the offset_order should be equal to a biggest signed 64-bit number 9223372036854775807 == 2^63 - 1).
//-For optimal performance the number of returned chats is chosen by the library
//@chat_list The chat list in which to return chats
//@offset_order Chat order to return chats from @offset_chat_id Chat identifier to return chats from
//@limit The maximum number of chats to be returned. It is possible that fewer chats than the limit are returned even if the end of the list is not reached
getChats chat_list:ChatList offset_order:int64 offset_chat_id:int53 limit:int32 = Chats;

//@description Searches a public chat by its username. Currently only private chats, supergroups and channels can be public. Returns the chat if found; otherwise an error is returned @username Username to be resolved
searchPublicChat username:string = Chat;

//@description Searches public chats by looking for specified query in their username and title. Currently only private chats, supergroups and channels can be public. Returns a meaningful number of results. Returns nothing if the length of the searched username prefix is less than 5. Excludes private chats with contacts and chats from the chat list from the results @query Query to search for
searchPublicChats query:string = Chats;

//@description Searches for the specified query in the title and username of already known chats, this is an offline request. Returns chats in the order seen in the main chat list @query Query to search for. If the query is empty, returns up to 20 recently found chats @limit The maximum number of chats to be returned
searchChats query:string limit:int32 = Chats;

//@description Searches for the specified query in the title and username of already known chats via request to the server. Returns chats in the order seen in the main chat list @query Query to search for @limit The maximum number of chats to be returned
searchChatsOnServer query:string limit:int32 = Chats;

//@description Returns a list of users and location-based supergroups nearby. The list of users nearby will be updated for 60 seconds after the request by the updates updateUsersNearby. The request should be sent again every 25 seconds with adjusted location to not miss new chats @location Current user location
searchChatsNearby location:location = ChatsNearby;

//@description Returns a list of frequently used chats. Supported only if the chat info database is enabled @category Category of chats to be returned @limit The maximum number of chats to be returned; up to 30
getTopChats category:TopChatCategory limit:int32 = Chats;

//@description Removes a chat from the list of frequently used chats. Supported only if the chat info database is enabled @category Category of frequently used chats @chat_id Chat identifier
removeTopChat category:TopChatCategory chat_id:int53 = Ok;

//@description Adds a chat to the list of recently found chats. The chat is added to the beginning of the list. If the chat is already in the list, it will be removed from the list first @chat_id Identifier of the chat to add
addRecentlyFoundChat chat_id:int53 = Ok;

//@description Removes a chat from the list of recently found chats @chat_id Identifier of the chat to be removed
removeRecentlyFoundChat chat_id:int53 = Ok;

//@description Clears the list of recently found chats
clearRecentlyFoundChats = Ok;

//@description Checks whether a username can be set for a chat @chat_id Chat identifier; should be identifier of a supergroup chat, or a channel chat, or a private chat with self, or zero if chat is being created @username Username to be checked
checkChatUsername chat_id:int53 username:string = CheckChatUsernameResult;

//@description Returns a list of public chats of the specified type, owned by the user @type Type of the public chats to return
getCreatedPublicChats type:PublicChatType = Chats;

//@description Checks whether the maximum number of owned public chats has been reached. Returns corresponding error if the limit was reached @type Type of the public chats, for which to check the limit
checkCreatedPublicChatsLimit type:PublicChatType = Ok;

//@description Returns a list of basic group and supergroup chats, which can be used as a discussion group for a channel. Returned basic group chats must be first upgraded to supergroups before they can be set as a discussion group. To set a returned supergroup as a discussion group, access to its old messages must be enabled using toggleSupergroupIsAllHistoryAvailable first
getSuitableDiscussionChats = Chats;

//@description Returns a list of recently inactive supergroups and channels. Can be used when user reaches limit on the number of joined supergroups and channels and receives CHANNELS_TOO_MUCH error
getInactiveSupergroupChats = Chats;


//@description Returns a list of common group chats with a given user. Chats are sorted by their type and creation date @user_id User identifier @offset_chat_id Chat identifier starting from which to return chats; use 0 for the first request @limit The maximum number of chats to be returned; up to 100
getGroupsInCommon user_id:int32 offset_chat_id:int53 limit:int32 = Chats;


//@description Returns messages in a chat. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id).
//-For optimal performance the number of returned messages is chosen by the library. This is an offline request if only_local is true
//@chat_id Chat identifier
//@from_message_id Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
//@offset Specify 0 to get results from exactly the from_message_id or a negative offset up to 99 to get additionally some newer messages
//@limit The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than or equal to -offset. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
//@only_local If true, returns only messages that are available locally without sending network requests
getChatHistory chat_id:int53 from_message_id:int53 offset:int32 limit:int32 only_local:Bool = Messages;

//@description Returns messages in a message thread of a message. Can be used only if message.can_get_message_thread == true. Message thread of a channel message is in the channel's linked supergroup.
//-The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id). For optimal performance the number of returned messages is chosen by the library
//@chat_id Chat identifier
//@message_id Message identifier, which thread history needs to be returned
//@from_message_id Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
//@offset Specify 0 to get results from exactly the from_message_id or a negative offset up to 99 to get additionally some newer messages
//@limit The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than or equal to -offset. Fewer messages may be returned than specified by the limit, even if the end of the message thread history has not been reached
getMessageThreadHistory chat_id:int53 message_id:int53 from_message_id:int53 offset:int32 limit:int32 = Messages;

//@description Deletes all messages in the chat. Use Chat.can_be_deleted_only_for_self and Chat.can_be_deleted_for_all_users fields to find whether and how the method can be applied to the chat
//@chat_id Chat identifier @remove_from_chat_list Pass true if the chat should be removed from the chat list @revoke Pass true to try to delete chat history for all users
deleteChatHistory chat_id:int53 remove_from_chat_list:Bool revoke:Bool = Ok;

//@description Searches for messages with given words in the chat. Returns the results in reverse chronological order, i.e. in order of decreasing message_id. Cannot be used in secret chats with a non-empty query
//-(searchSecretMessages should be used instead), or without an enabled message database. For optimal performance the number of returned messages is chosen by the library
//@chat_id Identifier of the chat in which to search messages
//@query Query to search for
//@sender If not null, only messages sent by the specified sender will be returned. Not supported in secret chats
//@from_message_id Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
//@offset Specify 0 to get results from exactly the from_message_id or a negative offset to get the specified message and some newer messages
//@limit The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than -offset. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
//@filter Filter for message content in the search results
//@message_thread_id If not 0, only messages in the specified thread will be returned; supergroups only
searchChatMessages chat_id:int53 query:string sender:MessageSender from_message_id:int53 offset:int32 limit:int32 filter:SearchMessagesFilter message_thread_id:int53 = Messages;

//@description Searches for messages in all chats except secret chats. Returns the results in reverse chronological order (i.e., in order of decreasing (date, chat_id, message_id)).
//-For optimal performance the number of returned messages is chosen by the library
//@chat_list Chat list in which to search messages; pass null to search in all chats regardless of their chat list
//@query Query to search for
//@offset_date The date of the message starting from which the results should be fetched. Use 0 or any date in the future to get results from the last message
//@offset_chat_id The chat identifier of the last found message, or 0 for the first request
//@offset_message_id The message identifier of the last found message, or 0 for the first request
//@limit The maximum number of messages to be returned; up to 100. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
//@filter Filter for message content in the search results; searchMessagesFilterCall, searchMessagesFilterMissedCall, searchMessagesFilterMention, searchMessagesFilterUnreadMention, searchMessagesFilterFailedToSend and searchMessagesFilterPinned are unsupported in this function
//@min_date If not 0, the minimum date of the messages to return
//@max_date If not 0, the maximum date of the messages to return
searchMessages chat_list:ChatList query:string offset_date:int32 offset_chat_id:int53 offset_message_id:int53 limit:int32 filter:SearchMessagesFilter min_date:int32 max_date:int32 = Messages;

//@description Searches for messages in secret chats. Returns the results in reverse chronological order. For optimal performance the number of returned messages is chosen by the library
//@chat_id Identifier of the chat in which to search. Specify 0 to search in all secret chats
//@query Query to search for. If empty, searchChatMessages should be used instead
//@offset Offset of the first entry to return as received from the previous request; use empty string to get first chunk of results
//@limit The maximum number of messages to be returned; up to 100. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
//@filter A filter for message content in the search results
searchSecretMessages chat_id:int53 query:string offset:string limit:int32 filter:SearchMessagesFilter = FoundMessages;

//@description Searches for call messages. Returns the results in reverse chronological order (i. e., in order of decreasing message_id). For optimal performance the number of returned messages is chosen by the library
//@from_message_id Identifier of the message from which to search; use 0 to get results from the last message
//@limit The maximum number of messages to be returned; up to 100. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached @only_missed If true, returns only messages with missed calls
searchCallMessages from_message_id:int53 limit:int32 only_missed:Bool = Messages;

//@description Returns information about the recent locations of chat members that were sent to the chat. Returns up to 1 location message per user @chat_id Chat identifier @limit The maximum number of messages to be returned
searchChatRecentLocationMessages chat_id:int53 limit:int32 = Messages;

//@description Returns all active live locations that should be updated by the application. The list is persistent across application restarts only if the message database is used
getActiveLiveLocationMessages = Messages;

//@description Returns the last message sent in a chat no later than the specified date @chat_id Chat identifier @date Point in time (Unix timestamp) relative to which to search for messages
getChatMessageByDate chat_id:int53 date:int32 = Message;

//@description Returns approximate number of messages of the specified type in the chat @chat_id Identifier of the chat in which to count messages @filter Filter for message content; searchMessagesFilterEmpty is unsupported in this function @return_local If true, returns count that is available locally without sending network requests, returning -1 if the number of messages is unknown
getChatMessageCount chat_id:int53 filter:SearchMessagesFilter return_local:Bool = Count;

//@description Returns all scheduled messages in a chat. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id) @chat_id Chat identifier
getChatScheduledMessages chat_id:int53 = Messages;

//@description Returns forwarded copies of a channel message to different public channels. For optimal performance the number of returned messages is chosen by the library
//@chat_id Chat identifier of the message
//@message_id Message identifier
//@offset Offset of the first entry to return as received from the previous request; use empty string to get first chunk of results
//@limit The maximum number of messages to be returned; must be positive and can't be greater than 100. Fewer messages may be returned than specified by the limit, even if the end of the list has not been reached
getMessagePublicForwards chat_id:int53 message_id:int53 offset:string limit:int32 = FoundMessages;


//@description Removes an active notification from notification list. Needs to be called only if the notification is removed by the current user @notification_group_id Identifier of notification group to which the notification belongs @notification_id Identifier of removed notification
removeNotification notification_group_id:int32 notification_id:int32 = Ok;

//@description Removes a group of active notifications. Needs to be called only if the notification group is removed by the current user @notification_group_id Notification group identifier @max_notification_id The maximum identifier of removed notifications
removeNotificationGroup notification_group_id:int32 max_notification_id:int32 = Ok;


//@description Returns an HTTPS link to a message in a chat. Available only for already sent messages in supergroups and channels. This is an offline request
//@chat_id Identifier of the chat to which the message belongs
//@message_id Identifier of the message
//@for_album Pass true to create a link for the whole media album
//@for_comment Pass true to create a link to the message as a channel post comment, or from a message thread
getMessageLink chat_id:int53 message_id:int53 for_album:Bool for_comment:Bool = MessageLink;

//@description Returns an HTML code for embedding the message. Available only for messages in supergroups and channels with a username
//@chat_id Identifier of the chat to which the message belongs
//@message_id Identifier of the message
//@for_album Pass true to return an HTML code for embedding of the whole media album
getMessageEmbeddingCode chat_id:int53 message_id:int53 for_album:Bool = Text;

//@description Returns information about a public or private message link @url The message link in the format "https://t.me/c/...", or "tg://privatepost?...", or "https://t.me/username/...", or "tg://resolve?..."
getMessageLinkInfo url:string = MessageLinkInfo;


//@description Sends a message. Returns the sent message
//@chat_id Target chat
//@message_thread_id If not 0, a message thread identifier in which the message will be sent
//@reply_to_message_id Identifier of the message to reply to or 0
//@options Options to be used to send the message
//@reply_markup Markup for replying to the message; for bots only @input_message_content The content of the message to be sent
sendMessage chat_id:int53 message_thread_id:int53 reply_to_message_id:int53 options:messageSendOptions reply_markup:ReplyMarkup input_message_content:InputMessageContent = Message;

//@description Sends 2-10 messages grouped together into an album. Currently only audio, document, photo and video messages can be grouped into an album. Documents and audio files can be only grouped in an album with messages of the same type. Returns sent messages
//@chat_id Target chat
//@message_thread_id If not 0, a message thread identifier in which the messages will be sent
//@reply_to_message_id Identifier of a message to reply to or 0
//@options Options to be used to send the messages
//@input_message_contents Contents of messages to be sent. At most 10 messages can be added to an album
sendMessageAlbum chat_id:int53 message_thread_id:int53 reply_to_message_id:int53 options:messageSendOptions input_message_contents:vector<InputMessageContent> = Messages;

//@description Invites a bot to a chat (if it is not yet a member) and sends it the /start command. Bots can't be invited to a private chat other than the chat with the bot. Bots can't be invited to channels (although they can be added as admins) and secret chats. Returns the sent message
//@bot_user_id Identifier of the bot @chat_id Identifier of the target chat @parameter A hidden parameter sent to the bot for deep linking purposes (https://core.telegram.org/bots#deep-linking)
sendBotStartMessage bot_user_id:int32 chat_id:int53 parameter:string = Message;

//@description Sends the result of an inline query as a message. Returns the sent message. Always clears a chat draft message
//@chat_id Target chat
//@message_thread_id If not 0, a message thread identifier in which the message will be sent
//@reply_to_message_id Identifier of a message to reply to or 0
//@options Options to be used to send the message
//@query_id Identifier of the inline query @result_id Identifier of the inline result
//@hide_via_bot If true, there will be no mention of a bot, via which the message is sent. Can be used only for bots GetOption("animation_search_bot_username"), GetOption("photo_search_bot_username") and GetOption("venue_search_bot_username")
sendInlineQueryResultMessage chat_id:int53 message_thread_id:int53 reply_to_message_id:int53 options:messageSendOptions query_id:int64 result_id:string hide_via_bot:Bool = Message;

//@description Forwards previously sent messages. Returns the forwarded messages in the same order as the message identifiers passed in message_ids. If a message can't be forwarded, null will be returned instead of the message
//@chat_id Identifier of the chat to which to forward messages
//@from_chat_id Identifier of the chat from which to forward messages
//@message_ids Identifiers of the messages to forward. Message identifiers must be in a strictly increasing order. At most 100 messages can be forwarded simultaneously
//@options Options to be used to send the messages
//@send_copy True, if content of the messages needs to be copied without links to the original messages. Always true if the messages are forwarded to a secret chat
//@remove_caption True, if media caption of message copies needs to be removed. Ignored if send_copy is false
forwardMessages chat_id:int53 from_chat_id:int53 message_ids:vector<int53> options:messageSendOptions send_copy:Bool remove_caption:Bool = Messages;

//@description Resends messages which failed to send. Can be called only for messages for which messageSendingStateFailed.can_retry is true and after specified in messageSendingStateFailed.retry_after time passed.
//-If a message is re-sent, the corresponding failed to send message is deleted. Returns the sent messages in the same order as the message identifiers passed in message_ids. If a message can't be re-sent, null will be returned instead of the message
//@chat_id Identifier of the chat to send messages @message_ids Identifiers of the messages to resend. Message identifiers must be in a strictly increasing order
resendMessages chat_id:int53 message_ids:vector<int53> = Messages;

//@description Changes the current TTL setting (sets a new self-destruct timer) in a secret chat and sends the corresponding message @chat_id Chat identifier @ttl New TTL value, in seconds
sendChatSetTtlMessage chat_id:int53 ttl:int32 = Message;

//@description Sends a notification about a screenshot taken in a chat. Supported only in private and secret chats @chat_id Chat identifier
sendChatScreenshotTakenNotification chat_id:int53 = Ok;

//@description Adds a local message to a chat. The message is persistent across application restarts only if the message database is used. Returns the added message
//@chat_id Target chat
//@sender The sender sender of the message
//@reply_to_message_id Identifier of the message to reply to or 0
//@disable_notification Pass true to disable notification for the message
//@input_message_content The content of the message to be added
addLocalMessage chat_id:int53 sender:MessageSender reply_to_message_id:int53 disable_notification:Bool input_message_content:InputMessageContent = Message;

//@description Deletes messages @chat_id Chat identifier @message_ids Identifiers of the messages to be deleted @revoke Pass true to try to delete messages for all chat members. Always true for supergroups, channels and secret chats
deleteMessages chat_id:int53 message_ids:vector<int53> revoke:Bool = Ok;

//@description Deletes all messages sent by the specified user to a chat. Supported only for supergroups; requires can_delete_messages administrator privileges @chat_id Chat identifier @user_id User identifier
deleteChatMessagesFromUser chat_id:int53 user_id:int32 = Ok;


//@description Edits the text of a message (or a text of a game message). Returns the edited message after the edit is completed on the server side
//@chat_id The chat the message belongs to @message_id Identifier of the message @reply_markup The new message reply markup; for bots only @input_message_content New text content of the message. Should be of type InputMessageText
editMessageText chat_id:int53 message_id:int53 reply_markup:ReplyMarkup input_message_content:InputMessageContent = Message;

//@description Edits the message content of a live location. Messages can be edited for a limited period of time specified in the live location. Returns the edited message after the edit is completed on the server side
//@chat_id The chat the message belongs to @message_id Identifier of the message @reply_markup The new message reply markup; for bots only @location New location content of the message; may be null. Pass null to stop sharing the live location
//@heading The new direction in which the location moves, in degrees; 1-360. Pass 0 if unknown
//@proximity_alert_radius The new maximum distance for proximity alerts, in meters (0-100000). Pass 0 if the notification is disabled
editMessageLiveLocation chat_id:int53 message_id:int53 reply_markup:ReplyMarkup location:location heading:int32 proximity_alert_radius:int32 = Message;

//@description Edits the content of a message with an animation, an audio, a document, a photo or a video. The media in the message can't be replaced if the message was set to self-destruct. Media can't be replaced by self-destructing media. Media in an album can be edited only to contain a photo or a video. Returns the edited message after the edit is completed on the server side
//@chat_id The chat the message belongs to @message_id Identifier of the message @reply_markup The new message reply markup; for bots only @input_message_content New content of the message. Must be one of the following types: InputMessageAnimation, InputMessageAudio, InputMessageDocument, InputMessagePhoto or InputMessageVideo
editMessageMedia chat_id:int53 message_id:int53 reply_markup:ReplyMarkup input_message_content:InputMessageContent = Message;

//@description Edits the message content caption. Returns the edited message after the edit is completed on the server side
//@chat_id The chat the message belongs to @message_id Identifier of the message @reply_markup The new message reply markup; for bots only @caption New message content caption; 0-GetOption("message_caption_length_max") characters
editMessageCaption chat_id:int53 message_id:int53 reply_markup:ReplyMarkup caption:formattedText = Message;

//@description Edits the message reply markup; for bots only. Returns the edited message after the edit is completed on the server side
//@chat_id The chat the message belongs to @message_id Identifier of the message @reply_markup The new message reply markup
editMessageReplyMarkup chat_id:int53 message_id:int53 reply_markup:ReplyMarkup = Message;

//@description Edits the text of an inline text or game message sent via a bot; for bots only @inline_message_id Inline message identifier @reply_markup The new message reply markup @input_message_content New text content of the message. Should be of type InputMessageText
editInlineMessageText inline_message_id:string reply_markup:ReplyMarkup input_message_content:InputMessageContent = Ok;

//@description Edits the content of a live location in an inline message sent via a bot; for bots only @inline_message_id Inline message identifier @reply_markup The new message reply markup
//@location New location content of the message; may be null. Pass null to stop sharing the live location
//@heading The new direction in which the location moves, in degrees; 1-360. Pass 0 if unknown
//@proximity_alert_radius The new maximum distance for proximity alerts, in meters (0-100000). Pass 0 if the notification is disabled
editInlineMessageLiveLocation inline_message_id:string reply_markup:ReplyMarkup location:location heading:int32 proximity_alert_radius:int32 = Ok;

//@description Edits the content of a message with an animation, an audio, a document, a photo or a video in an inline message sent via a bot; for bots only @inline_message_id Inline message identifier
//@reply_markup The new message reply markup; for bots only @input_message_content New content of the message. Must be one of the following types: InputMessageAnimation, InputMessageAudio, InputMessageDocument, InputMessagePhoto or InputMessageVideo
editInlineMessageMedia inline_message_id:string reply_markup:ReplyMarkup input_message_content:InputMessageContent = Ok;

//@description Edits the caption of an inline message sent via a bot; for bots only @inline_message_id Inline message identifier @reply_markup The new message reply markup @caption New message content caption; 0-GetOption("message_caption_length_max") characters
editInlineMessageCaption inline_message_id:string reply_markup:ReplyMarkup caption:formattedText = Ok;

//@description Edits the reply markup of an inline message sent via a bot; for bots only @inline_message_id Inline message identifier @reply_markup The new message reply markup
editInlineMessageReplyMarkup inline_message_id:string reply_markup:ReplyMarkup = Ok;

//@description Edits the time when a scheduled message will be sent. Scheduling state of all messages in the same album or forwarded together with the message will be also changed @chat_id The chat the message belongs to @message_id Identifier of the message @scheduling_state The new message scheduling state. Pass null to send the message immediately
editMessageSchedulingState chat_id:int53 message_id:int53 scheduling_state:MessageSchedulingState = Ok;


//@description Returns all entities (mentions, hashtags, cashtags, bot commands, bank card numbers, URLs, and email addresses) contained in the text. Can be called synchronously @text The text in which to look for entites
getTextEntities text:string = TextEntities;

//@description Parses Bold, Italic, Underline, Strikethrough, Code, Pre, PreCode, TextUrl and MentionName entities contained in the text. Can be called synchronously @text The text to parse @parse_mode Text parse mode
parseTextEntities text:string parse_mode:TextParseMode = FormattedText;

//@description Parses Markdown entities in a human-friendly format, ignoring markup errors. Can be called synchronously
//@text The text to parse. For example, "__italic__ ~~strikethrough~~ **bold** `code` ```pre``` __[italic__ text_url](telegram.org) __italic**bold italic__bold**"
parseMarkdown text:formattedText = FormattedText;

//@description Replaces text entities with Markdown formatting in a human-friendly format. Entities that can't be represented in Markdown unambiguously are kept as is. Can be called synchronously @text The text
getMarkdownText text:formattedText = FormattedText;

//@description Returns the MIME type of a file, guessed by its extension. Returns an empty string on failure. Can be called synchronously @file_name The name of the file or path to the file
getFileMimeType file_name:string = Text;

//@description Returns the extension of a file, guessed by its MIME type. Returns an empty string on failure. Can be called synchronously @mime_type The MIME type of the file
getFileExtension mime_type:string = Text;

//@description Removes potentially dangerous characters from the name of a file. The encoding of the file name is supposed to be UTF-8. Returns an empty string on failure. Can be called synchronously @file_name File name or path to the file
cleanFileName file_name:string = Text;

//@description Returns a string stored in the local database from the specified localization target and language pack by its key. Returns a 404 error if the string is not found. Can be called synchronously
//@language_pack_database_path Path to the language pack database in which strings are stored @localization_target Localization target to which the language pack belongs @language_pack_id Language pack identifier @key Language pack key of the string to be returned
getLanguagePackString language_pack_database_path:string localization_target:string language_pack_id:string key:string = LanguagePackStringValue;

//@description Converts a JSON-serialized string to corresponding JsonValue object. Can be called synchronously @json The JSON-serialized string
getJsonValue json:string = JsonValue;

//@description Converts a JsonValue object to corresponding JSON-serialized string. Can be called synchronously @json_value The JsonValue object
getJsonString json_value:JsonValue = Text;


//@description Changes the user answer to a poll. A poll in quiz mode can be answered only once
//@chat_id Identifier of the chat to which the poll belongs @message_id Identifier of the message containing the poll
//@option_ids 0-based identifiers of answer options, chosen by the user. User can choose more than 1 answer option only is the poll allows multiple answers
setPollAnswer chat_id:int53 message_id:int53 option_ids:vector<int32> = Ok;

//@description Returns users voted for the specified option in a non-anonymous polls. For the optimal performance the number of returned users is chosen by the library
//@chat_id Identifier of the chat to which the poll belongs @message_id Identifier of the message containing the poll
//@option_id 0-based identifier of the answer option
//@offset Number of users to skip in the result; must be non-negative
//@limit The maximum number of users to be returned; must be positive and can't be greater than 50. Fewer users may be returned than specified by the limit, even if the end of the voter list has not been reached
getPollVoters chat_id:int53 message_id:int53 option_id:int32 offset:int32 limit:int32 = Users;

//@description Stops a poll. A poll in a message can be stopped when the message has can_be_edited flag set
//@chat_id Identifier of the chat to which the poll belongs @message_id Identifier of the message containing the poll @reply_markup The new message reply markup; for bots only
stopPoll chat_id:int53 message_id:int53 reply_markup:ReplyMarkup = Ok;


//@description Hides a suggested action @action Suggested action to hide
hideSuggestedAction action:SuggestedAction = Ok;


//@description Returns information about a button of type inlineKeyboardButtonTypeLoginUrl. The method needs to be called when the user presses the button
//@chat_id Chat identifier of the message with the button @message_id Message identifier of the message with the button @button_id Button identifier
getLoginUrlInfo chat_id:int53 message_id:int53 button_id:int32 = LoginUrlInfo;

//@description Returns an HTTP URL which can be used to automatically authorize the user on a website after clicking an inline button of type inlineKeyboardButtonTypeLoginUrl.
//-Use the method getLoginUrlInfo to find whether a prior user confirmation is needed. If an error is returned, then the button must be handled as an ordinary URL button
//@chat_id Chat identifier of the message with the button @message_id Message identifier of the message with the button @button_id Button identifier
//@allow_write_access True, if the user allowed the bot to send them messages
getLoginUrl chat_id:int53 message_id:int53 button_id:int32 allow_write_access:Bool = HttpUrl;


//@description Sends an inline query to a bot and returns its results. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires @bot_user_id The identifier of the target bot
//@chat_id Identifier of the chat where the query was sent @user_location Location of the user, only if needed @query Text of the query @offset Offset of the first entry to return
getInlineQueryResults bot_user_id:int32 chat_id:int53 user_location:location query:string offset:string = InlineQueryResults;

//@description Sets the result of an inline query; for bots only @inline_query_id Identifier of the inline query @is_personal True, if the result of the query can be cached for the specified user
//@results The results of the query @cache_time Allowed time to cache the results of the query, in seconds @next_offset Offset for the next inline query; pass an empty string if there are no more results
//@switch_pm_text If non-empty, this text should be shown on the button that opens a private chat with the bot and sends a start message to the bot with the parameter switch_pm_parameter @switch_pm_parameter The parameter for the bot start message
answerInlineQuery inline_query_id:int64 is_personal:Bool results:vector<InputInlineQueryResult> cache_time:int32 next_offset:string switch_pm_text:string switch_pm_parameter:string = Ok;


//@description Sends a callback query to a bot and returns an answer. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires @chat_id Identifier of the chat with the message @message_id Identifier of the message from which the query originated @payload Query payload
getCallbackQueryAnswer chat_id:int53 message_id:int53 payload:CallbackQueryPayload = CallbackQueryAnswer;

//@description Sets the result of a callback query; for bots only @callback_query_id Identifier of the callback query @text Text of the answer @show_alert If true, an alert should be shown to the user instead of a toast notification @url URL to be opened @cache_time Time during which the result of the query can be cached, in seconds
answerCallbackQuery callback_query_id:int64 text:string show_alert:Bool url:string cache_time:int32 = Ok;


//@description Sets the result of a shipping query; for bots only @shipping_query_id Identifier of the shipping query @shipping_options Available shipping options @error_message An error message, empty on success
answerShippingQuery shipping_query_id:int64 shipping_options:vector<shippingOption> error_message:string = Ok;

//@description Sets the result of a pre-checkout query; for bots only @pre_checkout_query_id Identifier of the pre-checkout query @error_message An error message, empty on success
answerPreCheckoutQuery pre_checkout_query_id:int64 error_message:string = Ok;


//@description Updates the game score of the specified user in the game; for bots only @chat_id The chat to which the message with the game belongs @message_id Identifier of the message @edit_message True, if the message should be edited @user_id User identifier @score The new score
//@force Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
setGameScore chat_id:int53 message_id:int53 edit_message:Bool user_id:int32 score:int32 force:Bool = Message;

//@description Updates the game score of the specified user in a game; for bots only @inline_message_id Inline message identifier @edit_message True, if the message should be edited @user_id User identifier @score The new score
//@force Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
setInlineGameScore inline_message_id:string edit_message:Bool user_id:int32 score:int32 force:Bool = Ok;

//@description Returns the high scores for a game and some part of the high score table in the range of the specified user; for bots only @chat_id The chat that contains the message with the game @message_id Identifier of the message @user_id User identifier
getGameHighScores chat_id:int53 message_id:int53 user_id:int32 = GameHighScores;

//@description Returns game high scores and some part of the high score table in the range of the specified user; for bots only @inline_message_id Inline message identifier @user_id User identifier
getInlineGameHighScores inline_message_id:string user_id:int32 = GameHighScores;


//@description Deletes the default reply markup from a chat. Must be called after a one-time keyboard or a ForceReply reply markup has been used. UpdateChatReplyMarkup will be sent if the reply markup will be changed @chat_id Chat identifier
//@message_id The message identifier of the used keyboard
deleteChatReplyMarkup chat_id:int53 message_id:int53 = Ok;


//@description Sends a notification about user activity in a chat @chat_id Chat identifier @message_thread_id If not 0, a message thread identifier in which the action was performed @action The action description
sendChatAction chat_id:int53 message_thread_id:int53 action:ChatAction = Ok;


//@description Informs TDLib that the chat is opened by the user. Many useful activities depend on the chat being opened or closed (e.g., in supergroups and channels all updates are received only for opened chats) @chat_id Chat identifier
openChat chat_id:int53 = Ok;

//@description Informs TDLib that the chat is closed by the user. Many useful activities depend on the chat being opened or closed @chat_id Chat identifier
closeChat chat_id:int53 = Ok;

//@description Informs TDLib that messages are being viewed by the user. Many useful activities depend on whether the messages are currently being viewed or not (e.g., marking messages as read, incrementing a view counter, updating a view counter, removing deleted messages in supergroups and channels)
//@chat_id Chat identifier
//@message_thread_id If not 0, a message thread identifier in which the messages are being viewed
//@message_ids The identifiers of the messages being viewed
//@force_read True, if messages in closed chats should be marked as read by the request
viewMessages chat_id:int53 message_thread_id:int53 message_ids:vector<int53> force_read:Bool = Ok;

//@description Informs TDLib that the message content has been opened (e.g., the user has opened a photo, video, document, location or venue, or has listened to an audio file or voice note message). An updateMessageContentOpened update will be generated if something has changed @chat_id Chat identifier of the message @message_id Identifier of the message with the opened content
openMessageContent chat_id:int53 message_id:int53 = Ok;


//@description Marks all mentions in a chat as read @chat_id Chat identifier
readAllChatMentions chat_id:int53 = Ok;


//@description Returns an existing chat corresponding to a given user @user_id User identifier @force If true, the chat will be created without network request. In this case all information about the chat except its type, title and photo can be incorrect
createPrivateChat user_id:int32 force:Bool = Chat;

//@description Returns an existing chat corresponding to a known basic group @basic_group_id Basic group identifier @force If true, the chat will be created without network request. In this case all information about the chat except its type, title and photo can be incorrect
createBasicGroupChat basic_group_id:int32 force:Bool = Chat;

//@description Returns an existing chat corresponding to a known supergroup or channel @supergroup_id Supergroup or channel identifier @force If true, the chat will be created without network request. In this case all information about the chat except its type, title and photo can be incorrect
createSupergroupChat supergroup_id:int32 force:Bool = Chat;

//@description Returns an existing chat corresponding to a known secret chat @secret_chat_id Secret chat identifier
createSecretChat secret_chat_id:int32 = Chat;

//@description Creates a new basic group and sends a corresponding messageBasicGroupChatCreate. Returns the newly created chat @user_ids Identifiers of users to be added to the basic group @title Title of the new basic group; 1-128 characters
createNewBasicGroupChat user_ids:vector<int32> title:string = Chat;

//@description Creates a new supergroup or channel and sends a corresponding messageSupergroupChatCreate. Returns the newly created chat @title Title of the new chat; 1-128 characters @is_channel True, if a channel chat should be created @param_description Chat description; 0-255 characters @location Chat location if a location-based supergroup is being created
createNewSupergroupChat title:string is_channel:Bool description:string location:chatLocation = Chat;

//@description Creates a new secret chat. Returns the newly created chat @user_id Identifier of the target user
createNewSecretChat user_id:int32 = Chat;

//@description Creates a new supergroup from an existing basic group and sends a corresponding messageChatUpgradeTo and messageChatUpgradeFrom; requires creator privileges. Deactivates the original basic group @chat_id Identifier of the chat to upgrade
upgradeBasicGroupChatToSupergroupChat chat_id:int53 = Chat;


//@description Returns chat lists to which the chat can be added. This is an offline request @chat_id Chat identifier
getChatListsToAddChat chat_id:int53 = ChatLists;

//@description Adds a chat to a chat list. A chat can't be simultaneously in Main and Archive chat lists, so it is automatically removed from another one if needed
//@chat_id Chat identifier @chat_list The chat list. Use getChatListsToAddChat to get suitable chat lists
addChatToList chat_id:int53 chat_list:ChatList = Ok;

//@description Returns information about a chat filter by its identifier @chat_filter_id Chat filter identifier
getChatFilter chat_filter_id:int32 = ChatFilter;

//@description Creates new chat filter. Returns information about the created chat filter @filter Chat filter
createChatFilter filter:chatFilter = ChatFilterInfo;

//@description Edits existing chat filter. Returns information about the edited chat filter @chat_filter_id Chat filter identifier @filter The edited chat filter
editChatFilter chat_filter_id:int32 filter:chatFilter = ChatFilterInfo;

//@description Deletes existing chat filter @chat_filter_id Chat filter identifier
deleteChatFilter chat_filter_id:int32 = Ok;

//@description Changes the order of chat filters @chat_filter_ids Identifiers of chat filters in the new correct order
reorderChatFilters chat_filter_ids:vector<int32> = Ok;

//@description Returns recommended chat filters for the current user
getRecommendedChatFilters = RecommendedChatFilters;

//@description Returns default icon name for a filter. Can be called synchronously @filter Chat filter
getChatFilterDefaultIconName filter:chatFilter = Text;


//@description Changes the chat title. Supported only for basic groups, supergroups and channels. Requires can_change_info rights
//@chat_id Chat identifier @title New title of the chat; 1-128 characters
setChatTitle chat_id:int53 title:string = Ok;

//@description Changes the photo of a chat. Supported only for basic groups, supergroups and channels. Requires can_change_info rights
//@chat_id Chat identifier @photo New chat photo. Pass null to delete the chat photo
setChatPhoto chat_id:int53 photo:InputChatPhoto = Ok;

//@description Changes the chat members permissions. Supported only for basic groups and supergroups. Requires can_restrict_members administrator right
//@chat_id Chat identifier @permissions New non-administrator members permissions in the chat
setChatPermissions chat_id:int53 permissions:chatPermissions = Ok;

//@description Changes the draft message in a chat @chat_id Chat identifier @message_thread_id If not 0, a message thread identifier in which the draft was changed @draft_message New draft message; may be null
setChatDraftMessage chat_id:int53 message_thread_id:int53 draft_message:draftMessage = Ok;

//@description Changes the notification settings of a chat. Notification settings of a chat with the current user (Saved Messages) can't be changed
//@chat_id Chat identifier @notification_settings New notification settings for the chat. If the chat is muted for more than 1 week, it is considered to be muted forever
setChatNotificationSettings chat_id:int53 notification_settings:chatNotificationSettings = Ok;

//@description Changes the marked as unread state of a chat @chat_id Chat identifier @is_marked_as_unread New value of is_marked_as_unread
toggleChatIsMarkedAsUnread chat_id:int53 is_marked_as_unread:Bool = Ok;

//@description Changes the value of the default disable_notification parameter, used when a message is sent to a chat @chat_id Chat identifier @default_disable_notification New value of default_disable_notification
toggleChatDefaultDisableNotification chat_id:int53 default_disable_notification:Bool = Ok;

//@description Changes application-specific data associated with a chat @chat_id Chat identifier @client_data New value of client_data
setChatClientData chat_id:int53 client_data:string = Ok;

//@description Changes information about a chat. Available for basic groups, supergroups, and channels. Requires can_change_info rights @chat_id Identifier of the chat @param_description New chat description; 0-255 characters
setChatDescription chat_id:int53 description:string = Ok;

//@description Changes the discussion group of a channel chat; requires can_change_info rights in the channel if it is specified @chat_id Identifier of the channel chat. Pass 0 to remove a link from the supergroup passed in the second argument to a linked channel chat (requires can_pin_messages rights in the supergroup) @discussion_chat_id Identifier of a new channel's discussion group. Use 0 to remove the discussion group.
//-Use the method getSuitableDiscussionChats to find all suitable groups. Basic group chats must be first upgraded to supergroup chats. If new chat members don't have access to old messages in the supergroup, then toggleSupergroupIsAllHistoryAvailable must be used first to change that
setChatDiscussionGroup chat_id:int53 discussion_chat_id:int53 = Ok;

//@description Changes the location of a chat. Available only for some location-based supergroups, use supergroupFullInfo.can_set_location to check whether the method is allowed to use @chat_id Chat identifier @location New location for the chat; must be valid and not null
setChatLocation chat_id:int53 location:chatLocation = Ok;

//@description Changes the slow mode delay of a chat. Available only for supergroups; requires can_restrict_members rights @chat_id Chat identifier @slow_mode_delay New slow mode delay for the chat; must be one of 0, 10, 30, 60, 300, 900, 3600
setChatSlowModeDelay chat_id:int53 slow_mode_delay:int32 = Ok;

//@description Pins a message in a chat; requires can_pin_messages rights or can_edit_messages rights in the channel
//@chat_id Identifier of the chat
//@message_id Identifier of the new pinned message
//@disable_notification True, if there should be no notification about the pinned message. Notifications are always disabled in channels and private chats
//@only_for_self True, if the message needs to be pinned for one side only; private chats only
pinChatMessage chat_id:int53 message_id:int53 disable_notification:Bool only_for_self:Bool = Ok;

//@description Removes a pinned message from a chat; requires can_pin_messages rights in the group or can_edit_messages rights in the channel @chat_id Identifier of the chat @message_id Identifier of the removed pinned message
unpinChatMessage chat_id:int53 message_id:int53 = Ok;

//@description Removes all pinned messages from a chat; requires can_pin_messages rights in the group or can_edit_messages rights in the channel @chat_id Identifier of the chat
unpinAllChatMessages chat_id:int53 = Ok;


//@description Adds the current user as a new member to a chat. Private and secret chats can't be joined using this method @chat_id Chat identifier
joinChat chat_id:int53 = Ok;

//@description Removes the current user from chat members. Private and secret chats can't be left using this method @chat_id Chat identifier
leaveChat chat_id:int53 = Ok;

//@description Adds a new member to a chat. Members can't be added to private or secret chats. Members will not be added until the chat state has been synchronized with the server
//@chat_id Chat identifier @user_id Identifier of the user @forward_limit The number of earlier messages from the chat to be forwarded to the new member; up to 100. Ignored for supergroups and channels
addChatMember chat_id:int53 user_id:int32 forward_limit:int32 = Ok;

//@description Adds multiple new members to a chat. Currently this method is only available for supergroups and channels. This method can't be used to join a chat. Members can't be added to a channel if it has more than 200 members. Members will not be added until the chat state has been synchronized with the server
//@chat_id Chat identifier @user_ids Identifiers of the users to be added to the chat. The maximum number of added users is 20 for supergroups and 100 for channels
addChatMembers chat_id:int53 user_ids:vector<int32> = Ok;

//@description Changes the status of a chat member, needs appropriate privileges. This function is currently not suitable for adding new members to the chat and transferring chat ownership; instead, use addChatMember or transferChatOwnership. The chat member status will not be changed until it has been synchronized with the server
//@chat_id Chat identifier @user_id User identifier @status The new status of the member in the chat
setChatMemberStatus chat_id:int53 user_id:int32 status:ChatMemberStatus = Ok;

//@description Checks whether the current session can be used to transfer a chat ownership to another user
canTransferOwnership = CanTransferOwnershipResult;

//@description Changes the owner of a chat. The current user must be a current owner of the chat. Use the method canTransferOwnership to check whether the ownership can be transferred from the current session. Available only for supergroups and channel chats
//@chat_id Chat identifier @user_id Identifier of the user to which transfer the ownership. The ownership can't be transferred to a bot or to a deleted user @password The password of the current user
transferChatOwnership chat_id:int53 user_id:int32 password:string = Ok;

//@description Returns information about a single member of a chat @chat_id Chat identifier @user_id User identifier
getChatMember chat_id:int53 user_id:int32 = ChatMember;

//@description Searches for a specified query in the first name, last name and username of the members of a specified chat. Requires administrator rights in channels @chat_id Chat identifier @query Query to search for @limit The maximum number of users to be returned @filter The type of users to return. By default, chatMembersFilterMembers
searchChatMembers chat_id:int53 query:string limit:int32 filter:ChatMembersFilter = ChatMembers;

//@description Returns a list of administrators of the chat with their custom titles @chat_id Chat identifier
getChatAdministrators chat_id:int53 = ChatAdministrators;


//@description Clears draft messages in all chats @exclude_secret_chats If true, local draft messages in secret chats will not be cleared
clearAllDraftMessages exclude_secret_chats:Bool = Ok;


//@description Returns list of chats with non-default notification settings @scope If specified, only chats from the specified scope will be returned @compare_sound If true, also chats with non-default sound will be returned
getChatNotificationSettingsExceptions scope:NotificationSettingsScope compare_sound:Bool = Chats;

//@description Returns the notification settings for chats of a given type @scope Types of chats for which to return the notification settings information
getScopeNotificationSettings scope:NotificationSettingsScope = ScopeNotificationSettings;

//@description Changes notification settings for chats of a given type @scope Types of chats for which to change the notification settings @notification_settings The new notification settings for the given scope
setScopeNotificationSettings scope:NotificationSettingsScope notification_settings:scopeNotificationSettings = Ok;

//@description Resets all notification settings to their default values. By default, all chats are unmuted, the sound is set to "default" and message previews are shown
resetAllNotificationSettings = Ok;


//@description Changes the pinned state of a chat. There can be up to GetOption("pinned_chat_count_max")/GetOption("pinned_archived_chat_count_max") pinned non-secret chats and the same number of secret chats in the main/arhive chat list
//@chat_list Chat list in which to change the pinned state of the chat @chat_id Chat identifier @is_pinned True, if the chat is pinned
toggleChatIsPinned chat_list:ChatList chat_id:int53 is_pinned:Bool = Ok;

//@description Changes the order of pinned chats @chat_list Chat list in which to change the order of pinned chats @chat_ids The new list of pinned chats
setPinnedChats chat_list:ChatList chat_ids:vector<int53> = Ok;


//@description Downloads a file from the cloud. Download progress and completion of the download will be notified through updateFile updates
//@file_id Identifier of the file to download
//@priority Priority of the download (1-32). The higher the priority, the earlier the file will be downloaded. If the priorities of two files are equal, then the last one for which downloadFile was called will be downloaded first
//@offset The starting position from which the file should be downloaded
//@limit Number of bytes which should be downloaded starting from the "offset" position before the download will be automatically cancelled; use 0 to download without a limit
//@synchronous If false, this request returns file state just after the download has been started. If true, this request returns file state only after
//-the download has succeeded, has failed, has been cancelled or a new downloadFile request with different offset/limit parameters was sent
downloadFile file_id:int32 priority:int32 offset:int32 limit:int32 synchronous:Bool = File;

//@description Returns file downloaded prefix size from a given offset @file_id Identifier of the file @offset Offset from which downloaded prefix size should be calculated
getFileDownloadedPrefixSize file_id:int32 offset:int32 = Count;

//@description Stops the downloading of a file. If a file has already been downloaded, does nothing @file_id Identifier of a file to stop downloading @only_if_pending Pass true to stop downloading only if it hasn't been started, i.e. request hasn't been sent to server
cancelDownloadFile file_id:int32 only_if_pending:Bool = Ok;

//@description Asynchronously uploads a file to the cloud without sending it in a message. updateFile will be used to notify about upload progress and successful completion of the upload. The file will not have a persistent remote identifier until it will be sent in a message @file File to upload @file_type File type
//@priority Priority of the upload (1-32). The higher the priority, the earlier the file will be uploaded. If the priorities of two files are equal, then the first one for which uploadFile was called will be uploaded first
uploadFile file:InputFile file_type:FileType priority:int32 = File;

//@description Stops the uploading of a file. Supported only for files uploaded by using uploadFile. For other files the behavior is undefined @file_id Identifier of the file to stop uploading
cancelUploadFile file_id:int32 = Ok;

//@description Writes a part of a generated file. This method is intended to be used only if the application has no direct access to TDLib's file system, because it is usually slower than a direct write to the destination file
//@generation_id The identifier of the generation process @offset The offset from which to write the data to the file @data The data to write
writeGeneratedFilePart generation_id:int64 offset:int32 data:bytes = Ok;

//@description Informs TDLib on a file generation progress
//@generation_id The identifier of the generation process
//@expected_size Expected size of the generated file, in bytes; 0 if unknown
//@local_prefix_size The number of bytes already generated
setFileGenerationProgress generation_id:int64 expected_size:int32 local_prefix_size:int32 = Ok;

//@description Finishes the file generation
//@generation_id The identifier of the generation process
//@error If set, means that file generation has failed and should be terminated
finishFileGeneration generation_id:int64 error:error = Ok;

//@description Reads a part of a file from the TDLib file cache and returns read bytes. This method is intended to be used only if the application has no direct access to TDLib's file system, because it is usually slower than a direct read from the file
//@file_id Identifier of the file. The file must be located in the TDLib file cache
//@offset The offset from which to read the file
//@count Number of bytes to read. An error will be returned if there are not enough bytes available in the file from the specified position. Pass 0 to read all available data from the specified position
readFilePart file_id:int32 offset:int32 count:int32 = FilePart;

//@description Deletes a file from the TDLib file cache @file_id Identifier of the file to delete
deleteFile file_id:int32 = Ok;


//@description Generates a new invite link for a chat; the previously generated link is revoked. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right @chat_id Chat identifier
generateChatInviteLink chat_id:int53 = ChatInviteLink;

//@description Checks the validity of an invite link for a chat and returns information about the corresponding chat @invite_link Invite link to be checked; should begin with "https://t.me/joinchat/", "https://telegram.me/joinchat/", or "https://telegram.dog/joinchat/"
checkChatInviteLink invite_link:string = ChatInviteLinkInfo;

//@description Uses an invite link to add the current user to the chat if possible. The new member will not be added until the chat state has been synchronized with the server
//@invite_link Invite link to import; should begin with "https://t.me/joinchat/", "https://telegram.me/joinchat/", or "https://telegram.dog/joinchat/"
joinChatByInviteLink invite_link:string = Chat;


//@description Creates a new call @user_id Identifier of the user to be called @protocol Description of the call protocols supported by the application @is_video True, if a video call needs to be created
createCall user_id:int32 protocol:callProtocol is_video:Bool = CallId;

//@description Accepts an incoming call @call_id Call identifier @protocol Description of the call protocols supported by the application
acceptCall call_id:int32 protocol:callProtocol = Ok;

//@description Sends call signaling data @call_id Call identifier @data The data
sendCallSignalingData call_id:int32 data:bytes = Ok;

//@description Discards a call @call_id Call identifier @is_disconnected True, if the user was disconnected @duration The call duration, in seconds @is_video True, if the call was a video call @connection_id Identifier of the connection used during the call
discardCall call_id:int32 is_disconnected:Bool duration:int32 is_video:Bool connection_id:int64 = Ok;

//@description Sends a call rating @call_id Call identifier @rating Call rating; 1-5 @comment An optional user comment if the rating is less than 5 @problems List of the exact types of problems with the call, specified by the user
sendCallRating call_id:int32 rating:int32 comment:string problems:vector<CallProblem> = Ok;

//@description Sends debug information for a call @call_id Call identifier @debug_information Debug information in application-specific format
sendCallDebugInformation call_id:int32 debug_information:string = Ok;


//@description Creates a voice chat (a group call bound to a chat). Available only for basic groups and supergroups; requires can_manage_voice_chats rights @chat_id Chat identifier
createVoiceChat chat_id:int53 = GroupCallId;

//@description Returns information about a group call @group_call_id Group call identifier
getGroupCall group_call_id:int32 = GroupCall;

//@description Joins a group call @group_call_id Group call identifier @payload Group join payload, received from tgcalls. Use null to cancel previous joinGroupCall request @source Caller synchronization source identifier; received from tgcalls @is_muted True, if the user's microphone is muted
joinGroupCall group_call_id:int32 payload:groupCallPayload source:int32 is_muted:Bool = GroupCallJoinResponse;

//@description Toggles whether new participants of a group call can be unmuted only by administrators of the group call. Requires can_manage_voice_chats rights in the corresponding chat and allowed_change_mute_mew_participants group call flag
//@group_call_id Group call identifier @mute_new_participants New value of the mute_new_participants setting
toggleGroupCallMuteNewParticipants group_call_id:int32 mute_new_participants:Bool = Ok;

//@description Invites users to a group call. Sends a service message of type messageInviteToGroupCall for voice chats
//@group_call_id Group call identifier @user_ids User identifiers. At most 10 users can be invited simultaneously
inviteGroupCallParticipants group_call_id:int32 user_ids:vector<int32> = Ok;

//@description Informs TDLib that a group call participant speaking state has changed @group_call_id Group call identifier
//@source Group call participant's synchronization source identifier, or 0 for the current user @is_speaking True, if the user is speaking
setGroupCallParticipantIsSpeaking group_call_id:int32 source:int32 is_speaking:Bool = Ok;

//@description Toggles whether a group call participant is muted, unmuted, or allowed to unmute themself
//@group_call_id Group call identifier @user_id User identifier @is_muted Pass true if the user must be muted and false otherwise
toggleGroupCallParticipantIsMuted group_call_id:int32 user_id:int32 is_muted:Bool = Ok;

//@description Loads more group call participants. The loaded participants will be received through updates. Use the field groupCall.loaded_all_participants to check whether all participants has already been loaded
//@group_call_id Group call identifier. The group call must be previously received through getGroupCall and must be joined or being joined
//@limit Maximum number of participants to load
loadGroupCallParticipants group_call_id:int32 limit:int32 = Ok;

//@description Leaves a group call @group_call_id Group call identifier
leaveGroupCall group_call_id:int32 = Ok;

//@description Discards a group call. Requires can_manage_voice_chats rights in the corresponding chat @group_call_id Group call identifier
discardGroupCall group_call_id:int32 = Ok;


//@description Changes the block state of a message sender. Currently, only users and supergroup chats can be blocked @sender Message Sender @is_blocked New value of is_blocked
toggleMessageSenderIsBlocked sender:MessageSender is_blocked:Bool = Ok;

//@description Blocks an original sender of a message in the Replies chat
//@message_id The identifier of an incoming message in the Replies chat
//@delete_message Pass true if the message must be deleted
//@delete_all_messages Pass true if all messages from the same sender must be deleted
//@report_spam Pass true if the sender must be reported to the Telegram moderators
blockMessageSenderFromReplies message_id:int53 delete_message:Bool delete_all_messages:Bool report_spam:Bool = Ok;

//@description Returns users and chats that were blocked by the current user @offset Number of users and chats to skip in the result; must be non-negative @limit The maximum number of users and chats to return; up to 100
getBlockedMessageSenders offset:int32 limit:int32 = MessageSenders;


//@description Adds a user to the contact list or edits an existing contact by their user identifier @contact The contact to add or edit; phone number can be empty and needs to be specified only if known, vCard is ignored
//@share_phone_number True, if the new contact needs to be allowed to see current user's phone number. A corresponding rule to userPrivacySettingShowPhoneNumber will be added if needed. Use the field UserFullInfo.need_phone_number_privacy_exception to check whether the current user needs to be asked to share their phone number
addContact contact:contact share_phone_number:Bool = Ok;

//@description Adds new contacts or edits existing contacts by their phone numbers; contacts' user identifiers are ignored @contacts The list of contacts to import or edit; contacts' vCard are ignored and are not imported
importContacts contacts:vector<contact> = ImportedContacts;

//@description Returns all user contacts
getContacts = Users;

//@description Searches for the specified query in the first names, last names and usernames of the known user contacts @query Query to search for; may be empty to return all contacts @limit The maximum number of users to be returned
searchContacts query:string limit:int32 = Users;

//@description Removes users from the contact list @user_ids Identifiers of users to be deleted
removeContacts user_ids:vector<int32> = Ok;

//@description Returns the total number of imported contacts
getImportedContactCount = Count;

//@description Changes imported contacts using the list of contacts saved on the device. Imports newly added contacts and, if at least the file database is enabled, deletes recently deleted contacts.
//-Query result depends on the result of the previous query, so only one query is possible at the same time @contacts The new list of contacts, contact's vCard are ignored and are not imported
changeImportedContacts contacts:vector<contact> = ImportedContacts;

//@description Clears all imported contacts, contact list remains unchanged
clearImportedContacts = Ok;


//@description Shares the phone number of the current user with a mutual contact. Supposed to be called when the user clicks on chatActionBarSharePhoneNumber @user_id Identifier of the user with whom to share the phone number. The user must be a mutual contact
sharePhoneNumber user_id:int32 = Ok;


//@description Returns the profile photos of a user. The result of this query may be outdated: some photos might have been deleted already @user_id User identifier @offset The number of photos to skip; must be non-negative @limit The maximum number of photos to be returned; up to 100
getUserProfilePhotos user_id:int32 offset:int32 limit:int32 = ChatPhotos;


//@description Returns stickers from the installed sticker sets that correspond to a given emoji. If the emoji is not empty, favorite and recently used stickers may also be returned @emoji String representation of emoji. If empty, returns all known installed stickers @limit The maximum number of stickers to be returned
getStickers emoji:string limit:int32 = Stickers;

//@description Searches for stickers from public sticker sets that correspond to a given emoji @emoji String representation of emoji; must be non-empty @limit The maximum number of stickers to be returned
searchStickers emoji:string limit:int32 = Stickers;

//@description Returns a list of installed sticker sets @is_masks Pass true to return mask sticker sets; pass false to return ordinary sticker sets
getInstalledStickerSets is_masks:Bool = StickerSets;

//@description Returns a list of archived sticker sets @is_masks Pass true to return mask stickers sets; pass false to return ordinary sticker sets @offset_sticker_set_id Identifier of the sticker set from which to return the result @limit The maximum number of sticker sets to return
getArchivedStickerSets is_masks:Bool offset_sticker_set_id:int64 limit:int32 = StickerSets;

//@description Returns a list of trending sticker sets. For the optimal performance the number of returned sticker sets is chosen by the library
//@offset The offset from which to return the sticker sets; must be non-negative
//@limit The maximum number of sticker sets to be returned; must be non-negative. Fewer sticker sets may be returned than specified by the limit, even if the end of the list has not been reached
getTrendingStickerSets offset:int32 limit:int32 = StickerSets;

//@description Returns a list of sticker sets attached to a file. Currently only photos and videos can have attached sticker sets @file_id File identifier
getAttachedStickerSets file_id:int32 = StickerSets;

//@description Returns information about a sticker set by its identifier @set_id Identifier of the sticker set
getStickerSet set_id:int64 = StickerSet;

//@description Searches for a sticker set by its name @name Name of the sticker set
searchStickerSet name:string = StickerSet;

//@description Searches for installed sticker sets by looking for specified query in their title and name @is_masks Pass true to return mask sticker sets; pass false to return ordinary sticker sets @query Query to search for @limit The maximum number of sticker sets to return
searchInstalledStickerSets is_masks:Bool query:string limit:int32 = StickerSets;

//@description Searches for ordinary sticker sets by looking for specified query in their title and name. Excludes installed sticker sets from the results @query Query to search for
searchStickerSets query:string = StickerSets;

//@description Installs/uninstalls or activates/archives a sticker set @set_id Identifier of the sticker set @is_installed The new value of is_installed @is_archived The new value of is_archived. A sticker set can't be installed and archived simultaneously
changeStickerSet set_id:int64 is_installed:Bool is_archived:Bool = Ok;

//@description Informs the server that some trending sticker sets have been viewed by the user @sticker_set_ids Identifiers of viewed trending sticker sets
viewTrendingStickerSets sticker_set_ids:vector<int64> = Ok;

//@description Changes the order of installed sticker sets @is_masks Pass true to change the order of mask sticker sets; pass false to change the order of ordinary sticker sets @sticker_set_ids Identifiers of installed sticker sets in the new correct order
reorderInstalledStickerSets is_masks:Bool sticker_set_ids:vector<int64> = Ok;

//@description Returns a list of recently used stickers @is_attached Pass true to return stickers and masks that were recently attached to photos or video files; pass false to return recently sent stickers
getRecentStickers is_attached:Bool = Stickers;

//@description Manually adds a new sticker to the list of recently used stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first. Only stickers belonging to a sticker set can be added to this list
//@is_attached Pass true to add the sticker to the list of stickers recently attached to photo or video files; pass false to add the sticker to the list of recently sent stickers @sticker Sticker file to add
addRecentSticker is_attached:Bool sticker:InputFile = Stickers;

//@description Removes a sticker from the list of recently used stickers @is_attached Pass true to remove the sticker from the list of stickers recently attached to photo or video files; pass false to remove the sticker from the list of recently sent stickers @sticker Sticker file to delete
removeRecentSticker is_attached:Bool sticker:InputFile = Ok;

//@description Clears the list of recently used stickers @is_attached Pass true to clear the list of stickers recently attached to photo or video files; pass false to clear the list of recently sent stickers
clearRecentStickers is_attached:Bool = Ok;

//@description Returns favorite stickers
getFavoriteStickers = Stickers;

//@description Adds a new sticker to the list of favorite stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first. Only stickers belonging to a sticker set can be added to this list
//@sticker Sticker file to add
addFavoriteSticker sticker:InputFile = Ok;

//@description Removes a sticker from the list of favorite stickers @sticker Sticker file to delete from the list
removeFavoriteSticker sticker:InputFile = Ok;

//@description Returns emoji corresponding to a sticker. The list is only for informational purposes, because a sticker is always sent with a fixed emoji from the corresponding Sticker object @sticker Sticker file identifier
getStickerEmojis sticker:InputFile = Emojis;

//@description Searches for emojis by keywords. Supported only if the file database is enabled @text Text to search for @exact_match True, if only emojis, which exactly match text needs to be returned @input_language_codes List of possible IETF language tags of the user's input language; may be empty if unknown
searchEmojis text:string exact_match:Bool input_language_codes:vector<string> = Emojis;

//@description Returns an HTTP URL which can be used to automatically log in to the translation platform and suggest new emoji replacements. The URL will be valid for 30 seconds after generation @language_code Language code for which the emoji replacements will be suggested
getEmojiSuggestionsUrl language_code:string = HttpUrl;


//@description Returns saved animations
getSavedAnimations = Animations;

//@description Manually adds a new animation to the list of saved animations. The new animation is added to the beginning of the list. If the animation was already in the list, it is removed first. Only non-secret video animations with MIME type "video/mp4" can be added to the list
//@animation The animation file to be added. Only animations known to the server (i.e. successfully sent via a message) can be added to the list
addSavedAnimation animation:InputFile = Ok;

//@description Removes an animation from the list of saved animations @animation Animation file to be removed
removeSavedAnimation animation:InputFile = Ok;


//@description Returns up to 20 recently used inline bots in the order of their last usage
getRecentInlineBots = Users;


//@description Searches for recently used hashtags by their prefix @prefix Hashtag prefix to search for @limit The maximum number of hashtags to be returned
searchHashtags prefix:string limit:int32 = Hashtags;

//@description Removes a hashtag from the list of recently used hashtags @hashtag Hashtag to delete
removeRecentHashtag hashtag:string = Ok;


//@description Returns a web page preview by the text of the message. Do not call this function too often. Returns a 404 error if the web page has no preview @text Message text with formatting
getWebPagePreview text:formattedText = WebPage;

//@description Returns an instant view version of a web page if available. Returns a 404 error if the web page has no instant view page @url The web page URL @force_full If true, the full instant view for the web page will be returned
getWebPageInstantView url:string force_full:Bool = WebPageInstantView;


//@description Changes a profile photo for the current user @photo Profile photo to set
setProfilePhoto photo:InputChatPhoto = Ok;

//@description Deletes a profile photo @profile_photo_id Identifier of the profile photo to delete
deleteProfilePhoto profile_photo_id:int64 = Ok;

//@description Changes the first and last name of the current user @first_name The new value of the first name for the user; 1-64 characters @last_name The new value of the optional last name for the user; 0-64 characters
setName first_name:string last_name:string = Ok;

//@description Changes the bio of the current user @bio The new value of the user bio; 0-70 characters without line feeds
setBio bio:string = Ok;

//@description Changes the username of the current user @username The new value of the username. Use an empty string to remove the username
setUsername username:string = Ok;

//@description Changes the location of the current user. Needs to be called if GetOption("is_location_visible") is true and location changes for more than 1 kilometer @location The new location of the user
setLocation location:location = Ok;

//@description Changes the phone number of the user and sends an authentication code to the user's new phone number. On success, returns information about the sent code
//@phone_number The new phone number of the user in international format @settings Settings for the authentication of the user's phone number
changePhoneNumber phone_number:string settings:phoneNumberAuthenticationSettings = AuthenticationCodeInfo;

//@description Re-sends the authentication code sent to confirm a new phone number for the user. Works only if the previously received authenticationCodeInfo next_code_type was not null
resendChangePhoneNumberCode = AuthenticationCodeInfo;

//@description Checks the authentication code sent to confirm a new phone number of the user @code Verification code received by SMS, phone call or flash call
checkChangePhoneNumberCode code:string = Ok;

//@description Sets the list of commands supported by the bot; for bots only @commands List of the bot's commands
setCommands commands:vector<botCommand> = Ok;


//@description Returns all active sessions of the current user
getActiveSessions = Sessions;

//@description Terminates a session of the current user @session_id Session identifier
terminateSession session_id:int64 = Ok;

//@description Terminates all other sessions of the current user
terminateAllOtherSessions = Ok;


//@description Returns all website where the current user used Telegram to log in
getConnectedWebsites = ConnectedWebsites;

//@description Disconnects website from the current user's Telegram account @website_id Website identifier
disconnectWebsite website_id:int64 = Ok;

//@description Disconnects all websites from the current user's Telegram account
disconnectAllWebsites = Ok;


//@description Changes the username of a supergroup or channel, requires owner privileges in the supergroup or channel @supergroup_id Identifier of the supergroup or channel @username New value of the username. Use an empty string to remove the username
setSupergroupUsername supergroup_id:int32 username:string = Ok;

//@description Changes the sticker set of a supergroup; requires can_change_info rights @supergroup_id Identifier of the supergroup @sticker_set_id New value of the supergroup sticker set identifier. Use 0 to remove the supergroup sticker set
setSupergroupStickerSet supergroup_id:int32 sticker_set_id:int64 = Ok;

//@description Toggles sender signatures messages sent in a channel; requires can_change_info rights @supergroup_id Identifier of the channel @sign_messages New value of sign_messages
toggleSupergroupSignMessages supergroup_id:int32 sign_messages:Bool = Ok;

//@description Toggles whether the message history of a supergroup is available to new members; requires can_change_info rights @supergroup_id The identifier of the supergroup @is_all_history_available The new value of is_all_history_available
toggleSupergroupIsAllHistoryAvailable supergroup_id:int32 is_all_history_available:Bool = Ok;

//@description Reports some messages from a user in a supergroup as spam; requires administrator rights in the supergroup @supergroup_id Supergroup identifier @user_id User identifier @message_ids Identifiers of messages sent in the supergroup by the user. This list must be non-empty
reportSupergroupSpam supergroup_id:int32 user_id:int32 message_ids:vector<int53> = Ok;

//@description Returns information about members or banned users in a supergroup or channel. Can be used only if SupergroupFullInfo.can_get_members == true; additionally, administrator privileges may be required for some filters @supergroup_id Identifier of the supergroup or channel
//@filter The type of users to return. By default, supergroupMembersFilterRecent @offset Number of users to skip @limit The maximum number of users be returned; up to 200
getSupergroupMembers supergroup_id:int32 filter:SupergroupMembersFilter offset:int32 limit:int32 = ChatMembers;

//@description Deletes a supergroup or channel along with all messages in the corresponding chat. This will release the supergroup or channel username and remove all members; requires owner privileges in the supergroup or channel. Chats with more than 1000 members can't be deleted using this method @supergroup_id Identifier of the supergroup or channel
deleteSupergroup supergroup_id:int32 = Ok;


//@description Closes a secret chat, effectively transferring its state to secretChatStateClosed @secret_chat_id Secret chat identifier
closeSecretChat secret_chat_id:int32 = Ok;


//@description Returns a list of service actions taken by chat members and administrators in the last 48 hours. Available only for supergroups and channels. Requires administrator rights. Returns results in reverse chronological order (i. e., in order of decreasing event_id)
//@chat_id Chat identifier @query Search query by which to filter events @from_event_id Identifier of an event from which to return results. Use 0 to get results from the latest events @limit The maximum number of events to return; up to 100
//@filters The types of events to return. By default, all types will be returned @user_ids User identifiers by which to filter events. By default, events relating to all users will be returned
getChatEventLog chat_id:int53 query:string from_event_id:int64 limit:int32 filters:chatEventLogFilters user_ids:vector<int32> = ChatEvents;


//@description Returns an invoice payment form. This method should be called when the user presses inlineKeyboardButtonBuy @chat_id Chat identifier of the Invoice message @message_id Message identifier
getPaymentForm chat_id:int53 message_id:int53 = PaymentForm;

//@description Validates the order information provided by a user and returns the available shipping options for a flexible invoice @chat_id Chat identifier of the Invoice message @message_id Message identifier @order_info The order information, provided by the user @allow_save True, if the order information can be saved
validateOrderInfo chat_id:int53 message_id:int53 order_info:orderInfo allow_save:Bool = ValidatedOrderInfo;

//@description Sends a filled-out payment form to the bot for final verification @chat_id Chat identifier of the Invoice message @message_id Message identifier @order_info_id Identifier returned by ValidateOrderInfo, or an empty string @shipping_option_id Identifier of a chosen shipping option, if applicable
//@credentials The credentials chosen by user for payment
sendPaymentForm chat_id:int53 message_id:int53 order_info_id:string shipping_option_id:string credentials:InputCredentials = PaymentResult;

//@description Returns information about a successful payment @chat_id Chat identifier of the PaymentSuccessful message @message_id Message identifier
getPaymentReceipt chat_id:int53 message_id:int53 = PaymentReceipt;

//@description Returns saved order info, if any
getSavedOrderInfo = OrderInfo;

//@description Deletes saved order info
deleteSavedOrderInfo = Ok;

//@description Deletes saved credentials for all payment provider bots
deleteSavedCredentials = Ok;


//@description Returns a user that can be contacted to get support
getSupportUser = User;


//@description Returns backgrounds installed by the user @for_dark_theme True, if the backgrounds must be ordered for dark theme
getBackgrounds for_dark_theme:Bool = Backgrounds;

//@description Constructs a persistent HTTP URL for a background @name Background name @type Background type
getBackgroundUrl name:string type:BackgroundType = HttpUrl;

//@description Searches for a background by its name @name The name of the background
searchBackground name:string = Background;

//@description Changes the background selected by the user; adds background to the list of installed backgrounds
//@background The input background to use, null for filled backgrounds
//@type Background type; null for default background. The method will return error 404 if type is null
//@for_dark_theme True, if the background is chosen for dark theme
setBackground background:InputBackground type:BackgroundType for_dark_theme:Bool = Background;

//@description Removes background from the list of installed backgrounds @background_id The background identifier
removeBackground background_id:int64 = Ok;

//@description Resets list of installed backgrounds to its default value
resetBackgrounds = Ok;


//@description Returns information about the current localization target. This is an offline request if only_local is true. Can be called before authorization @only_local If true, returns only locally available information without sending network requests
getLocalizationTargetInfo only_local:Bool = LocalizationTargetInfo;

//@description Returns information about a language pack. Returned language pack identifier may be different from a provided one. Can be called before authorization @language_pack_id Language pack identifier
getLanguagePackInfo language_pack_id:string = LanguagePackInfo;

//@description Returns strings from a language pack in the current localization target by their keys. Can be called before authorization @language_pack_id Language pack identifier of the strings to be returned @keys Language pack keys of the strings to be returned; leave empty to request all available strings
getLanguagePackStrings language_pack_id:string keys:vector<string> = LanguagePackStrings;

//@description Fetches the latest versions of all strings from a language pack in the current localization target from the server. This method shouldn't be called explicitly for the current used/base language packs. Can be called before authorization @language_pack_id Language pack identifier
synchronizeLanguagePack language_pack_id:string = Ok;

//@description Adds a custom server language pack to the list of installed language packs in current localization target. Can be called before authorization @language_pack_id Identifier of a language pack to be added; may be different from a name that is used in an "https://t.me/setlanguage/" link
addCustomServerLanguagePack language_pack_id:string = Ok;

//@description Adds or changes a custom local language pack to the current localization target @info Information about the language pack. Language pack ID must start with 'X', consist only of English letters, digits and hyphens, and must not exceed 64 characters. Can be called before authorization @strings Strings of the new language pack
setCustomLanguagePack info:languagePackInfo strings:vector<languagePackString> = Ok;

//@description Edits information about a custom local language pack in the current localization target. Can be called before authorization @info New information about the custom local language pack
editCustomLanguagePackInfo info:languagePackInfo = Ok;

//@description Adds, edits or deletes a string in a custom local language pack. Can be called before authorization @language_pack_id Identifier of a previously added custom local language pack in the current localization target @new_string New language pack string
setCustomLanguagePackString language_pack_id:string new_string:languagePackString = Ok;

//@description Deletes all information about a language pack in the current localization target. The language pack which is currently in use (including base language pack) or is being synchronized can't be deleted. Can be called before authorization @language_pack_id Identifier of the language pack to delete
deleteLanguagePack language_pack_id:string = Ok;


//@description Registers the currently used device for receiving push notifications. Returns a globally unique identifier of the push notification subscription @device_token Device token @other_user_ids List of user identifiers of other users currently using the application
registerDevice device_token:DeviceToken other_user_ids:vector<int32> = PushReceiverId;

//@description Handles a push notification. Returns error with code 406 if the push notification is not supported and connection to the server is required to fetch new data. Can be called before authorization
//@payload JSON-encoded push notification payload with all fields sent by the server, and "google.sent_time" and "google.notification.sound" fields added
processPushNotification payload:string = Ok;

//@description Returns a globally unique push notification subscription identifier for identification of an account, which has received a push notification. Can be called synchronously @payload JSON-encoded push notification payload
getPushReceiverId payload:string = PushReceiverId;


//@description Returns t.me URLs recently visited by a newly registered user @referrer Google Play referrer to identify the user
getRecentlyVisitedTMeUrls referrer:string = TMeUrls;


//@description Changes user privacy settings @setting The privacy setting @rules The new privacy rules
setUserPrivacySettingRules setting:UserPrivacySetting rules:userPrivacySettingRules = Ok;

//@description Returns the current privacy settings @setting The privacy setting
getUserPrivacySettingRules setting:UserPrivacySetting = UserPrivacySettingRules;


//@description Returns the value of an option by its name. (Check the list of available options on https://core.telegram.org/tdlib/options.) Can be called before authorization
//@name The name of the option
getOption name:string = OptionValue;

//@description Sets the value of an option. (Check the list of available options on https://core.telegram.org/tdlib/options.) Only writable options can be set. Can be called before authorization
//@name The name of the option @value The new value of the option
setOption name:string value:OptionValue = Ok;


//@description Changes the period of inactivity after which the account of the current user will automatically be deleted @ttl New account TTL
setAccountTtl ttl:accountTtl = Ok;

//@description Returns the period of inactivity after which the account of the current user will automatically be deleted
getAccountTtl = AccountTtl;

//@description Deletes the account of the current user, deleting all information associated with the user from the server. The phone number of the account can be used to create a new account. Can be called before authorization when the current authorization state is authorizationStateWaitPassword @reason The reason why the account was deleted; optional
deleteAccount reason:string = Ok;


//@description Removes a chat action bar without any other action @chat_id Chat identifier
removeChatActionBar chat_id:int53 = Ok;

//@description Reports a chat to the Telegram moderators. A chat can be reported only from the chat action bar, or if this is a private chats with a bot, a private chat with a user sharing their location, a supergroup, or a channel, since other chats can't be checked by moderators @chat_id Chat identifier @reason The reason for reporting the chat @message_ids Identifiers of reported messages, if any
reportChat chat_id:int53 reason:ChatReportReason message_ids:vector<int53> = Ok;


//@description Returns an HTTP URL with the chat statistics. Currently this method of getting the statistics are disabled and can be deleted in the future @chat_id Chat identifier @parameters Parameters from "tg://statsrefresh?params=******" link @is_dark Pass true if a URL with the dark theme must be returned
getChatStatisticsUrl chat_id:int53 parameters:string is_dark:Bool = HttpUrl;

//@description Returns detailed statistics about a chat. Currently this method can be used only for supergroups and channels. Can be used only if SupergroupFullInfo.can_get_statistics == true @chat_id Chat identifier @is_dark Pass true if a dark theme is used by the application
getChatStatistics chat_id:int53 is_dark:Bool = ChatStatistics;

//@description Returns detailed statistics about a message. Can be used only if Message.can_get_statistics == true @chat_id Chat identifier @message_id Message identifier @is_dark Pass true if a dark theme is used by the application
getMessageStatistics chat_id:int53 message_id:int53 is_dark:Bool = MessageStatistics;

//@description Loads an asynchronous or a zoomed in statistical graph @chat_id Chat identifier @token The token for graph loading @x X-value for zoomed in graph or 0 otherwise
getStatisticalGraph chat_id:int53 token:string x:int53 = StatisticalGraph;


//@description Returns storage usage statistics. Can be called before authorization @chat_limit The maximum number of chats with the largest storage usage for which separate statistics should be returned. All other chats will be grouped in entries with chat_id == 0. If the chat info database is not used, the chat_limit is ignored and is always set to 0
getStorageStatistics chat_limit:int32 = StorageStatistics;

//@description Quickly returns approximate storage usage statistics. Can be called before authorization
getStorageStatisticsFast = StorageStatisticsFast;

//@description Returns database statistics
getDatabaseStatistics = DatabaseStatistics;

//@description Optimizes storage usage, i.e. deletes some files and returns new storage usage statistics. Secret thumbnails can't be deleted
//@size Limit on the total size of files after deletion. Pass -1 to use the default limit
//@ttl Limit on the time that has passed since the last time a file was accessed (or creation time for some filesystems). Pass -1 to use the default limit
//@count Limit on the total count of files after deletion. Pass -1 to use the default limit
//@immunity_delay The amount of time after the creation of a file during which it can't be deleted, in seconds. Pass -1 to use the default value
//@file_types If not empty, only files with the given type(s) are considered. By default, all types except thumbnails, profile photos, stickers and wallpapers are deleted
//@chat_ids If not empty, only files from the given chats are considered. Use 0 as chat identifier to delete files not belonging to any chat (e.g., profile photos)
//@exclude_chat_ids If not empty, files from the given chats are excluded. Use 0 as chat identifier to exclude all files not belonging to any chat (e.g., profile photos)
//@return_deleted_file_statistics Pass true if statistics about the files that were deleted must be returned instead of the whole storage usage statistics. Affects only returned statistics
//@chat_limit Same as in getStorageStatistics. Affects only returned statistics
optimizeStorage size:int53 ttl:int32 count:int32 immunity_delay:int32 file_types:vector<FileType> chat_ids:vector<int53> exclude_chat_ids:vector<int53> return_deleted_file_statistics:Bool chat_limit:int32 = StorageStatistics;


//@description Sets the current network type. Can be called before authorization. Calling this method forces all network connections to reopen, mitigating the delay in switching between different networks, so it should be called whenever the network is changed, even if the network type remains the same.
//-Network type is used to check whether the library can use the network at all and also for collecting detailed network data usage statistics @type The new network type. By default, networkTypeOther
setNetworkType type:NetworkType = Ok;

//@description Returns network data usage statistics. Can be called before authorization @only_current If true, returns only data for the current library launch
getNetworkStatistics only_current:Bool = NetworkStatistics;

//@description Adds the specified data to data usage statistics. Can be called before authorization @entry The network statistics entry with the data to be added to statistics
addNetworkStatistics entry:NetworkStatisticsEntry = Ok;

//@description Resets all network data usage statistics to zero. Can be called before authorization
resetNetworkStatistics = Ok;

//@description Returns auto-download settings presets for the current user
getAutoDownloadSettingsPresets = AutoDownloadSettingsPresets;

//@description Sets auto-download settings @settings New user auto-download settings @type Type of the network for which the new settings are applied
setAutoDownloadSettings settings:autoDownloadSettings type:NetworkType = Ok;


//@description Returns information about a bank card @bank_card_number The bank card number
getBankCardInfo bank_card_number:string = BankCardInfo;


//@description Returns one of the available Telegram Passport elements @type Telegram Passport element type @password Password of the current user
getPassportElement type:PassportElementType password:string = PassportElement;

//@description Returns all available Telegram Passport elements @password Password of the current user
getAllPassportElements password:string = PassportElements;

//@description Adds an element to the user's Telegram Passport. May return an error with a message "PHONE_VERIFICATION_NEEDED" or "EMAIL_VERIFICATION_NEEDED" if the chosen phone number or the chosen email address must be verified first @element Input Telegram Passport element @password Password of the current user
setPassportElement element:InputPassportElement password:string = PassportElement;

//@description Deletes a Telegram Passport element @type Element type
deletePassportElement type:PassportElementType = Ok;

//@description Informs the user that some of the elements in their Telegram Passport contain errors; for bots only. The user will not be able to resend the elements, until the errors are fixed @user_id User identifier @errors The errors
setPassportElementErrors user_id:int32 errors:vector<inputPassportElementError> = Ok;


//@description Returns an IETF language tag of the language preferred in the country, which should be used to fill native fields in Telegram Passport personal details. Returns a 404 error if unknown @country_code A two-letter ISO 3166-1 alpha-2 country code
getPreferredCountryLanguage country_code:string = Text;


//@description Sends a code to verify a phone number to be added to a user's Telegram Passport
//@phone_number The phone number of the user, in international format @settings Settings for the authentication of the user's phone number
sendPhoneNumberVerificationCode phone_number:string settings:phoneNumberAuthenticationSettings = AuthenticationCodeInfo;

//@description Re-sends the code to verify a phone number to be added to a user's Telegram Passport
resendPhoneNumberVerificationCode = AuthenticationCodeInfo;

//@description Checks the phone number verification code for Telegram Passport @code Verification code
checkPhoneNumberVerificationCode code:string = Ok;


//@description Sends a code to verify an email address to be added to a user's Telegram Passport @email_address Email address
sendEmailAddressVerificationCode email_address:string = EmailAddressAuthenticationCodeInfo;

//@description Re-sends the code to verify an email address to be added to a user's Telegram Passport
resendEmailAddressVerificationCode = EmailAddressAuthenticationCodeInfo;

//@description Checks the email address verification code for Telegram Passport @code Verification code
checkEmailAddressVerificationCode code:string = Ok;


//@description Returns a Telegram Passport authorization form for sharing data with a service @bot_user_id User identifier of the service's bot @scope Telegram Passport element types requested by the service @public_key Service's public_key @nonce Authorization form nonce provided by the service
getPassportAuthorizationForm bot_user_id:int32 scope:string public_key:string nonce:string = PassportAuthorizationForm;

//@description Returns already available Telegram Passport elements suitable for completing a Telegram Passport authorization form. Result can be received only once for each authorization form @autorization_form_id Authorization form identifier @password Password of the current user
getPassportAuthorizationFormAvailableElements autorization_form_id:int32 password:string = PassportElementsWithErrors;

//@description Sends a Telegram Passport authorization form, effectively sharing data with the service. This method must be called after getPassportAuthorizationFormAvailableElements if some previously available elements are going to be reused
//@autorization_form_id Authorization form identifier @types Types of Telegram Passport elements chosen by user to complete the authorization form
sendPassportAuthorizationForm autorization_form_id:int32 types:vector<PassportElementType> = Ok;


//@description Sends phone number confirmation code. Should be called when user presses "https://t.me/confirmphone?phone=*******&hash=**********" or "tg://confirmphone?phone=*******&hash=**********" link @hash Value of the "hash" parameter from the link
//@phone_number Value of the "phone" parameter from the link @settings Settings for the authentication of the user's phone number
sendPhoneNumberConfirmationCode hash:string phone_number:string settings:phoneNumberAuthenticationSettings = AuthenticationCodeInfo;

//@description Resends phone number confirmation code
resendPhoneNumberConfirmationCode = AuthenticationCodeInfo;

//@description Checks phone number confirmation code @code The phone number confirmation code
checkPhoneNumberConfirmationCode code:string = Ok;


//@description Informs the server about the number of pending bot updates if they haven't been processed for a long time; for bots only @pending_update_count The number of pending updates @error_message The last error message
setBotUpdatesStatus pending_update_count:int32 error_message:string = Ok;


//@description Uploads a PNG image with a sticker; for bots only; returns the uploaded file
//@user_id Sticker file owner @png_sticker PNG image with the sticker; must be up to 512 KB in size and fit in 512x512 square
uploadStickerFile user_id:int32 png_sticker:InputFile = File;

//@description Creates a new sticker set; for bots only. Returns the newly created sticker set
//@user_id Sticker set owner
//@title Sticker set title; 1-64 characters
//@name Sticker set name. Can contain only English letters, digits and underscores. Must end with *"_by_<bot username>"* (*<bot_username>* is case insensitive); 1-64 characters
//@is_masks True, if stickers are masks. Animated stickers can't be masks
//@stickers List of stickers to be added to the set; must be non-empty. All stickers must be of the same type
createNewStickerSet user_id:int32 title:string name:string is_masks:Bool stickers:vector<InputSticker> = StickerSet;

//@description Adds a new sticker to a set; for bots only. Returns the sticker set
//@user_id Sticker set owner @name Sticker set name @sticker Sticker to add to the set
addStickerToSet user_id:int32 name:string sticker:InputSticker = StickerSet;

//@description Sets a sticker set thumbnail; for bots only. Returns the sticker set
//@user_id Sticker set owner @name Sticker set name
//@thumbnail Thumbnail to set in PNG or TGS format. Animated thumbnail must be set for animated sticker sets and only for them. Pass a zero InputFileId to delete the thumbnail
setStickerSetThumbnail user_id:int32 name:string thumbnail:InputFile = StickerSet;

//@description Changes the position of a sticker in the set to which it belongs; for bots only. The sticker set must have been created by the bot
//@sticker Sticker @position New position of the sticker in the set, zero-based
setStickerPositionInSet sticker:InputFile position:int32 = Ok;

//@description Removes a sticker from the set to which it belongs; for bots only. The sticker set must have been created by the bot @sticker Sticker
removeStickerFromSet sticker:InputFile = Ok;


//@description Returns information about a file with a map thumbnail in PNG format. Only map thumbnail files with size less than 1MB can be downloaded @location Location of the map center @zoom Map zoom level; 13-20 @width Map width in pixels before applying scale; 16-1024 @height Map height in pixels before applying scale; 16-1024 @scale Map scale; 1-3 @chat_id Identifier of a chat, in which the thumbnail will be shown. Use 0 if unknown
getMapThumbnailFile location:location zoom:int32 width:int32 height:int32 scale:int32 chat_id:int53 = File;


//@description Accepts Telegram terms of services @terms_of_service_id Terms of service identifier
acceptTermsOfService terms_of_service_id:string = Ok;


//@description Sends a custom request; for bots only @method The method name @parameters JSON-serialized method parameters
sendCustomRequest method:string parameters:string = CustomRequestResult;

//@description Answers a custom query; for bots only @custom_query_id Identifier of a custom query @data JSON-serialized answer to the query
answerCustomQuery custom_query_id:int64 data:string = Ok;


//@description Succeeds after a specified amount of time has passed. Can be called before initialization @seconds Number of seconds before the function returns
setAlarm seconds:double = Ok;


//@description Returns information about existing countries. Can be called before authorization
getCountries = Countries;

//@description Uses the current IP address to find the current country. Returns two-letter ISO 3166-1 alpha-2 country code. Can be called before authorization
getCountryCode = Text;

//@description Returns information about a phone number by its prefix. Can be called before authorization @phone_number_prefix The phone number prefix
getPhoneNumberInfo phone_number_prefix:string = PhoneNumberInfo;

//@description Returns the default text for invitation messages to be used as a placeholder when the current user invites friends to Telegram
getInviteText = Text;

//@description Returns information about a tg:// deep link. Use "tg://need_update_for_some_feature" or "tg:some_unsupported_feature" for testing. Returns a 404 error for unknown links. Can be called before authorization @link The link
getDeepLinkInfo link:string = DeepLinkInfo;


//@description Returns application config, provided by the server. Can be called before authorization
getApplicationConfig = JsonValue;

//@description Saves application log event on the server. Can be called before authorization @type Event type @chat_id Optional chat identifier, associated with the event @data The log event data
saveApplicationLogEvent type:string chat_id:int53 data:JsonValue = Ok;


//@description Adds a proxy server for network requests. Can be called before authorization @server Proxy server IP address @port Proxy server port @enable True, if the proxy should be enabled @type Proxy type
addProxy server:string port:int32 enable:Bool type:ProxyType = Proxy;

//@description Edits an existing proxy server for network requests. Can be called before authorization @proxy_id Proxy identifier @server Proxy server IP address @port Proxy server port @enable True, if the proxy should be enabled @type Proxy type
editProxy proxy_id:int32 server:string port:int32 enable:Bool type:ProxyType = Proxy;

//@description Enables a proxy. Only one proxy can be enabled at a time. Can be called before authorization @proxy_id Proxy identifier
enableProxy proxy_id:int32 = Ok;

//@description Disables the currently enabled proxy. Can be called before authorization
disableProxy = Ok;

//@description Removes a proxy server. Can be called before authorization @proxy_id Proxy identifier
removeProxy proxy_id:int32 = Ok;

//@description Returns list of proxies that are currently set up. Can be called before authorization
getProxies = Proxies;

//@description Returns an HTTPS link, which can be used to add a proxy. Available only for SOCKS5 and MTProto proxies. Can be called before authorization @proxy_id Proxy identifier
getProxyLink proxy_id:int32 = Text;

//@description Computes time needed to receive a response from a Telegram server through a proxy. Can be called before authorization @proxy_id Proxy identifier. Use 0 to ping a Telegram server without a proxy
pingProxy proxy_id:int32 = Seconds;


//@description Sets new log stream for internal logging of TDLib. Can be called synchronously @log_stream New log stream
setLogStream log_stream:LogStream = Ok;

//@description Returns information about currently used log stream for internal logging of TDLib. Can be called synchronously
getLogStream = LogStream;

//@description Sets the verbosity level of the internal logging of TDLib. Can be called synchronously
//@new_verbosity_level New value of the verbosity level for logging. Value 0 corresponds to fatal errors, value 1 corresponds to errors, value 2 corresponds to warnings and debug warnings, value 3 corresponds to informational, value 4 corresponds to debug, value 5 corresponds to verbose debug, value greater than 5 and up to 1023 can be used to enable even more logging
setLogVerbosityLevel new_verbosity_level:int32 = Ok;

//@description Returns current verbosity level of the internal logging of TDLib. Can be called synchronously
getLogVerbosityLevel = LogVerbosityLevel;

//@description Returns list of available TDLib internal log tags, for example, ["actor", "binlog", "connections", "notifications", "proxy"]. Can be called synchronously
getLogTags = LogTags;

//@description Sets the verbosity level for a specified TDLib internal log tag. Can be called synchronously
//@tag Logging tag to change verbosity level @new_verbosity_level New verbosity level; 1-1024
setLogTagVerbosityLevel tag:string new_verbosity_level:int32 = Ok;

//@description Returns current verbosity level for a specified TDLib internal log tag. Can be called synchronously @tag Logging tag to change verbosity level
getLogTagVerbosityLevel tag:string = LogVerbosityLevel;

//@description Adds a message to TDLib internal log. Can be called synchronously
//@verbosity_level The minimum verbosity level needed for the message to be logged, 0-1023 @text Text of a message to log
addLogMessage verbosity_level:int32 text:string = Ok;


//@description Does nothing; for testing only. This is an offline method. Can be called before authorization
testCallEmpty = Ok;
//@description Returns the received string; for testing only. This is an offline method. Can be called before authorization @x String to return
testCallString x:string = TestString;
//@description Returns the received bytes; for testing only. This is an offline method. Can be called before authorization @x Bytes to return
testCallBytes x:bytes = TestBytes;
//@description Returns the received vector of numbers; for testing only. This is an offline method. Can be called before authorization @x Vector of numbers to return
testCallVectorInt x:vector<int32> = TestVectorInt;
//@description Returns the received vector of objects containing a number; for testing only. This is an offline method. Can be called before authorization @x Vector of objects to return
testCallVectorIntObject x:vector<testInt> = TestVectorIntObject;
//@description Returns the received vector of strings; for testing only. This is an offline method. Can be called before authorization @x Vector of strings to return
testCallVectorString x:vector<string> = TestVectorString;
//@description Returns the received vector of objects containing a string; for testing only. This is an offline method. Can be called before authorization @x Vector of objects to return
testCallVectorStringObject x:vector<testString> = TestVectorStringObject;
//@description Returns the squared received number; for testing only. This is an offline method. Can be called before authorization @x Number to square
testSquareInt x:int32 = TestInt;
//@description Sends a simple network request to the Telegram servers; for testing only. Can be called before authorization
testNetwork = Ok;
//@description Sends a simple network request to the Telegram servers via proxy; for testing only. Can be called before authorization @server Proxy server IP address @port Proxy server port @type Proxy type
//@dc_id Identifier of a datacenter, with which to test connection @timeout The maximum overall timeout for the request
testProxy server:string port:int32 type:ProxyType dc_id:int32 timeout:double = Ok;
//@description Forces an updates.getDifference call to the Telegram servers; for testing only
testGetDifference = Ok;
//@description Does nothing and ensures that the Update object is used; for testing only. This is an offline method. Can be called before authorization
testUseUpdate = Update;
//@description Returns the specified error and ensures that the Error object is used; for testing only. Can be called synchronously @error The error to be returned
testReturnError error:error = Error;
