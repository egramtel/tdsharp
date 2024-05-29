//@description Returns the current authorization state; this is an offline request. For informational purposes only. Use updateAuthorizationState instead to maintain the current authorization state. Can be called before initialization
getAuthorizationState = AuthorizationState;


//@description Sets the parameters for TDLib initialization. Works only when the current authorization state is authorizationStateWaitTdlibParameters
//@use_test_dc Pass true to use Telegram test environment instead of the production environment
//@database_directory The path to the directory for the persistent database; if empty, the current working directory will be used
//@files_directory The path to the directory for storing files; if empty, database_directory will be used
//@database_encryption_key Encryption key for the database. If the encryption key is invalid, then an error with code 401 will be returned
//@use_file_database Pass true to keep information about downloaded and uploaded files between application restarts
//@use_chat_info_database Pass true to keep cache of users, basic groups, supergroups, channels and secret chats between restarts. Implies use_file_database
//@use_message_database Pass true to keep cache of chats and messages between restarts. Implies use_chat_info_database
//@use_secret_chats Pass true to enable support for secret chats
//@api_id Application identifier for Telegram API access, which can be obtained at https://my.telegram.org
//@api_hash Application identifier hash for Telegram API access, which can be obtained at https://my.telegram.org
//@system_language_code IETF language tag of the user's operating system language; must be non-empty
//@device_model Model of the device the application is being run on; must be non-empty
//@system_version Version of the operating system the application is being run on. If empty, the version is automatically detected by TDLib
//@application_version Application version; must be non-empty
setTdlibParameters use_test_dc:Bool database_directory:string files_directory:string database_encryption_key:bytes use_file_database:Bool use_chat_info_database:Bool use_message_database:Bool use_secret_chats:Bool api_id:int32 api_hash:string system_language_code:string device_model:string system_version:string application_version:string = Ok;

//@description Sets the phone number of the user and sends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitPhoneNumber,
//-or if there is no pending authentication query and the current authorization state is authorizationStateWaitEmailAddress, authorizationStateWaitEmailCode, authorizationStateWaitCode, authorizationStateWaitRegistration, or authorizationStateWaitPassword
//@phone_number The phone number of the user, in international format
//@settings Settings for the authentication of the user's phone number; pass null to use default settings
setAuthenticationPhoneNumber phone_number:string settings:phoneNumberAuthenticationSettings = Ok;

//@description Sets the email address of the user and sends an authentication code to the email address. Works only when the current authorization state is authorizationStateWaitEmailAddress @email_address The email address of the user
setAuthenticationEmailAddress email_address:string = Ok;

//@description Resends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitCode, the next_code_type of the result is not null and the server-specified timeout has passed,
//-or when the current authorization state is authorizationStateWaitEmailCode
resendAuthenticationCode = Ok;

//@description Checks the authentication of an email address. Works only when the current authorization state is authorizationStateWaitEmailCode @code Email address authentication to check
checkAuthenticationEmailCode code:EmailAddressAuthentication = Ok;

//@description Checks the authentication code. Works only when the current authorization state is authorizationStateWaitCode @code Authentication code to check
checkAuthenticationCode code:string = Ok;

//@description Requests QR code authentication by scanning a QR code on another logged in device. Works only when the current authorization state is authorizationStateWaitPhoneNumber,
//-or if there is no pending authentication query and the current authorization state is authorizationStateWaitEmailAddress, authorizationStateWaitEmailCode, authorizationStateWaitCode, authorizationStateWaitRegistration, or authorizationStateWaitPassword
//@other_user_ids List of user identifiers of other users currently using the application
requestQrCodeAuthentication other_user_ids:vector<int53> = Ok;

//@description Finishes user registration. Works only when the current authorization state is authorizationStateWaitRegistration
//@first_name The first name of the user; 1-64 characters
//@last_name The last name of the user; 0-64 characters
//@disable_notification Pass true to disable notification about the current user joining Telegram for other users that added them to contact list
registerUser first_name:string last_name:string disable_notification:Bool = Ok;

//@description Resets the login email address. May return an error with a message "TASK_ALREADY_EXISTS" if reset is still pending.
//-Works only when the current authorization state is authorizationStateWaitEmailCode and authorization_state.can_reset_email_address == true
resetAuthenticationEmailAddress = Ok;

//@description Checks the 2-step verification password for correctness. Works only when the current authorization state is authorizationStateWaitPassword @password The 2-step verification password to check
checkAuthenticationPassword password:string = Ok;

//@description Requests to send a 2-step verification password recovery code to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword
requestAuthenticationPasswordRecovery = Ok;

//@description Checks whether a 2-step verification password recovery code sent to an email address is valid. Works only when the current authorization state is authorizationStateWaitPassword @recovery_code Recovery code to check
checkAuthenticationPasswordRecoveryCode recovery_code:string = Ok;

//@description Recovers the 2-step verification password with a password recovery code sent to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword
//@recovery_code Recovery code to check
//@new_password New 2-step verification password of the user; may be empty to remove the password
//@new_hint New password hint; may be empty
recoverAuthenticationPassword recovery_code:string new_password:string new_hint:string = Ok;

//@description Sends Firebase Authentication SMS to the phone number of the user. Works only when the current authorization state is authorizationStateWaitCode and the server returned code of the type authenticationCodeTypeFirebaseAndroid or authenticationCodeTypeFirebaseIos
//@token SafetyNet Attestation API token for the Android application, or secret from push notification for the iOS application
sendAuthenticationFirebaseSms token:string = Ok;

//@description Reports that authentication code wasn't delivered via SMS; for official mobile apps only. Works only when the current authorization state is authorizationStateWaitCode @mobile_network_code Current mobile network code
reportAuthenticationCodeMissing mobile_network_code:string = Ok;

//@description Checks the authentication token of a bot; to log in as a bot. Works only when the current authorization state is authorizationStateWaitPhoneNumber. Can be used instead of setAuthenticationPhoneNumber and checkAuthenticationCode to log in @token The bot token
checkAuthenticationBotToken token:string = Ok;

//@description Closes the TDLib instance after a proper logout. Requires an available network connection. All local data will be destroyed. After the logout completes, updateAuthorizationState with authorizationStateClosed will be sent
logOut = Ok;

//@description Closes the TDLib instance. All databases will be flushed to disk and properly closed. After the close completes, updateAuthorizationState with authorizationStateClosed will be sent. Can be called before initialization
close = Ok;

//@description Closes the TDLib instance, destroying all local data without a proper logout. The current user session will remain in the list of all active sessions. All local data will be destroyed.
//-After the destruction completes updateAuthorizationState with authorizationStateClosed will be sent. Can be called before authorization
destroy = Ok;


//@description Confirms QR code authentication on another device. Returns created session on success @link A link from a QR code. The link must be scanned by the in-app camera
confirmQrCodeAuthentication link:string = Session;


//@description Returns all updates needed to restore current TDLib state, i.e. all actual updateAuthorizationState/updateUser/updateNewChat and others. This is especially useful if TDLib is run in a separate process. Can be called before initialization
getCurrentState = Updates;


//@description Changes the database encryption key. Usually the encryption key is never changed and is stored in some OS keychain @new_encryption_key New encryption key
setDatabaseEncryptionKey new_encryption_key:bytes = Ok;


//@description Returns the current state of 2-step verification
getPasswordState = PasswordState;

//@description Changes the 2-step verification password for the current user. If a new recovery email address is specified, then the change will not be applied until the new recovery email address is confirmed
//@old_password Previous 2-step verification password of the user
//@new_password New 2-step verification password of the user; may be empty to remove the password
//@new_hint New password hint; may be empty
//@set_recovery_email_address Pass true to change also the recovery email address
//@new_recovery_email_address New recovery email address; may be empty
setPassword old_password:string new_password:string new_hint:string set_recovery_email_address:Bool new_recovery_email_address:string = PasswordState;

//@description Changes the login email address of the user. The email address can be changed only if the current user already has login email and passwordState.login_email_address_pattern is non-empty.
//-The change will not be applied until the new login email address is confirmed with checkLoginEmailAddressCode. To use Apple ID/Google ID instead of an email address, call checkLoginEmailAddressCode directly
//@new_login_email_address New login email address
setLoginEmailAddress new_login_email_address:string = EmailAddressAuthenticationCodeInfo;

//@description Resends the login email address verification code
resendLoginEmailAddressCode = EmailAddressAuthenticationCodeInfo;

//@description Checks the login email address authentication @code Email address authentication to check
checkLoginEmailAddressCode code:EmailAddressAuthentication = Ok;

//@description Returns a 2-step verification recovery email address that was previously set up. This method can be used to verify a password provided by the user @password The 2-step verification password for the current user
getRecoveryEmailAddress password:string = RecoveryEmailAddress;

//@description Changes the 2-step verification recovery email address of the user. If a new recovery email address is specified, then the change will not be applied until the new recovery email address is confirmed.
//-If new_recovery_email_address is the same as the email address that is currently set up, this call succeeds immediately and aborts all other requests waiting for an email confirmation
//@password The 2-step verification password of the current user
//@new_recovery_email_address New recovery email address
setRecoveryEmailAddress password:string new_recovery_email_address:string = PasswordState;

//@description Checks the 2-step verification recovery email address verification code @code Verification code to check
checkRecoveryEmailAddressCode code:string = PasswordState;

//@description Resends the 2-step verification recovery email address verification code
resendRecoveryEmailAddressCode = PasswordState;

//@description Cancels verification of the 2-step verification recovery email address
cancelRecoveryEmailAddressVerification = PasswordState;

//@description Requests to send a 2-step verification password recovery code to an email address that was previously set up
requestPasswordRecovery = EmailAddressAuthenticationCodeInfo;

//@description Checks whether a 2-step verification password recovery code sent to an email address is valid @recovery_code Recovery code to check
checkPasswordRecoveryCode recovery_code:string = Ok;

//@description Recovers the 2-step verification password using a recovery code sent to an email address that was previously set up
//@recovery_code Recovery code to check
//@new_password New 2-step verification password of the user; may be empty to remove the password
//@new_hint New password hint; may be empty
recoverPassword recovery_code:string new_password:string new_hint:string = PasswordState;

//@description Removes 2-step verification password without previous password and access to recovery email address. The password can't be reset immediately and the request needs to be repeated after the specified time
resetPassword = ResetPasswordResult;

//@description Cancels reset of 2-step verification password. The method can be called if passwordState.pending_reset_date > 0
cancelPasswordReset = Ok;

//@description Creates a new temporary password for processing payments @password The 2-step verification password of the current user @valid_for Time during which the temporary password will be valid, in seconds; must be between 60 and 86400
createTemporaryPassword password:string valid_for:int32 = TemporaryPasswordState;

//@description Returns information about the current temporary password
getTemporaryPasswordState = TemporaryPasswordState;


//@description Returns the current user
getMe = User;

//@description Returns information about a user by their identifier. This is an offline request if the current user is not a bot @user_id User identifier
getUser user_id:int53 = User;

//@description Returns full information about a user by their identifier @user_id User identifier
getUserFullInfo user_id:int53 = UserFullInfo;

//@description Returns information about a basic group by its identifier. This is an offline request if the current user is not a bot @basic_group_id Basic group identifier
getBasicGroup basic_group_id:int53 = BasicGroup;

//@description Returns full information about a basic group by its identifier @basic_group_id Basic group identifier
getBasicGroupFullInfo basic_group_id:int53 = BasicGroupFullInfo;

//@description Returns information about a supergroup or a channel by its identifier. This is an offline request if the current user is not a bot @supergroup_id Supergroup or channel identifier
getSupergroup supergroup_id:int53 = Supergroup;

//@description Returns full information about a supergroup or a channel by its identifier, cached for up to 1 minute @supergroup_id Supergroup or channel identifier
getSupergroupFullInfo supergroup_id:int53 = SupergroupFullInfo;

//@description Returns information about a secret chat by its identifier. This is an offline request @secret_chat_id Secret chat identifier
getSecretChat secret_chat_id:int32 = SecretChat;

//@description Returns information about a chat by its identifier; this is an offline request if the current user is not a bot @chat_id Chat identifier
getChat chat_id:int53 = Chat;

//@description Returns information about a message @chat_id Identifier of the chat the message belongs to @message_id Identifier of the message to get
getMessage chat_id:int53 message_id:int53 = Message;

//@description Returns information about a message, if it is available without sending network request. This is an offline request @chat_id Identifier of the chat the message belongs to @message_id Identifier of the message to get
getMessageLocally chat_id:int53 message_id:int53 = Message;

//@description Returns information about a non-bundled message that is replied by a given message. Also, returns the pinned message, the game message, the invoice message,
//-the message with a previously set same background, the giveaway message, and the topic creation message for messages of the types
//-messagePinMessage, messageGameScore, messagePaymentSuccessful, messageChatSetBackground, messagePremiumGiveawayCompleted and topic messages without non-bundled replied message respectively
//@chat_id Identifier of the chat the message belongs to
//@message_id Identifier of the reply message
getRepliedMessage chat_id:int53 message_id:int53 = Message;

//@description Returns information about a newest pinned message in the chat @chat_id Identifier of the chat the message belongs to
getChatPinnedMessage chat_id:int53 = Message;

//@description Returns information about a message with the callback button that originated a callback query; for bots only @chat_id Identifier of the chat the message belongs to @message_id Message identifier @callback_query_id Identifier of the callback query
getCallbackQueryMessage chat_id:int53 message_id:int53 callback_query_id:int64 = Message;

//@description Returns information about messages. If a message is not found, returns null on the corresponding position of the result @chat_id Identifier of the chat the messages belong to @message_ids Identifiers of the messages to get
getMessages chat_id:int53 message_ids:vector<int53> = Messages;

//@description Returns information about a message thread. Can be used only if message.can_get_message_thread == true @chat_id Chat identifier @message_id Identifier of the message
getMessageThread chat_id:int53 message_id:int53 = MessageThreadInfo;

//@description Returns read date of a recent outgoing message in a private chat. The method can be called if message.can_get_read_date == true and the message is read
//@chat_id Chat identifier
//@message_id Identifier of the message
getMessageReadDate chat_id:int53 message_id:int53 = MessageReadDate;

//@description Returns viewers of a recent outgoing message in a basic group or a supergroup chat. For video notes and voice notes only users, opened content of the message, are returned. The method can be called if message.can_get_viewers == true
//@chat_id Chat identifier
//@message_id Identifier of the message
getMessageViewers chat_id:int53 message_id:int53 = MessageViewers;

//@description Returns information about a file; this is an offline request @file_id Identifier of the file to get
getFile file_id:int32 = File;

//@description Returns information about a file by its remote identifier; this is an offline request. Can be used to register a URL as a file for further uploading, or sending as a message. Even the request succeeds, the file can be used only if it is still accessible to the user.
//-For example, if the file is from a message, then the message must be not deleted and accessible to the user. If the file database is disabled, then the corresponding object with the file must be preloaded by the application
//@remote_file_id Remote identifier of the file to get
//@file_type File type; pass null if unknown
getRemoteFile remote_file_id:string file_type:FileType = File;

//@description Loads more chats from a chat list. The loaded chats and their positions in the chat list will be sent through updates. Chats are sorted by the pair (chat.position.order, chat.id) in descending order. Returns a 404 error if all chats have been loaded
//@chat_list The chat list in which to load chats; pass null to load chats from the main chat list
//@limit The maximum number of chats to be loaded. For optimal performance, the number of loaded chats is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached
loadChats chat_list:ChatList limit:int32 = Ok;

//@description Returns an ordered list of chats from the beginning of a chat list. For informational purposes only. Use loadChats and updates processing instead to maintain chat lists in a consistent state
//@chat_list The chat list in which to return chats; pass null to get chats from the main chat list
//@limit The maximum number of chats to be returned
getChats chat_list:ChatList limit:int32 = Chats;

//@description Searches a public chat by its username. Currently, only private chats, supergroups and channels can be public. Returns the chat if found; otherwise, an error is returned @username Username to be resolved
searchPublicChat username:string = Chat;

//@description Searches public chats by looking for specified query in their username and title. Currently, only private chats, supergroups and channels can be public. Returns a meaningful number of results.
//-Excludes private chats with contacts and chats from the chat list from the results
//@query Query to search for
searchPublicChats query:string = Chats;

//@description Searches for the specified query in the title and username of already known chats; this is an offline request. Returns chats in the order seen in the main chat list
//@query Query to search for. If the query is empty, returns up to 50 recently found chats
//@limit The maximum number of chats to be returned
searchChats query:string limit:int32 = Chats;

//@description Searches for the specified query in the title and username of already known chats via request to the server. Returns chats in the order seen in the main chat list @query Query to search for @limit The maximum number of chats to be returned
searchChatsOnServer query:string limit:int32 = Chats;

//@description Returns a list of users and location-based supergroups nearby. The list of users nearby will be updated for 60 seconds after the request by the updates updateUsersNearby.
//-The request must be sent again every 25 seconds with adjusted location to not miss new chats
//@location Current user location
searchChatsNearby location:location = ChatsNearby;

//@description Returns a list of channel chats recommended to the current user
getRecommendedChats = Chats;

//@description Returns a list of chats similar to the given chat @chat_id Identifier of the target chat; must be an identifier of a channel chat
getChatSimilarChats chat_id:int53 = Chats;

//@description Returns approximate number of chats similar to the given chat
//@chat_id Identifier of the target chat; must be an identifier of a channel chat
//@return_local Pass true to get the number of chats without sending network requests, or -1 if the number of chats is unknown locally
getChatSimilarChatCount chat_id:int53 return_local:Bool = Count;

//@description Informs TDLib that a chat was opened from the list of similar chats. The method is independent of openChat and closeChat methods
//@chat_id Identifier of the original chat, which similar chats were requested
//@opened_chat_id Identifier of the opened chat
openChatSimilarChat chat_id:int53 opened_chat_id:int53 = Ok;

//@description Returns a list of frequently used chats @category Category of chats to be returned @limit The maximum number of chats to be returned; up to 30
getTopChats category:TopChatCategory limit:int32 = Chats;

//@description Removes a chat from the list of frequently used chats. Supported only if the chat info database is enabled @category Category of frequently used chats @chat_id Chat identifier
removeTopChat category:TopChatCategory chat_id:int53 = Ok;

//@description Searches for the specified query in the title and username of up to 50 recently found chats; this is an offline request
//@query Query to search for
//@limit The maximum number of chats to be returned
searchRecentlyFoundChats query:string limit:int32 = Chats;

//@description Adds a chat to the list of recently found chats. The chat is added to the beginning of the list. If the chat is already in the list, it will be removed from the list first @chat_id Identifier of the chat to add
addRecentlyFoundChat chat_id:int53 = Ok;

//@description Removes a chat from the list of recently found chats @chat_id Identifier of the chat to be removed
removeRecentlyFoundChat chat_id:int53 = Ok;

//@description Clears the list of recently found chats
clearRecentlyFoundChats = Ok;

//@description Returns recently opened chats; this is an offline request. Returns chats in the order of last opening @limit The maximum number of chats to be returned
getRecentlyOpenedChats limit:int32 = Chats;

//@description Checks whether a username can be set for a chat @chat_id Chat identifier; must be identifier of a supergroup chat, or a channel chat, or a private chat with self, or 0 if the chat is being created @username Username to be checked
checkChatUsername chat_id:int53 username:string = CheckChatUsernameResult;

//@description Returns a list of public chats of the specified type, owned by the user @type Type of the public chats to return
getCreatedPublicChats type:PublicChatType = Chats;

//@description Checks whether the maximum number of owned public chats has been reached. Returns corresponding error if the limit was reached. The limit can be increased with Telegram Premium @type Type of the public chats, for which to check the limit
checkCreatedPublicChatsLimit type:PublicChatType = Ok;

//@description Returns a list of basic group and supergroup chats, which can be used as a discussion group for a channel. Returned basic group chats must be first upgraded to supergroups before they can be set as a discussion group.
//-To set a returned supergroup as a discussion group, access to its old messages must be enabled using toggleSupergroupIsAllHistoryAvailable first
getSuitableDiscussionChats = Chats;

//@description Returns a list of recently inactive supergroups and channels. Can be used when user reaches limit on the number of joined supergroups and channels and receives CHANNELS_TOO_MUCH error. Also, the limit can be increased with Telegram Premium
getInactiveSupergroupChats = Chats;

//@description Returns a list of channel chats, which can be used as a personal chat
getSuitablePersonalChats = Chats;


//@description Loads more Saved Messages topics. The loaded topics will be sent through updateSavedMessagesTopic. Topics are sorted by their topic.order in descending order. Returns a 404 error if all topics have been loaded
//@limit The maximum number of topics to be loaded. For optimal performance, the number of loaded topics is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached
loadSavedMessagesTopics limit:int32 = Ok;

//@description Returns messages in a Saved Messages topic. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id)
//@saved_messages_topic_id Identifier of Saved Messages topic which messages will be fetched
//@from_message_id Identifier of the message starting from which messages must be fetched; use 0 to get results from the last message
//@offset Specify 0 to get results from exactly the message from_message_id or a negative offset up to 99 to get additionally some newer messages
//@limit The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than or equal to -offset.
//-For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
getSavedMessagesTopicHistory saved_messages_topic_id:int53 from_message_id:int53 offset:int32 limit:int32 = Messages;

//@description Returns the last message sent in a Saved Messages topic no later than the specified date
//@saved_messages_topic_id Identifier of Saved Messages topic which message will be returned
//@date Point in time (Unix timestamp) relative to which to search for messages
getSavedMessagesTopicMessageByDate saved_messages_topic_id:int53 date:int32 = Message;

//@description Deletes all messages in a Saved Messages topic @saved_messages_topic_id Identifier of Saved Messages topic which messages will be deleted
deleteSavedMessagesTopicHistory saved_messages_topic_id:int53 = Ok;

//@description Deletes all messages between the specified dates in a Saved Messages topic. Messages sent in the last 30 seconds will not be deleted
//@saved_messages_topic_id Identifier of Saved Messages topic which messages will be deleted
//@min_date The minimum date of the messages to delete
//@max_date The maximum date of the messages to delete
deleteSavedMessagesTopicMessagesByDate saved_messages_topic_id:int53 min_date:int32 max_date:int32 = Ok;

//@description Changes the pinned state of a Saved Messages topic. There can be up to getOption("pinned_saved_messages_topic_count_max") pinned topics. The limit can be increased with Telegram Premium
//@saved_messages_topic_id Identifier of Saved Messages topic to pin or unpin
//@is_pinned Pass true to pin the topic; pass false to unpin it
toggleSavedMessagesTopicIsPinned saved_messages_topic_id:int53 is_pinned:Bool = Ok;

//@description Changes the order of pinned Saved Messages topics @saved_messages_topic_ids Identifiers of the new pinned Saved Messages topics
setPinnedSavedMessagesTopics saved_messages_topic_ids:vector<int53> = Ok;


//@description Returns a list of common group chats with a given user. Chats are sorted by their type and creation date
//@user_id User identifier
//@offset_chat_id Chat identifier starting from which to return chats; use 0 for the first request
//@limit The maximum number of chats to be returned; up to 100
getGroupsInCommon user_id:int53 offset_chat_id:int53 limit:int32 = Chats;


//@description Returns messages in a chat. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id).
//-For optimal performance, the number of returned messages is chosen by TDLib. This is an offline request if only_local is true
//@chat_id Chat identifier
//@from_message_id Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
//@offset Specify 0 to get results from exactly the message from_message_id or a negative offset up to 99 to get additionally some newer messages
//@limit The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than or equal to -offset.
//-For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
//@only_local Pass true to get only messages that are available without sending network requests
getChatHistory chat_id:int53 from_message_id:int53 offset:int32 limit:int32 only_local:Bool = Messages;

//@description Returns messages in a message thread of a message. Can be used only if message.can_get_message_thread == true. Message thread of a channel message is in the channel's linked supergroup.
//-The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id). For optimal performance, the number of returned messages is chosen by TDLib
//@chat_id Chat identifier
//@message_id Message identifier, which thread history needs to be returned
//@from_message_id Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
//@offset Specify 0 to get results from exactly the message from_message_id or a negative offset up to 99 to get additionally some newer messages
//@limit The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than or equal to -offset.
//-For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
getMessageThreadHistory chat_id:int53 message_id:int53 from_message_id:int53 offset:int32 limit:int32 = Messages;

//@description Deletes all messages in the chat. Use chat.can_be_deleted_only_for_self and chat.can_be_deleted_for_all_users fields to find whether and how the method can be applied to the chat
//@chat_id Chat identifier
//@remove_from_chat_list Pass true to remove the chat from all chat lists
//@revoke Pass true to delete chat history for all users
deleteChatHistory chat_id:int53 remove_from_chat_list:Bool revoke:Bool = Ok;

//@description Deletes a chat along with all messages in the corresponding chat for all chat members. For group chats this will release the usernames and remove all members.
//-Use the field chat.can_be_deleted_for_all_users to find whether the method can be applied to the chat
//@chat_id Chat identifier
deleteChat chat_id:int53 = Ok;

//@description Searches for messages with given words in the chat. Returns the results in reverse chronological order, i.e. in order of decreasing message_id. Cannot be used in secret chats with a non-empty query
//-(searchSecretMessages must be used instead), or without an enabled message database. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
//-A combination of query, sender_id, filter and message_thread_id search criteria is expected to be supported, only if it is required for Telegram official application implementation
//@chat_id Identifier of the chat in which to search messages
//@query Query to search for
//@sender_id Identifier of the sender of messages to search for; pass null to search for messages from any sender. Not supported in secret chats
//@from_message_id Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
//@offset Specify 0 to get results from exactly the message from_message_id or a negative offset to get the specified message and some newer messages
//@limit The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than -offset.
//-For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
//@filter Additional filter for messages to search; pass null to search for all messages
//@message_thread_id If not 0, only messages in the specified thread will be returned; supergroups only
//@saved_messages_topic_id If not 0, only messages in the specified Saved Messages topic will be returned; pass 0 to return all messages, or for chats other than Saved Messages
searchChatMessages chat_id:int53 query:string sender_id:MessageSender from_message_id:int53 offset:int32 limit:int32 filter:SearchMessagesFilter message_thread_id:int53 saved_messages_topic_id:int53 = FoundChatMessages;

//@description Searches for messages in all chats except secret chats. Returns the results in reverse chronological order (i.e., in order of decreasing (date, chat_id, message_id)).
//-For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
//@chat_list Chat list in which to search messages; pass null to search in all chats regardless of their chat list. Only Main and Archive chat lists are supported
//@only_in_channels Pass true to search only for messages in channels
//@query Query to search for
//@offset Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
//@limit The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
//@filter Additional filter for messages to search; pass null to search for all messages. Filters searchMessagesFilterMention, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction, searchMessagesFilterFailedToSend, and searchMessagesFilterPinned are unsupported in this function
//@min_date If not 0, the minimum date of the messages to return
//@max_date If not 0, the maximum date of the messages to return
searchMessages chat_list:ChatList only_in_channels:Bool query:string offset:string limit:int32 filter:SearchMessagesFilter min_date:int32 max_date:int32 = FoundMessages;

//@description Searches for messages in secret chats. Returns the results in reverse chronological order. For optimal performance, the number of returned messages is chosen by TDLib
//@chat_id Identifier of the chat in which to search. Specify 0 to search in all secret chats
//@query Query to search for. If empty, searchChatMessages must be used instead
//@offset Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
//@limit The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
//@filter Additional filter for messages to search; pass null to search for all messages
searchSecretMessages chat_id:int53 query:string offset:string limit:int32 filter:SearchMessagesFilter = FoundMessages;

//@description Searches for messages tagged by the given reaction and with the given words in the Saved Messages chat; for Telegram Premium users only.
//-Returns the results in reverse chronological order, i.e. in order of decreasing message_id
//-For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
//@saved_messages_topic_id If not 0, only messages in the specified Saved Messages topic will be considered; pass 0 to consider all messages
//@tag Tag to search for; pass null to return all suitable messages
//@query Query to search for
//@from_message_id Identifier of the message starting from which messages must be fetched; use 0 to get results from the last message
//@offset Specify 0 to get results from exactly the message from_message_id or a negative offset to get the specified message and some newer messages
//@limit The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than -offset.
//-For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
searchSavedMessages saved_messages_topic_id:int53 tag:ReactionType query:string from_message_id:int53 offset:int32 limit:int32 = FoundChatMessages;

//@description Searches for call messages. Returns the results in reverse chronological order (i.e., in order of decreasing message_id). For optimal performance, the number of returned messages is chosen by TDLib
//@offset Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
//@limit The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
//@only_missed Pass true to search only for messages with missed/declined calls
searchCallMessages offset:string limit:int32 only_missed:Bool = FoundMessages;

//@description Searches for outgoing messages with content of the type messageDocument in all chats except secret chats. Returns the results in reverse chronological order
//@query Query to search for in document file name and message caption
//@limit The maximum number of messages to be returned; up to 100
searchOutgoingDocumentMessages query:string limit:int32 = FoundMessages;

//@description Deletes all call messages @revoke Pass true to delete the messages for all users
deleteAllCallMessages revoke:Bool = Ok;

//@description Returns information about the recent locations of chat members that were sent to the chat. Returns up to 1 location message per user @chat_id Chat identifier @limit The maximum number of messages to be returned
searchChatRecentLocationMessages chat_id:int53 limit:int32 = Messages;

//@description Returns all active live locations that need to be updated by the application. The list is persistent across application restarts only if the message database is used
getActiveLiveLocationMessages = Messages;

//@description Returns the last message sent in a chat no later than the specified date @chat_id Chat identifier @date Point in time (Unix timestamp) relative to which to search for messages
getChatMessageByDate chat_id:int53 date:int32 = Message;

//@description Returns sparse positions of messages of the specified type in the chat to be used for shared media scroll implementation. Returns the results in reverse chronological order (i.e., in order of decreasing message_id).
//-Cannot be used in secret chats or with searchMessagesFilterFailedToSend filter without an enabled message database
//@chat_id Identifier of the chat in which to return information about message positions
//@filter Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterMention, searchMessagesFilterUnreadMention, and searchMessagesFilterUnreadReaction are unsupported in this function
//@from_message_id The message identifier from which to return information about message positions
//@limit The expected number of message positions to be returned; 50-2000. A smaller number of positions can be returned, if there are not enough appropriate messages
//@saved_messages_topic_id If not 0, only messages in the specified Saved Messages topic will be considered; pass 0 to consider all messages, or for chats other than Saved Messages
getChatSparseMessagePositions chat_id:int53 filter:SearchMessagesFilter from_message_id:int53 limit:int32 saved_messages_topic_id:int53 = MessagePositions;

//@description Returns information about the next messages of the specified type in the chat split by days. Returns the results in reverse chronological order. Can return partial result for the last returned day. Behavior of this method depends on the value of the option "utc_time_offset"
//@chat_id Identifier of the chat in which to return information about messages
//@filter Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterMention, searchMessagesFilterUnreadMention, and searchMessagesFilterUnreadReaction are unsupported in this function
//@from_message_id The message identifier from which to return information about messages; use 0 to get results from the last message
//@saved_messages_topic_id If not0, only messages in the specified Saved Messages topic will be considered; pass 0 to consider all messages, or for chats other than Saved Messages
getChatMessageCalendar chat_id:int53 filter:SearchMessagesFilter from_message_id:int53 saved_messages_topic_id:int53 = MessageCalendar;

//@description Returns approximate number of messages of the specified type in the chat
//@chat_id Identifier of the chat in which to count messages
//@filter Filter for message content; searchMessagesFilterEmpty is unsupported in this function
//@saved_messages_topic_id If not 0, only messages in the specified Saved Messages topic will be counted; pass 0 to count all messages, or for chats other than Saved Messages
//@return_local Pass true to get the number of messages without sending network requests, or -1 if the number of messages is unknown locally
getChatMessageCount chat_id:int53 filter:SearchMessagesFilter saved_messages_topic_id:int53 return_local:Bool = Count;

//@description Returns approximate 1-based position of a message among messages, which can be found by the specified filter in the chat. Cannot be used in secret chats
//@chat_id Identifier of the chat in which to find message position
//@message_id Message identifier
//@filter Filter for message content; searchMessagesFilterEmpty, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction, and searchMessagesFilterFailedToSend are unsupported in this function
//@message_thread_id If not 0, only messages in the specified thread will be considered; supergroups only
//@saved_messages_topic_id If not 0, only messages in the specified Saved Messages topic will be considered; pass 0 to consider all relevant messages, or for chats other than Saved Messages
getChatMessagePosition chat_id:int53 message_id:int53 filter:SearchMessagesFilter message_thread_id:int53 saved_messages_topic_id:int53 = Count;

//@description Returns all scheduled messages in a chat. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id) @chat_id Chat identifier
getChatScheduledMessages chat_id:int53 = Messages;

//@description Returns sponsored messages to be shown in a chat; for channel chats only @chat_id Identifier of the chat
getChatSponsoredMessages chat_id:int53 = SponsoredMessages;

//@description Informs TDLib that the user opened the sponsored chat via the button, the name, the photo, or a mention in the sponsored message
//@chat_id Chat identifier of the sponsored message
//@message_id Identifier of the sponsored message
clickChatSponsoredMessage chat_id:int53 message_id:int53 = Ok;

//@description Reports a sponsored message to Telegram moderators
//@chat_id Chat identifier of the sponsored message
//@message_id Identifier of the sponsored message
//@option_id Option identifier chosen by the user; leave empty for the initial request
reportChatSponsoredMessage chat_id:int53 message_id:int53 option_id:bytes = ReportChatSponsoredMessageResult;


//@description Removes an active notification from notification list. Needs to be called only if the notification is removed by the current user @notification_group_id Identifier of notification group to which the notification belongs @notification_id Identifier of removed notification
removeNotification notification_group_id:int32 notification_id:int32 = Ok;

//@description Removes a group of active notifications. Needs to be called only if the notification group is removed by the current user @notification_group_id Notification group identifier @max_notification_id The maximum identifier of removed notifications
removeNotificationGroup notification_group_id:int32 max_notification_id:int32 = Ok;


//@description Returns an HTTPS link to a message in a chat. Available only for already sent messages in supergroups and channels, or if message.can_get_media_timestamp_links and a media timestamp link is generated. This is an offline request
//@chat_id Identifier of the chat to which the message belongs
//@message_id Identifier of the message
//@media_timestamp If not 0, timestamp from which the video/audio/video note/voice note/story playing must start, in seconds. The media can be in the message content or in its web page preview
//@for_album Pass true to create a link for the whole media album
//@in_message_thread Pass true to create a link to the message as a channel post comment, in a message thread, or a forum topic
getMessageLink chat_id:int53 message_id:int53 media_timestamp:int32 for_album:Bool in_message_thread:Bool = MessageLink;

//@description Returns an HTML code for embedding the message. Available only for messages in supergroups and channels with a username
//@chat_id Identifier of the chat to which the message belongs
//@message_id Identifier of the message
//@for_album Pass true to return an HTML code for embedding of the whole media album
getMessageEmbeddingCode chat_id:int53 message_id:int53 for_album:Bool = Text;

//@description Returns information about a public or private message link. Can be called for any internal link of the type internalLinkTypeMessage @url The message link
getMessageLinkInfo url:string = MessageLinkInfo;


//@description Translates a text to the given language. If the current user is a Telegram Premium user, then text formatting is preserved
//@text Text to translate
//@to_language_code Language code of the language to which the message is translated. Must be one of
//-"af", "sq", "am", "ar", "hy", "az", "eu", "be", "bn", "bs", "bg", "ca", "ceb", "zh-CN", "zh", "zh-Hans", "zh-TW", "zh-Hant", "co", "hr", "cs", "da", "nl", "en", "eo", "et",
//-"fi", "fr", "fy", "gl", "ka", "de", "el", "gu", "ht", "ha", "haw", "he", "iw", "hi", "hmn", "hu", "is", "ig", "id", "in", "ga", "it", "ja", "jv", "kn", "kk", "km", "rw", "ko",
//-"ku", "ky", "lo", "la", "lv", "lt", "lb", "mk", "mg", "ms", "ml", "mt", "mi", "mr", "mn", "my", "ne", "no", "ny", "or", "ps", "fa", "pl", "pt", "pa", "ro", "ru", "sm", "gd", "sr",
//-"st", "sn", "sd", "si", "sk", "sl", "so", "es", "su", "sw", "sv", "tl", "tg", "ta", "tt", "te", "th", "tr", "tk", "uk", "ur", "ug", "uz", "vi", "cy", "xh", "yi", "ji", "yo", "zu"
translateText text:formattedText to_language_code:string = FormattedText;

//@description Extracts text or caption of the given message and translates it to the given language. If the current user is a Telegram Premium user, then text formatting is preserved
//@chat_id Identifier of the chat to which the message belongs
//@message_id Identifier of the message
//@to_language_code Language code of the language to which the message is translated. Must be one of
//-"af", "sq", "am", "ar", "hy", "az", "eu", "be", "bn", "bs", "bg", "ca", "ceb", "zh-CN", "zh", "zh-Hans", "zh-TW", "zh-Hant", "co", "hr", "cs", "da", "nl", "en", "eo", "et",
//-"fi", "fr", "fy", "gl", "ka", "de", "el", "gu", "ht", "ha", "haw", "he", "iw", "hi", "hmn", "hu", "is", "ig", "id", "in", "ga", "it", "ja", "jv", "kn", "kk", "km", "rw", "ko",
//-"ku", "ky", "lo", "la", "lv", "lt", "lb", "mk", "mg", "ms", "ml", "mt", "mi", "mr", "mn", "my", "ne", "no", "ny", "or", "ps", "fa", "pl", "pt", "pa", "ro", "ru", "sm", "gd", "sr",
//-"st", "sn", "sd", "si", "sk", "sl", "so", "es", "su", "sw", "sv", "tl", "tg", "ta", "tt", "te", "th", "tr", "tk", "uk", "ur", "ug", "uz", "vi", "cy", "xh", "yi", "ji", "yo", "zu"
translateMessageText chat_id:int53 message_id:int53 to_language_code:string = FormattedText;

//@description Recognizes speech in a video note or a voice note message. The message must be successfully sent, must not be scheduled, and must be from a non-secret chat
//@chat_id Identifier of the chat to which the message belongs
//@message_id Identifier of the message
recognizeSpeech chat_id:int53 message_id:int53 = Ok;

//@description Rates recognized speech in a video note or a voice note message @chat_id Identifier of the chat to which the message belongs @message_id Identifier of the message @is_good Pass true if the speech recognition is good
rateSpeechRecognition chat_id:int53 message_id:int53 is_good:Bool = Ok;


//@description Returns the list of message sender identifiers, which can be used to send messages in a chat @chat_id Chat identifier
getChatAvailableMessageSenders chat_id:int53 = ChatMessageSenders;

//@description Selects a message sender to send messages in a chat @chat_id Chat identifier @message_sender_id New message sender for the chat
setChatMessageSender chat_id:int53 message_sender_id:MessageSender = Ok;

//@description Sends a message. Returns the sent message
//@chat_id Target chat
//@message_thread_id If not 0, the message thread identifier in which the message will be sent
//@reply_to Information about the message or story to be replied; pass null if none
//@options Options to be used to send the message; pass null to use default options
//@reply_markup Markup for replying to the message; pass null if none; for bots only
//@input_message_content The content of the message to be sent
sendMessage chat_id:int53 message_thread_id:int53 reply_to:InputMessageReplyTo options:messageSendOptions reply_markup:ReplyMarkup input_message_content:InputMessageContent = Message;

//@description Sends 2-10 messages grouped together into an album. Currently, only audio, document, photo and video messages can be grouped into an album.
//-Documents and audio files can be only grouped in an album with messages of the same type. Returns sent messages
//@chat_id Target chat
//@message_thread_id If not 0, the message thread identifier in which the messages will be sent
//@reply_to Information about the message or story to be replied; pass null if none
//@options Options to be used to send the messages; pass null to use default options
//@input_message_contents Contents of messages to be sent. At most 10 messages can be added to an album
sendMessageAlbum chat_id:int53 message_thread_id:int53 reply_to:InputMessageReplyTo options:messageSendOptions input_message_contents:vector<InputMessageContent> = Messages;

//@description Invites a bot to a chat (if it is not yet a member) and sends it the /start command; requires can_invite_users member right. Bots can't be invited to a private chat other than the chat with the bot.
//-Bots can't be invited to channels (although they can be added as admins) and secret chats. Returns the sent message
//@bot_user_id Identifier of the bot
//@chat_id Identifier of the target chat
//@parameter A hidden parameter sent to the bot for deep linking purposes (https://core.telegram.org/bots#deep-linking)
sendBotStartMessage bot_user_id:int53 chat_id:int53 parameter:string = Message;

//@description Sends the result of an inline query as a message. Returns the sent message. Always clears a chat draft message
//@chat_id Target chat
//@message_thread_id If not 0, the message thread identifier in which the message will be sent
//@reply_to Information about the message or story to be replied; pass null if none
//@options Options to be used to send the message; pass null to use default options
//@query_id Identifier of the inline query
//@result_id Identifier of the inline query result
//@hide_via_bot Pass true to hide the bot, via which the message is sent. Can be used only for bots getOption("animation_search_bot_username"), getOption("photo_search_bot_username"), and getOption("venue_search_bot_username")
sendInlineQueryResultMessage chat_id:int53 message_thread_id:int53 reply_to:InputMessageReplyTo options:messageSendOptions query_id:int64 result_id:string hide_via_bot:Bool = Message;

//@description Forwards previously sent messages. Returns the forwarded messages in the same order as the message identifiers passed in message_ids. If a message can't be forwarded, null will be returned instead of the message
//@chat_id Identifier of the chat to which to forward messages
//@message_thread_id If not 0, the message thread identifier in which the message will be sent; for forum threads only
//@from_chat_id Identifier of the chat from which to forward messages
//@message_ids Identifiers of the messages to forward. Message identifiers must be in a strictly increasing order. At most 100 messages can be forwarded simultaneously. A message can be forwarded only if message.can_be_forwarded
//@options Options to be used to send the messages; pass null to use default options
//@send_copy Pass true to copy content of the messages without reference to the original sender. Always true if the messages are forwarded to a secret chat or are local
//@remove_caption Pass true to remove media captions of message copies. Ignored if send_copy is false
forwardMessages chat_id:int53 message_thread_id:int53 from_chat_id:int53 message_ids:vector<int53> options:messageSendOptions send_copy:Bool remove_caption:Bool = Messages;

//@description Sends messages from a quick reply shortcut. Requires Telegram Business subscription
//@chat_id Identifier of the chat to which to send messages. The chat must be a private chat with a regular user
//@shortcut_id Unique identifier of the quick reply shortcut
//@sending_id Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates
sendQuickReplyShortcutMessages chat_id:int53 shortcut_id:int32 sending_id:int32 = Messages;

//@description Resends messages which failed to send. Can be called only for messages for which messageSendingStateFailed.can_retry is true and after specified in messageSendingStateFailed.retry_after time passed.
//-If a message is re-sent, the corresponding failed to send message is deleted. Returns the sent messages in the same order as the message identifiers passed in message_ids. If a message can't be re-sent, null will be returned instead of the message
//@chat_id Identifier of the chat to send messages
//@message_ids Identifiers of the messages to resend. Message identifiers must be in a strictly increasing order
//@quote New manually chosen quote from the message to be replied; pass null if none. Ignored if more than one message is re-sent, or if messageSendingStateFailed.need_another_reply_quote == false
resendMessages chat_id:int53 message_ids:vector<int53> quote:inputTextQuote = Messages;

//@description Adds a local message to a chat. The message is persistent across application restarts only if the message database is used. Returns the added message
//@chat_id Target chat
//@sender_id Identifier of the sender of the message
//@reply_to Information about the message or story to be replied; pass null if none
//@disable_notification Pass true to disable notification for the message
//@input_message_content The content of the message to be added
addLocalMessage chat_id:int53 sender_id:MessageSender reply_to:InputMessageReplyTo disable_notification:Bool input_message_content:InputMessageContent = Message;

//@description Deletes messages @chat_id Chat identifier @message_ids Identifiers of the messages to be deleted @revoke Pass true to delete messages for all chat members. Always true for supergroups, channels and secret chats
deleteMessages chat_id:int53 message_ids:vector<int53> revoke:Bool = Ok;

//@description Deletes all messages sent by the specified message sender in a chat. Supported only for supergroups; requires can_delete_messages administrator privileges @chat_id Chat identifier @sender_id Identifier of the sender of messages to delete
deleteChatMessagesBySender chat_id:int53 sender_id:MessageSender = Ok;

//@description Deletes all messages between the specified dates in a chat. Supported only for private chats and basic groups. Messages sent in the last 30 seconds will not be deleted
//@chat_id Chat identifier
//@min_date The minimum date of the messages to delete
//@max_date The maximum date of the messages to delete
//@revoke Pass true to delete chat messages for all users; private chats only
deleteChatMessagesByDate chat_id:int53 min_date:int32 max_date:int32 revoke:Bool = Ok;


//@description Edits the text of a message (or a text of a game message). Returns the edited message after the edit is completed on the server side
//@chat_id The chat the message belongs to
//@message_id Identifier of the message
//@reply_markup The new message reply markup; pass null if none; for bots only
//@input_message_content New text content of the message. Must be of type inputMessageText
editMessageText chat_id:int53 message_id:int53 reply_markup:ReplyMarkup input_message_content:InputMessageContent = Message;

//@description Edits the message content of a live location. Messages can be edited for a limited period of time specified in the live location. Returns the edited message after the edit is completed on the server side
//@chat_id The chat the message belongs to
//@message_id Identifier of the message
//@reply_markup The new message reply markup; pass null if none; for bots only
//@location New location content of the message; pass null to stop sharing the live location
//@live_period New time relative to the message send date, for which the location can be updated, in seconds. If 0x7FFFFFFF specified, then the location can be updated forever.
//-Otherwise, must not exceed the current live_period by more than a day, and the live location expiration date must remain in the next 90 days. Pass 0 to keep the current live_period
//@heading The new direction in which the location moves, in degrees; 1-360. Pass 0 if unknown
//@proximity_alert_radius The new maximum distance for proximity alerts, in meters (0-100000). Pass 0 if the notification is disabled
editMessageLiveLocation chat_id:int53 message_id:int53 reply_markup:ReplyMarkup location:location live_period:int32 heading:int32 proximity_alert_radius:int32 = Message;

//@description Edits the content of a message with an animation, an audio, a document, a photo or a video, including message caption. If only the caption needs to be edited, use editMessageCaption instead.
//-The media can't be edited if the message was set to self-destruct or to a self-destructing media. The type of message content in an album can't be changed with exception of replacing a photo with a video or vice versa. Returns the edited message after the edit is completed on the server side
//@chat_id The chat the message belongs to
//@message_id Identifier of the message
//@reply_markup The new message reply markup; pass null if none; for bots only
//@input_message_content New content of the message. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto or inputMessageVideo
editMessageMedia chat_id:int53 message_id:int53 reply_markup:ReplyMarkup input_message_content:InputMessageContent = Message;

//@description Edits the message content caption. Returns the edited message after the edit is completed on the server side
//@chat_id The chat the message belongs to
//@message_id Identifier of the message
//@reply_markup The new message reply markup; pass null if none; for bots only
//@caption New message content caption; 0-getOption("message_caption_length_max") characters; pass null to remove caption
editMessageCaption chat_id:int53 message_id:int53 reply_markup:ReplyMarkup caption:formattedText = Message;

//@description Edits the message reply markup; for bots only. Returns the edited message after the edit is completed on the server side
//@chat_id The chat the message belongs to
//@message_id Identifier of the message
//@reply_markup The new message reply markup; pass null if none
editMessageReplyMarkup chat_id:int53 message_id:int53 reply_markup:ReplyMarkup = Message;

//@description Edits the text of an inline text or game message sent via a bot; for bots only
//@inline_message_id Inline message identifier
//@reply_markup The new message reply markup; pass null if none
//@input_message_content New text content of the message. Must be of type inputMessageText
editInlineMessageText inline_message_id:string reply_markup:ReplyMarkup input_message_content:InputMessageContent = Ok;

//@description Edits the content of a live location in an inline message sent via a bot; for bots only
//@inline_message_id Inline message identifier
//@reply_markup The new message reply markup; pass null if none
//@location New location content of the message; pass null to stop sharing the live location
//@live_period New time relative to the message send date, for which the location can be updated, in seconds. If 0x7FFFFFFF specified, then the location can be updated forever.
//-Otherwise, must not exceed the current live_period by more than a day, and the live location expiration date must remain in the next 90 days. Pass 0 to keep the current live_period
//@heading The new direction in which the location moves, in degrees; 1-360. Pass 0 if unknown
//@proximity_alert_radius The new maximum distance for proximity alerts, in meters (0-100000). Pass 0 if the notification is disabled
editInlineMessageLiveLocation inline_message_id:string reply_markup:ReplyMarkup location:location live_period:int32 heading:int32 proximity_alert_radius:int32 = Ok;

//@description Edits the content of a message with an animation, an audio, a document, a photo or a video in an inline message sent via a bot; for bots only
//@inline_message_id Inline message identifier
//@reply_markup The new message reply markup; pass null if none; for bots only
//@input_message_content New content of the message. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto or inputMessageVideo
editInlineMessageMedia inline_message_id:string reply_markup:ReplyMarkup input_message_content:InputMessageContent = Ok;

//@description Edits the caption of an inline message sent via a bot; for bots only
//@inline_message_id Inline message identifier
//@reply_markup The new message reply markup; pass null if none
//@caption New message content caption; pass null to remove caption; 0-getOption("message_caption_length_max") characters
editInlineMessageCaption inline_message_id:string reply_markup:ReplyMarkup caption:formattedText = Ok;

//@description Edits the reply markup of an inline message sent via a bot; for bots only
//@inline_message_id Inline message identifier
//@reply_markup The new message reply markup; pass null if none
editInlineMessageReplyMarkup inline_message_id:string reply_markup:ReplyMarkup = Ok;

//@description Edits the time when a scheduled message will be sent. Scheduling state of all messages in the same album or forwarded together with the message will be also changed
//@chat_id The chat the message belongs to
//@message_id Identifier of the message
//@scheduling_state The new message scheduling state; pass null to send the message immediately
editMessageSchedulingState chat_id:int53 message_id:int53 scheduling_state:MessageSchedulingState = Ok;


//@description Sends a message on behalf of a business account; for bots only. Returns the message after it was sent
//@business_connection_id Unique identifier of business connection on behalf of which to send the request
//@chat_id Target chat
//@reply_to Information about the message to be replied; pass null if none
//@disable_notification Pass true to disable notification for the message
//@protect_content Pass true if the content of the message must be protected from forwarding and saving
//@reply_markup Markup for replying to the message; pass null if none
//@input_message_content The content of the message to be sent
sendBusinessMessage business_connection_id:string chat_id:int53 reply_to:InputMessageReplyTo disable_notification:Bool protect_content:Bool reply_markup:ReplyMarkup input_message_content:InputMessageContent = BusinessMessage;

//@description Sends 2-10 messages grouped together into an album on behalf of a business account; for bots only. Currently, only audio, document, photo and video messages can be grouped into an album.
//-Documents and audio files can be only grouped in an album with messages of the same type. Returns sent messages
//@business_connection_id Unique identifier of business connection on behalf of which to send the request
//@chat_id Target chat
//@reply_to Information about the message to be replied; pass null if none
//@disable_notification Pass true to disable notification for the message
//@protect_content Pass true if the content of the message must be protected from forwarding and saving
//@input_message_contents Contents of messages to be sent. At most 10 messages can be added to an album
sendBusinessMessageAlbum business_connection_id:string chat_id:int53 reply_to:InputMessageReplyTo disable_notification:Bool protect_content:Bool input_message_contents:vector<InputMessageContent> = BusinessMessages;


//@description Checks validness of a name for a quick reply shortcut. Can be called synchronously @name The name of the shortcut; 1-32 characters
checkQuickReplyShortcutName name:string = Ok;

//@description Loads quick reply shortcuts created by the current user. The loaded topics will be sent through updateQuickReplyShortcuts
loadQuickReplyShortcuts = Ok;

//@description Changes name of a quick reply shortcut @shortcut_id Unique identifier of the quick reply shortcut @name New name for the shortcut. Use checkQuickReplyShortcutName to check its validness
setQuickReplyShortcutName shortcut_id:int32 name:string = Ok;

//@description Deletes a quick reply shortcut @shortcut_id Unique identifier of the quick reply shortcut
deleteQuickReplyShortcut shortcut_id:int32 = Ok;

//@description Changes the order of quick reply shortcuts @shortcut_ids The new order of quick reply shortcuts
reorderQuickReplyShortcuts shortcut_ids:vector<int32> = Ok;

//@description Loads quick reply messages that can be sent by a given quick reply shortcut. The loaded messages will be sent through updateQuickReplyShortcutMessages
//@shortcut_id Unique identifier of the quick reply shortcut
loadQuickReplyShortcutMessages shortcut_id:int32 = Ok;

//@description Deletes specified quick reply messages
//@shortcut_id Unique identifier of the quick reply shortcut to which the messages belong
//@message_ids Unique identifiers of the messages
deleteQuickReplyShortcutMessages shortcut_id:int32 message_ids:vector<int53> = Ok;

//@description Adds a message to a quick reply shortcut. If shortcut doesn't exist and there are less than getOption("quick_reply_shortcut_count_max") shortcuts, then a new shortcut is created.
//-The shortcut must not contain more than getOption("quick_reply_shortcut_message_count_max") messages after adding the new message. Returns the added message
//@shortcut_name Name of the target shortcut
//@reply_to_message_id Identifier of a quick reply message in the same shortcut to be replied; pass 0 if none
//@input_message_content The content of the message to be added; inputMessagePoll, inputMessageForwarded and inputMessageLocation with live_period aren't supported
addQuickReplyShortcutMessage shortcut_name:string reply_to_message_id:int53 input_message_content:InputMessageContent = QuickReplyMessage;

//@description Adds a message to a quick reply shortcut via inline bot. If shortcut doesn't exist and there are less than getOption("quick_reply_shortcut_count_max") shortcuts, then a new shortcut is created.
//-The shortcut must not contain more than getOption("quick_reply_shortcut_message_count_max") messages after adding the new message. Returns the added message
//@shortcut_name Name of the target shortcut
//@reply_to_message_id Identifier of a quick reply message in the same shortcut to be replied; pass 0 if none
//@query_id Identifier of the inline query
//@result_id Identifier of the inline query result
//@hide_via_bot Pass true to hide the bot, via which the message is sent. Can be used only for bots getOption("animation_search_bot_username"), getOption("photo_search_bot_username"), and getOption("venue_search_bot_username")
addQuickReplyShortcutInlineQueryResultMessage shortcut_name:string reply_to_message_id:int53 query_id:int64 result_id:string hide_via_bot:Bool = QuickReplyMessage;

//@description Adds 2-10 messages grouped together into an album to a quick reply shortcut. Currently, only audio, document, photo and video messages can be grouped into an album.
//-Documents and audio files can be only grouped in an album with messages of the same type. Returns sent messages
//@shortcut_name Name of the target shortcut
//@reply_to_message_id Identifier of a quick reply message in the same shortcut to be replied; pass 0 if none
//@input_message_contents Contents of messages to be sent. At most 10 messages can be added to an album
addQuickReplyShortcutMessageAlbum shortcut_name:string reply_to_message_id:int53 input_message_contents:vector<InputMessageContent> = QuickReplyMessages;

//@description Readds quick reply messages which failed to add. Can be called only for messages for which messageSendingStateFailed.can_retry is true and after specified in messageSendingStateFailed.retry_after time passed.
//-If a message is readded, the corresponding failed to send message is deleted. Returns the sent messages in the same order as the message identifiers passed in message_ids. If a message can't be readded, null will be returned instead of the message
//@shortcut_name Name of the target shortcut
//@message_ids Identifiers of the quick reply messages to readd. Message identifiers must be in a strictly increasing order
readdQuickReplyShortcutMessages shortcut_name:string message_ids:vector<int53> = QuickReplyMessages;

//@description Asynchronously edits the text, media or caption of a quick reply message. Use quickReplyMessage.can_be_edited to check whether a message can be edited.
//-Text message can be edited only to a text message. The type of message content in an album can't be changed with exception of replacing a photo with a video or vice versa
//@shortcut_id Unique identifier of the quick reply shortcut with the message
//@message_id Identifier of the message
//@input_message_content New content of the message. Must be one of the following types: inputMessageText, inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto or inputMessageVideo
editQuickReplyMessage shortcut_id:int32 message_id:int53 input_message_content:InputMessageContent = Ok;


//@description Returns the list of custom emojis, which can be used as forum topic icon by all users
getForumTopicDefaultIcons = Stickers;

//@description Creates a topic in a forum supergroup chat; requires can_manage_topics administrator or can_create_topics member right in the supergroup
//@chat_id Identifier of the chat
//@name Name of the topic; 1-128 characters
//@icon Icon of the topic. Icon color must be one of 0x6FB9F0, 0xFFD67E, 0xCB86DB, 0x8EEE98, 0xFF93B2, or 0xFB6F5F. Telegram Premium users can use any custom emoji as topic icon, other users can use only a custom emoji returned by getForumTopicDefaultIcons
createForumTopic chat_id:int53 name:string icon:forumTopicIcon = ForumTopicInfo;

//@description Edits title and icon of a topic in a forum supergroup chat; requires can_manage_topics right in the supergroup unless the user is creator of the topic
//@chat_id Identifier of the chat
//@message_thread_id Message thread identifier of the forum topic
//@name New name of the topic; 0-128 characters. If empty, the previous topic name is kept
//@edit_icon_custom_emoji Pass true to edit the icon of the topic. Icon of the General topic can't be edited
//@icon_custom_emoji_id Identifier of the new custom emoji for topic icon; pass 0 to remove the custom emoji. Ignored if edit_icon_custom_emoji is false. Telegram Premium users can use any custom emoji, other users can use only a custom emoji returned by getForumTopicDefaultIcons
editForumTopic chat_id:int53 message_thread_id:int53 name:string edit_icon_custom_emoji:Bool icon_custom_emoji_id:int64 = Ok;

//@description Returns information about a forum topic @chat_id Identifier of the chat @message_thread_id Message thread identifier of the forum topic
getForumTopic chat_id:int53 message_thread_id:int53 = ForumTopic;

//@description Returns an HTTPS link to a topic in a forum chat. This is an offline request @chat_id Identifier of the chat @message_thread_id Message thread identifier of the forum topic
getForumTopicLink chat_id:int53 message_thread_id:int53 = MessageLink;

//@description Returns found forum topics in a forum chat. This is a temporary method for getting information about topic list from the server
//@chat_id Identifier of the forum chat
//@query Query to search for in the forum topic's name
//@offset_date The date starting from which the results need to be fetched. Use 0 or any date in the future to get results from the last topic
//@offset_message_id The message identifier of the last message in the last found topic, or 0 for the first request
//@offset_message_thread_id The message thread identifier of the last found topic, or 0 for the first request
//@limit The maximum number of forum topics to be returned; up to 100. For optimal performance, the number of returned forum topics is chosen by TDLib and can be smaller than the specified limit
getForumTopics chat_id:int53 query:string offset_date:int32 offset_message_id:int53 offset_message_thread_id:int53 limit:int32 = ForumTopics;

//@description Changes the notification settings of a forum topic
//@chat_id Chat identifier
//@message_thread_id Message thread identifier of the forum topic
//@notification_settings New notification settings for the forum topic. If the topic is muted for more than 366 days, it is considered to be muted forever
setForumTopicNotificationSettings chat_id:int53 message_thread_id:int53 notification_settings:chatNotificationSettings = Ok;

//@description Toggles whether a topic is closed in a forum supergroup chat; requires can_manage_topics right in the supergroup unless the user is creator of the topic
//@chat_id Identifier of the chat
//@message_thread_id Message thread identifier of the forum topic
//@is_closed Pass true to close the topic; pass false to reopen it
toggleForumTopicIsClosed chat_id:int53 message_thread_id:int53 is_closed:Bool = Ok;

//@description Toggles whether a General topic is hidden in a forum supergroup chat; requires can_manage_topics right in the supergroup
//@chat_id Identifier of the chat
//@is_hidden Pass true to hide and close the General topic; pass false to unhide it
toggleGeneralForumTopicIsHidden chat_id:int53 is_hidden:Bool = Ok;

//@description Changes the pinned state of a forum topic; requires can_manage_topics right in the supergroup. There can be up to getOption("pinned_forum_topic_count_max") pinned forum topics
//@chat_id Chat identifier
//@message_thread_id Message thread identifier of the forum topic
//@is_pinned Pass true to pin the topic; pass false to unpin it
toggleForumTopicIsPinned chat_id:int53 message_thread_id:int53 is_pinned:Bool = Ok;

//@description Changes the order of pinned forum topics; requires can_manage_topics right in the supergroup @chat_id Chat identifier @message_thread_ids The new list of pinned forum topics
setPinnedForumTopics chat_id:int53 message_thread_ids:vector<int53> = Ok;

//@description Deletes all messages in a forum topic; requires can_delete_messages administrator right in the supergroup unless the user is creator of the topic, the topic has no messages from other users and has at most 11 messages
//@chat_id Identifier of the chat
//@message_thread_id Message thread identifier of the forum topic
deleteForumTopic chat_id:int53 message_thread_id:int53 = Ok;


//@description Returns information about an emoji reaction. Returns a 404 error if the reaction is not found @emoji Text representation of the reaction
getEmojiReaction emoji:string = EmojiReaction;

//@description Returns TGS stickers with generic animations for custom emoji reactions
getCustomEmojiReactionAnimations = Stickers;

//@description Returns reactions, which can be added to a message. The list can change after updateActiveEmojiReactions, updateChatAvailableReactions for the chat, or updateMessageInteractionInfo for the message
//@chat_id Identifier of the chat to which the message belongs
//@message_id Identifier of the message
//@row_size Number of reaction per row, 5-25
getMessageAvailableReactions chat_id:int53 message_id:int53 row_size:int32 = AvailableReactions;

//@description Clears the list of recently used reactions
clearRecentReactions = Ok;

//@description Adds a reaction or a tag to a message. Use getMessageAvailableReactions to receive the list of available reactions for the message
//@chat_id Identifier of the chat to which the message belongs
//@message_id Identifier of the message
//@reaction_type Type of the reaction to add
//@is_big Pass true if the reaction is added with a big animation
//@update_recent_reactions Pass true if the reaction needs to be added to recent reactions; tags are never added to the list of recent reactions
addMessageReaction chat_id:int53 message_id:int53 reaction_type:ReactionType is_big:Bool update_recent_reactions:Bool = Ok;

//@description Removes a reaction from a message. A chosen reaction can always be removed
//@chat_id Identifier of the chat to which the message belongs
//@message_id Identifier of the message
//@reaction_type Type of the reaction to remove
removeMessageReaction chat_id:int53 message_id:int53 reaction_type:ReactionType = Ok;

//@description Sets reactions on a message; for bots only
//@chat_id Identifier of the chat to which the message belongs
//@message_id Identifier of the message
//@reaction_types Types of the reaction to set
//@is_big Pass true if the reactions are added with a big animation
setMessageReactions chat_id:int53 message_id:int53 reaction_types:vector<ReactionType> is_big:Bool = Ok;

//@description Returns reactions added for a message, along with their sender
//@chat_id Identifier of the chat to which the message belongs
//@message_id Identifier of the message
//@reaction_type Type of the reactions to return; pass null to return all added reactions
//@offset Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
//@limit The maximum number of reactions to be returned; must be positive and can't be greater than 100
getMessageAddedReactions chat_id:int53 message_id:int53 reaction_type:ReactionType offset:string limit:int32 = AddedReactions;

//@description Changes type of default reaction for the current user @reaction_type New type of the default reaction
setDefaultReactionType reaction_type:ReactionType = Ok;

//@description Returns tags used in Saved Messages or a Saved Messages topic
//@saved_messages_topic_id Identifier of Saved Messages topic which tags will be returned; pass 0 to get all Saved Messages tags
getSavedMessagesTags saved_messages_topic_id:int53 = SavedMessagesTags;

//@description Changes label of a Saved Messages tag; for Telegram Premium users only @tag The tag which label will be changed @label New label for the tag; 0-12 characters
setSavedMessagesTagLabel tag:ReactionType label:string = Ok;


//@description Searches for a given quote in a text. Returns found quote start position in UTF-16 code units. Returns a 404 error if the quote is not found. Can be called synchronously
//@text Text in which to search for the quote
//@quote Quote to search for
//@quote_position Approximate quote position in UTF-16 code units
searchQuote text:formattedText quote:formattedText quote_position:int32 = FoundPosition;

//@description Returns all entities (mentions, hashtags, cashtags, bot commands, bank card numbers, URLs, and email addresses) found in the text. Can be called synchronously @text The text in which to look for entities
getTextEntities text:string = TextEntities;

//@description Parses Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, BlockQuote, Code, Pre, PreCode, TextUrl and MentionName entities from a marked-up text. Can be called synchronously @text The text to parse @parse_mode Text parse mode
parseTextEntities text:string parse_mode:TextParseMode = FormattedText;

//@description Parses Markdown entities in a human-friendly format, ignoring markup errors. Can be called synchronously
//@text The text to parse. For example, "__italic__ ~~strikethrough~~ ||spoiler|| **bold** `code` ```pre``` __[italic__ text_url](telegram.org) __italic**bold italic__bold**"
parseMarkdown text:formattedText = FormattedText;

//@description Replaces text entities with Markdown formatting in a human-friendly format. Entities that can't be represented in Markdown unambiguously are kept as is. Can be called synchronously @text The text
getMarkdownText text:formattedText = FormattedText;

//@description Returns an emoji for the given country. Returns an empty string on failure. Can be called synchronously @country_code A two-letter ISO 3166-1 alpha-2 country code as received from getCountries
getCountryFlagEmoji country_code:string = Text;

//@description Returns the MIME type of a file, guessed by its extension. Returns an empty string on failure. Can be called synchronously @file_name The name of the file or path to the file
getFileMimeType file_name:string = Text;

//@description Returns the extension of a file, guessed by its MIME type. Returns an empty string on failure. Can be called synchronously @mime_type The MIME type of the file
getFileExtension mime_type:string = Text;

//@description Removes potentially dangerous characters from the name of a file. The encoding of the file name is supposed to be UTF-8. Returns an empty string on failure. Can be called synchronously @file_name File name or path to the file
cleanFileName file_name:string = Text;

//@description Returns a string stored in the local database from the specified localization target and language pack by its key. Returns a 404 error if the string is not found. Can be called synchronously
//@language_pack_database_path Path to the language pack database in which strings are stored
//@localization_target Localization target to which the language pack belongs
//@language_pack_id Language pack identifier
//@key Language pack key of the string to be returned
getLanguagePackString language_pack_database_path:string localization_target:string language_pack_id:string key:string = LanguagePackStringValue;

//@description Converts a JSON-serialized string to corresponding JsonValue object. Can be called synchronously @json The JSON-serialized string
getJsonValue json:string = JsonValue;

//@description Converts a JsonValue object to corresponding JSON-serialized string. Can be called synchronously @json_value The JsonValue object
getJsonString json_value:JsonValue = Text;

//@description Converts a themeParameters object to corresponding JSON-serialized string. Can be called synchronously @theme Theme parameters to convert to JSON
getThemeParametersJsonString theme:themeParameters = Text;


//@description Changes the user answer to a poll. A poll in quiz mode can be answered only once
//@chat_id Identifier of the chat to which the poll belongs
//@message_id Identifier of the message containing the poll
//@option_ids 0-based identifiers of answer options, chosen by the user. User can choose more than 1 answer option only is the poll allows multiple answers
setPollAnswer chat_id:int53 message_id:int53 option_ids:vector<int32> = Ok;

//@description Returns message senders voted for the specified option in a non-anonymous polls. For optimal performance, the number of returned users is chosen by TDLib
//@chat_id Identifier of the chat to which the poll belongs
//@message_id Identifier of the message containing the poll
//@option_id 0-based identifier of the answer option
//@offset Number of voters to skip in the result; must be non-negative
//@limit The maximum number of voters to be returned; must be positive and can't be greater than 50. For optimal performance, the number of returned voters is chosen by TDLib and can be smaller than the specified limit, even if the end of the voter list has not been reached
getPollVoters chat_id:int53 message_id:int53 option_id:int32 offset:int32 limit:int32 = MessageSenders;

//@description Stops a poll. A poll in a message can be stopped when the message has can_be_edited flag is set
//@chat_id Identifier of the chat to which the poll belongs
//@message_id Identifier of the message containing the poll
//@reply_markup The new message reply markup; pass null if none; for bots only
stopPoll chat_id:int53 message_id:int53 reply_markup:ReplyMarkup = Ok;


//@description Hides a suggested action @action Suggested action to hide
hideSuggestedAction action:SuggestedAction = Ok;

//@description Hides the list of contacts that have close birthdays for 24 hours
hideContactCloseBirthdays = Ok;


//@description Returns information about a business connection by its identifier; for bots only @connection_id Identifier of the business connection to return
getBusinessConnection connection_id:string = BusinessConnection;


//@description Returns information about a button of type inlineKeyboardButtonTypeLoginUrl. The method needs to be called when the user presses the button
//@chat_id Chat identifier of the message with the button
//@message_id Message identifier of the message with the button
//@button_id Button identifier
getLoginUrlInfo chat_id:int53 message_id:int53 button_id:int53 = LoginUrlInfo;

//@description Returns an HTTP URL which can be used to automatically authorize the user on a website after clicking an inline button of type inlineKeyboardButtonTypeLoginUrl.
//-Use the method getLoginUrlInfo to find whether a prior user confirmation is needed. If an error is returned, then the button must be handled as an ordinary URL button
//@chat_id Chat identifier of the message with the button
//@message_id Message identifier of the message with the button
//@button_id Button identifier
//@allow_write_access Pass true to allow the bot to send messages to the current user
getLoginUrl chat_id:int53 message_id:int53 button_id:int53 allow_write_access:Bool = HttpUrl;


//@description Shares users after pressing a keyboardButtonTypeRequestUsers button with the bot
//@chat_id Identifier of the chat with the bot
//@message_id Identifier of the message with the button
//@button_id Identifier of the button
//@shared_user_ids Identifiers of the shared users
//@only_check Pass true to check that the users can be shared by the button instead of actually sharing them
shareUsersWithBot chat_id:int53 message_id:int53 button_id:int32 shared_user_ids:vector<int53> only_check:Bool = Ok;

//@description Shares a chat after pressing a keyboardButtonTypeRequestChat button with the bot
//@chat_id Identifier of the chat with the bot
//@message_id Identifier of the message with the button
//@button_id Identifier of the button
//@shared_chat_id Identifier of the shared chat
//@only_check Pass true to check that the chat can be shared by the button instead of actually sharing it. Doesn't check bot_is_member and bot_administrator_rights restrictions.
//-If the bot must be a member, then all chats from getGroupsInCommon and all chats, where the user can add the bot, are suitable. In the latter case the bot will be automatically added to the chat.
//-If the bot must be an administrator, then all chats, where the bot already has requested rights or can be added to administrators by the user, are suitable. In the latter case the bot will be automatically granted requested rights
shareChatWithBot chat_id:int53 message_id:int53 button_id:int32 shared_chat_id:int53 only_check:Bool = Ok;


//@description Sends an inline query to a bot and returns its results. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires
//@bot_user_id Identifier of the target bot
//@chat_id Identifier of the chat where the query was sent
//@user_location Location of the user; pass null if unknown or the bot doesn't need user's location
//@query Text of the query
//@offset Offset of the first entry to return; use empty string to get the first chunk of results
getInlineQueryResults bot_user_id:int53 chat_id:int53 user_location:location query:string offset:string = InlineQueryResults;

//@description Sets the result of an inline query; for bots only
//@inline_query_id Identifier of the inline query
//@is_personal Pass true if results may be cached and returned only for the user that sent the query. By default, results may be returned to any user who sends the same query
//@button Button to be shown above inline query results; pass null if none
//@results The results of the query
//@cache_time Allowed time to cache the results of the query, in seconds
//@next_offset Offset for the next inline query; pass an empty string if there are no more results
answerInlineQuery inline_query_id:int64 is_personal:Bool button:inlineQueryResultsButton results:vector<InputInlineQueryResult> cache_time:int32 next_offset:string = Ok;


//@description Returns information about a Web App by its short name. Returns a 404 error if the Web App is not found
//@bot_user_id Identifier of the target bot
//@web_app_short_name Short name of the Web App
searchWebApp bot_user_id:int53 web_app_short_name:string = FoundWebApp;

//@description Returns an HTTPS URL of a Web App to open after a link of the type internalLinkTypeWebApp is clicked
//@chat_id Identifier of the chat in which the link was clicked; pass 0 if none
//@bot_user_id Identifier of the target bot
//@web_app_short_name Short name of the Web App
//@start_parameter Start parameter from internalLinkTypeWebApp
//@theme Preferred Web App theme; pass null to use the default theme
//@application_name Short name of the application; 0-64 English letters, digits, and underscores
//@allow_write_access Pass true if the current user allowed the bot to send them messages
getWebAppLinkUrl chat_id:int53 bot_user_id:int53 web_app_short_name:string start_parameter:string theme:themeParameters application_name:string allow_write_access:Bool = HttpUrl;

//@description Returns an HTTPS URL of a Web App to open from the side menu, a keyboardButtonTypeWebApp button, an inlineQueryResultsButtonTypeWebApp button, or an internalLinkTypeSideMenuBot link
//@bot_user_id Identifier of the target bot
//@url The URL from a keyboardButtonTypeWebApp button, inlineQueryResultsButtonTypeWebApp button, an internalLinkTypeSideMenuBot link, or an empty when the bot is opened from the side menu
//@theme Preferred Web App theme; pass null to use the default theme
//@application_name Short name of the application; 0-64 English letters, digits, and underscores
getWebAppUrl bot_user_id:int53 url:string theme:themeParameters application_name:string = HttpUrl;

//@description Sends data received from a keyboardButtonTypeWebApp Web App to a bot
//@bot_user_id Identifier of the target bot
//@button_text Text of the keyboardButtonTypeWebApp button, which opened the Web App
//@data The data
sendWebAppData bot_user_id:int53 button_text:string data:string = Ok;

//@description Informs TDLib that a Web App is being opened from the attachment menu, a botMenuButton button, an internalLinkTypeAttachmentMenuBot link, or an inlineKeyboardButtonTypeWebApp button.
//-For each bot, a confirmation alert about data sent to the bot must be shown once
//@chat_id Identifier of the chat in which the Web App is opened. The Web App can't be opened in secret chats
//@bot_user_id Identifier of the bot, providing the Web App
//@url The URL from an inlineKeyboardButtonTypeWebApp button, a botMenuButton button, an internalLinkTypeAttachmentMenuBot link, or an empty string otherwise
//@theme Preferred Web App theme; pass null to use the default theme
//@application_name Short name of the application; 0-64 English letters, digits, and underscores
//@message_thread_id If not 0, the message thread identifier in which the message will be sent
//@reply_to Information about the message or story to be replied in the message sent by the Web App; pass null if none
openWebApp chat_id:int53 bot_user_id:int53 url:string theme:themeParameters application_name:string message_thread_id:int53 reply_to:InputMessageReplyTo = WebAppInfo;

//@description Informs TDLib that a previously opened Web App was closed @web_app_launch_id Identifier of Web App launch, received from openWebApp
closeWebApp web_app_launch_id:int64 = Ok;

//@description Sets the result of interaction with a Web App and sends corresponding message on behalf of the user to the chat from which the query originated; for bots only
//@web_app_query_id Identifier of the Web App query
//@result The result of the query
answerWebAppQuery web_app_query_id:string result:InputInlineQueryResult = SentWebAppMessage;


//@description Sends a callback query to a bot and returns an answer. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires
//@chat_id Identifier of the chat with the message
//@message_id Identifier of the message from which the query originated
//@payload Query payload
getCallbackQueryAnswer chat_id:int53 message_id:int53 payload:CallbackQueryPayload = CallbackQueryAnswer;

//@description Sets the result of a callback query; for bots only
//@callback_query_id Identifier of the callback query
//@text Text of the answer
//@show_alert Pass true to show an alert to the user instead of a toast notification
//@url URL to be opened
//@cache_time Time during which the result of the query can be cached, in seconds
answerCallbackQuery callback_query_id:int64 text:string show_alert:Bool url:string cache_time:int32 = Ok;


//@description Sets the result of a shipping query; for bots only @shipping_query_id Identifier of the shipping query @shipping_options Available shipping options @error_message An error message, empty on success
answerShippingQuery shipping_query_id:int64 shipping_options:vector<shippingOption> error_message:string = Ok;

//@description Sets the result of a pre-checkout query; for bots only @pre_checkout_query_id Identifier of the pre-checkout query @error_message An error message, empty on success
answerPreCheckoutQuery pre_checkout_query_id:int64 error_message:string = Ok;


//@description Updates the game score of the specified user in the game; for bots only
//@chat_id The chat to which the message with the game belongs
//@message_id Identifier of the message
//@edit_message Pass true to edit the game message to include the current scoreboard
//@user_id User identifier
//@score The new score
//@force Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
setGameScore chat_id:int53 message_id:int53 edit_message:Bool user_id:int53 score:int32 force:Bool = Message;

//@description Updates the game score of the specified user in a game; for bots only
//@inline_message_id Inline message identifier
//@edit_message Pass true to edit the game message to include the current scoreboard
//@user_id User identifier
//@score The new score
//@force Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
setInlineGameScore inline_message_id:string edit_message:Bool user_id:int53 score:int32 force:Bool = Ok;

//@description Returns the high scores for a game and some part of the high score table in the range of the specified user; for bots only @chat_id The chat that contains the message with the game @message_id Identifier of the message @user_id User identifier
getGameHighScores chat_id:int53 message_id:int53 user_id:int53 = GameHighScores;

//@description Returns game high scores and some part of the high score table in the range of the specified user; for bots only @inline_message_id Inline message identifier @user_id User identifier
getInlineGameHighScores inline_message_id:string user_id:int53 = GameHighScores;


//@description Deletes the default reply markup from a chat. Must be called after a one-time keyboard or a replyMarkupForceReply reply markup has been used. An updateChatReplyMarkup update will be sent if the reply markup is changed
//@chat_id Chat identifier
//@message_id The message identifier of the used keyboard
deleteChatReplyMarkup chat_id:int53 message_id:int53 = Ok;


//@description Sends a notification about user activity in a chat
//@chat_id Chat identifier
//@message_thread_id If not 0, the message thread identifier in which the action was performed
//@business_connection_id Unique identifier of business connection on behalf of which to send the request; for bots only
//@action The action description; pass null to cancel the currently active action
sendChatAction chat_id:int53 message_thread_id:int53 business_connection_id:string action:ChatAction = Ok;


//@description Informs TDLib that the chat is opened by the user. Many useful activities depend on the chat being opened or closed (e.g., in supergroups and channels all updates are received only for opened chats) @chat_id Chat identifier
openChat chat_id:int53 = Ok;

//@description Informs TDLib that the chat is closed by the user. Many useful activities depend on the chat being opened or closed @chat_id Chat identifier
closeChat chat_id:int53 = Ok;

//@description Informs TDLib that messages are being viewed by the user. Sponsored messages must be marked as viewed only when the entire text of the message is shown on the screen (excluding the button).
//-Many useful activities depend on whether the messages are currently being viewed or not (e.g., marking messages as read, incrementing a view counter, updating a view counter, removing deleted messages in supergroups and channels)
//@chat_id Chat identifier
//@message_ids The identifiers of the messages being viewed
//@source Source of the message view; pass null to guess the source based on chat open state
//@force_read Pass true to mark as read the specified messages even the chat is closed
viewMessages chat_id:int53 message_ids:vector<int53> source:MessageSource force_read:Bool = Ok;

//@description Informs TDLib that the message content has been opened (e.g., the user has opened a photo, video, document, location or venue, or has listened to an audio file or voice note message).
//-An updateMessageContentOpened update will be generated if something has changed
//@chat_id Chat identifier of the message
//@message_id Identifier of the message with the opened content
openMessageContent chat_id:int53 message_id:int53 = Ok;

//@description Informs TDLib that a message with an animated emoji was clicked by the user. Returns a big animated sticker to be played or a 404 error if usual animation needs to be played @chat_id Chat identifier of the message @message_id Identifier of the clicked message
clickAnimatedEmojiMessage chat_id:int53 message_id:int53 = Sticker;

//@description Returns an HTTPS or a tg: link with the given type. Can be called before authorization @type Expected type of the link @is_http Pass true to create an HTTPS link (only available for some link types); pass false to create a tg: link
getInternalLink type:InternalLinkType is_http:Bool = HttpUrl;

//@description Returns information about the type of internal link. Returns a 404 error if the link is not internal. Can be called before authorization @link The link
getInternalLinkType link:string = InternalLinkType;

//@description Returns information about an action to be done when the current user clicks an external link. Don't use this method for links from secret chats if web page preview is disabled in secret chats @link The link
getExternalLinkInfo link:string = LoginUrlInfo;

//@description Returns an HTTP URL which can be used to automatically authorize the current user on a website after clicking an HTTP link. Use the method getExternalLinkInfo to find whether a prior user confirmation is needed
//@link The HTTP link
//@allow_write_access Pass true if the current user allowed the bot, returned in getExternalLinkInfo, to send them messages
getExternalLink link:string allow_write_access:Bool = HttpUrl;


//@description Marks all mentions in a chat as read @chat_id Chat identifier
readAllChatMentions chat_id:int53 = Ok;

//@description Marks all mentions in a forum topic as read @chat_id Chat identifier @message_thread_id Message thread identifier in which mentions are marked as read
readAllMessageThreadMentions chat_id:int53 message_thread_id:int53 = Ok;

//@description Marks all reactions in a chat or a forum topic as read @chat_id Chat identifier
readAllChatReactions chat_id:int53 = Ok;

//@description Marks all reactions in a forum topic as read @chat_id Chat identifier @message_thread_id Message thread identifier in which reactions are marked as read
readAllMessageThreadReactions chat_id:int53 message_thread_id:int53 = Ok;


//@description Returns an existing chat corresponding to a given user @user_id User identifier @force Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect
createPrivateChat user_id:int53 force:Bool = Chat;

//@description Returns an existing chat corresponding to a known basic group @basic_group_id Basic group identifier @force Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect
createBasicGroupChat basic_group_id:int53 force:Bool = Chat;

//@description Returns an existing chat corresponding to a known supergroup or channel @supergroup_id Supergroup or channel identifier @force Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect
createSupergroupChat supergroup_id:int53 force:Bool = Chat;

//@description Returns an existing chat corresponding to a known secret chat @secret_chat_id Secret chat identifier
createSecretChat secret_chat_id:int32 = Chat;

//@description Creates a new basic group and sends a corresponding messageBasicGroupChatCreate. Returns information about the newly created chat
//@user_ids Identifiers of users to be added to the basic group; may be empty to create a basic group without other members
//@title Title of the new basic group; 1-128 characters
//@message_auto_delete_time Message auto-delete time value, in seconds; must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically
createNewBasicGroupChat user_ids:vector<int53> title:string message_auto_delete_time:int32 = CreatedBasicGroupChat;

//@description Creates a new supergroup or channel and sends a corresponding messageSupergroupChatCreate. Returns the newly created chat
//@title Title of the new chat; 1-128 characters
//@is_forum Pass true to create a forum supergroup chat
//@is_channel Pass true to create a channel chat; ignored if a forum is created
//@param_description Chat description; 0-255 characters
//@location Chat location if a location-based supergroup is being created; pass null to create an ordinary supergroup chat
//@message_auto_delete_time Message auto-delete time value, in seconds; must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically
//@for_import Pass true to create a supergroup for importing messages using importMessages
createNewSupergroupChat title:string is_forum:Bool is_channel:Bool description:string location:chatLocation message_auto_delete_time:int32 for_import:Bool = Chat;

//@description Creates a new secret chat. Returns the newly created chat @user_id Identifier of the target user
createNewSecretChat user_id:int53 = Chat;

//@description Creates a new supergroup from an existing basic group and sends a corresponding messageChatUpgradeTo and messageChatUpgradeFrom; requires owner privileges. Deactivates the original basic group @chat_id Identifier of the chat to upgrade
upgradeBasicGroupChatToSupergroupChat chat_id:int53 = Chat;


//@description Returns chat lists to which the chat can be added. This is an offline request @chat_id Chat identifier
getChatListsToAddChat chat_id:int53 = ChatLists;

//@description Adds a chat to a chat list. A chat can't be simultaneously in Main and Archive chat lists, so it is automatically removed from another one if needed
//@chat_id Chat identifier
//@chat_list The chat list. Use getChatListsToAddChat to get suitable chat lists
addChatToList chat_id:int53 chat_list:ChatList = Ok;

//@description Returns information about a chat folder by its identifier @chat_folder_id Chat folder identifier
getChatFolder chat_folder_id:int32 = ChatFolder;

//@description Creates new chat folder. Returns information about the created chat folder. There can be up to getOption("chat_folder_count_max") chat folders, but the limit can be increased with Telegram Premium @folder The new chat folder
createChatFolder folder:chatFolder = ChatFolderInfo;

//@description Edits existing chat folder. Returns information about the edited chat folder @chat_folder_id Chat folder identifier @folder The edited chat folder
editChatFolder chat_folder_id:int32 folder:chatFolder = ChatFolderInfo;

//@description Deletes existing chat folder @chat_folder_id Chat folder identifier @leave_chat_ids Identifiers of the chats to leave. The chats must be pinned or always included in the folder
deleteChatFolder chat_folder_id:int32 leave_chat_ids:vector<int53> = Ok;

//@description Returns identifiers of pinned or always included chats from a chat folder, which are suggested to be left when the chat folder is deleted @chat_folder_id Chat folder identifier
getChatFolderChatsToLeave chat_folder_id:int32 = Chats;

//@description Returns approximate number of chats in a being created chat folder. Main and archive chat lists must be fully preloaded for this function to work correctly @folder The new chat folder
getChatFolderChatCount folder:chatFolder = Count;

//@description Changes the order of chat folders @chat_folder_ids Identifiers of chat folders in the new correct order @main_chat_list_position Position of the main chat list among chat folders, 0-based. Can be non-zero only for Premium users
reorderChatFolders chat_folder_ids:vector<int32> main_chat_list_position:int32 = Ok;

//@description Toggles whether chat folder tags are enabled @are_tags_enabled Pass true to enable folder tags; pass false to disable them
toggleChatFolderTags are_tags_enabled:Bool = Ok;

//@description Returns recommended chat folders for the current user
getRecommendedChatFolders = RecommendedChatFolders;

//@description Returns default icon name for a folder. Can be called synchronously @folder Chat folder
getChatFolderDefaultIconName folder:chatFolder = ChatFolderIcon;

//@description Returns identifiers of chats from a chat folder, suitable for adding to a chat folder invite link @chat_folder_id Chat folder identifier
getChatsForChatFolderInviteLink chat_folder_id:int32 = Chats;

//@description Creates a new invite link for a chat folder. A link can be created for a chat folder if it has only pinned and included chats
//@chat_folder_id Chat folder identifier
//@name Name of the link; 0-32 characters
//@chat_ids Identifiers of chats to be accessible by the invite link. Use getChatsForChatFolderInviteLink to get suitable chats. Basic groups will be automatically converted to supergroups before link creation
createChatFolderInviteLink chat_folder_id:int32 name:string chat_ids:vector<int53> = ChatFolderInviteLink;

//@description Returns invite links created by the current user for a shareable chat folder @chat_folder_id Chat folder identifier
getChatFolderInviteLinks chat_folder_id:int32 = ChatFolderInviteLinks;

//@description Edits an invite link for a chat folder
//@chat_folder_id Chat folder identifier
//@invite_link Invite link to be edited
//@name New name of the link; 0-32 characters
//@chat_ids New identifiers of chats to be accessible by the invite link. Use getChatsForChatFolderInviteLink to get suitable chats. Basic groups will be automatically converted to supergroups before link editing
editChatFolderInviteLink chat_folder_id:int32 invite_link:string name:string chat_ids:vector<int53> = ChatFolderInviteLink;

//@description Deletes an invite link for a chat folder
//@chat_folder_id Chat folder identifier
//@invite_link Invite link to be deleted
deleteChatFolderInviteLink chat_folder_id:int32 invite_link:string = Ok;

//@description Checks the validity of an invite link for a chat folder and returns information about the corresponding chat folder @invite_link Invite link to be checked
checkChatFolderInviteLink invite_link:string = ChatFolderInviteLinkInfo;

//@description Adds a chat folder by an invite link @invite_link Invite link for the chat folder @chat_ids Identifiers of the chats added to the chat folder. The chats are automatically joined if they aren't joined yet
addChatFolderByInviteLink invite_link:string chat_ids:vector<int53> = Ok;

//@description Returns new chats added to a shareable chat folder by its owner. The method must be called at most once in getOption("chat_folder_new_chats_update_period") for the given chat folder @chat_folder_id Chat folder identifier
getChatFolderNewChats chat_folder_id:int32 = Chats;

//@description Process new chats added to a shareable chat folder by its owner @chat_folder_id Chat folder identifier @added_chat_ids Identifiers of the new chats, which are added to the chat folder. The chats are automatically joined if they aren't joined yet
processChatFolderNewChats chat_folder_id:int32 added_chat_ids:vector<int53> = Ok;

//@description Returns settings for automatic moving of chats to and from the Archive chat lists
getArchiveChatListSettings = ArchiveChatListSettings;

//@description Changes settings for automatic moving of chats to and from the Archive chat lists @settings New settings
setArchiveChatListSettings settings:archiveChatListSettings = Ok;


//@description Changes the chat title. Supported only for basic groups, supergroups and channels. Requires can_change_info member right
//@chat_id Chat identifier
//@title New title of the chat; 1-128 characters
setChatTitle chat_id:int53 title:string = Ok;

//@description Changes the photo of a chat. Supported only for basic groups, supergroups and channels. Requires can_change_info member right
//@chat_id Chat identifier
//@photo New chat photo; pass null to delete the chat photo
setChatPhoto chat_id:int53 photo:InputChatPhoto = Ok;

//@description Changes accent color and background custom emoji of a channel chat. Requires can_change_info administrator right
//@chat_id Chat identifier
//@accent_color_id Identifier of the accent color to use. The chat must have at least accentColor.min_channel_chat_boost_level boost level to pass the corresponding color
//@background_custom_emoji_id Identifier of a custom emoji to be shown on the reply header and link preview background; 0 if none. Use chatBoostLevelFeatures.can_set_background_custom_emoji to check whether a custom emoji can be set
setChatAccentColor chat_id:int53 accent_color_id:int32 background_custom_emoji_id:int64 = Ok;

//@description Changes accent color and background custom emoji for profile of a supergroup or channel chat. Requires can_change_info administrator right
//@chat_id Chat identifier
//@profile_accent_color_id Identifier of the accent color to use for profile; pass -1 if none. The chat must have at least profileAccentColor.min_supergroup_chat_boost_level for supergroups
//-or profileAccentColor.min_channel_chat_boost_level for channels boost level to pass the corresponding color
//@profile_background_custom_emoji_id Identifier of a custom emoji to be shown on the chat's profile photo background; 0 if none. Use chatBoostLevelFeatures.can_set_profile_background_custom_emoji to check whether a custom emoji can be set
setChatProfileAccentColor chat_id:int53 profile_accent_color_id:int32 profile_background_custom_emoji_id:int64 = Ok;

//@description Changes the message auto-delete or self-destruct (for secret chats) time in a chat. Requires change_info administrator right in basic groups, supergroups and channels
//-Message auto-delete time can't be changed in a chat with the current user (Saved Messages) and the chat 777000 (Telegram).
//@chat_id Chat identifier
//@message_auto_delete_time New time value, in seconds; unless the chat is secret, it must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically
setChatMessageAutoDeleteTime chat_id:int53 message_auto_delete_time:int32 = Ok;

//@description Changes the emoji status of a chat. Use chatBoostLevelFeatures.can_set_emoji_status to check whether an emoji status can be set. Requires can_change_info administrator right
//@chat_id Chat identifier
//@emoji_status New emoji status; pass null to remove emoji status
setChatEmojiStatus chat_id:int53 emoji_status:emojiStatus = Ok;

//@description Changes the chat members permissions. Supported only for basic groups and supergroups. Requires can_restrict_members administrator right
//@chat_id Chat identifier
//@permissions New non-administrator members permissions in the chat
setChatPermissions chat_id:int53 permissions:chatPermissions = Ok;

//@description Sets the background in a specific chat. Supported only in private and secret chats with non-deleted users, and in chats with sufficient boost level and can_change_info administrator right
//@chat_id Chat identifier
//@background The input background to use; pass null to create a new filled or chat theme background
//@type Background type; pass null to use default background type for the chosen background; backgroundTypeChatTheme isn't supported for private and secret chats.
//-Use chatBoostLevelFeatures.chat_theme_background_count and chatBoostLevelFeatures.can_set_custom_background to check whether the background type can be set in the boosted chat
//@dark_theme_dimming Dimming of the background in dark themes, as a percentage; 0-100. Applied only to Wallpaper and Fill types of background
//@only_for_self Pass true to set background only for self; pass false to set background for all chat users. Always false for backgrounds set in boosted chats. Background can be set for both users only by Telegram Premium users and if set background isn't of the type inputBackgroundPrevious
setChatBackground chat_id:int53 background:InputBackground type:BackgroundType dark_theme_dimming:int32 only_for_self:Bool = Ok;

//@description Deletes background in a specific chat
//@chat_id Chat identifier
//@restore_previous Pass true to restore previously set background. Can be used only in private and secret chats with non-deleted users if userFullInfo.set_chat_background == true.
//-Supposed to be used from messageChatSetBackground messages with the currently set background that was set for both sides by the other user
deleteChatBackground chat_id:int53 restore_previous:Bool = Ok;

//@description Changes the chat theme. Supported only in private and secret chats @chat_id Chat identifier @theme_name Name of the new chat theme; pass an empty string to return the default theme
setChatTheme chat_id:int53 theme_name:string = Ok;

//@description Changes the draft message in a chat
//@chat_id Chat identifier
//@message_thread_id If not 0, the message thread identifier in which the draft was changed
//@draft_message New draft message; pass null to remove the draft. All files in draft message content must be of the type inputFileLocal. Media thumbnails and captions are ignored
setChatDraftMessage chat_id:int53 message_thread_id:int53 draft_message:draftMessage = Ok;

//@description Changes the notification settings of a chat. Notification settings of a chat with the current user (Saved Messages) can't be changed
//@chat_id Chat identifier
//@notification_settings New notification settings for the chat. If the chat is muted for more than 366 days, it is considered to be muted forever
setChatNotificationSettings chat_id:int53 notification_settings:chatNotificationSettings = Ok;

//@description Changes the ability of users to save, forward, or copy chat content. Supported only for basic groups, supergroups and channels. Requires owner privileges
//@chat_id Chat identifier
//@has_protected_content New value of has_protected_content
toggleChatHasProtectedContent chat_id:int53 has_protected_content:Bool = Ok;

//@description Changes the view_as_topics setting of a forum chat or Saved Messages @chat_id Chat identifier @view_as_topics New value of view_as_topics
toggleChatViewAsTopics chat_id:int53 view_as_topics:Bool = Ok;

//@description Changes the translatable state of a chat @chat_id Chat identifier @is_translatable New value of is_translatable
toggleChatIsTranslatable chat_id:int53 is_translatable:Bool = Ok;

//@description Changes the marked as unread state of a chat @chat_id Chat identifier @is_marked_as_unread New value of is_marked_as_unread
toggleChatIsMarkedAsUnread chat_id:int53 is_marked_as_unread:Bool = Ok;

//@description Changes the value of the default disable_notification parameter, used when a message is sent to a chat @chat_id Chat identifier @default_disable_notification New value of default_disable_notification
toggleChatDefaultDisableNotification chat_id:int53 default_disable_notification:Bool = Ok;

//@description Changes reactions, available in a chat. Available for basic groups, supergroups, and channels. Requires can_change_info member right
//@chat_id Identifier of the chat
//@available_reactions Reactions available in the chat. All explicitly specified emoji reactions must be active. In channel chats up to the chat's boost level custom emoji reactions can be explicitly specified
setChatAvailableReactions chat_id:int53 available_reactions:ChatAvailableReactions = Ok;

//@description Changes application-specific data associated with a chat @chat_id Chat identifier @client_data New value of client_data
setChatClientData chat_id:int53 client_data:string = Ok;

//@description Changes information about a chat. Available for basic groups, supergroups, and channels. Requires can_change_info member right @chat_id Identifier of the chat @param_description New chat description; 0-255 characters
setChatDescription chat_id:int53 description:string = Ok;

//@description Changes the discussion group of a channel chat; requires can_change_info administrator right in the channel if it is specified
//@chat_id Identifier of the channel chat. Pass 0 to remove a link from the supergroup passed in the second argument to a linked channel chat (requires can_pin_messages member right in the supergroup)
//@discussion_chat_id Identifier of a new channel's discussion group. Use 0 to remove the discussion group. Use the method getSuitableDiscussionChats to find all suitable groups.
//-Basic group chats must be first upgraded to supergroup chats. If new chat members don't have access to old messages in the supergroup, then toggleSupergroupIsAllHistoryAvailable must be used first to change that
setChatDiscussionGroup chat_id:int53 discussion_chat_id:int53 = Ok;

//@description Changes the location of a chat. Available only for some location-based supergroups, use supergroupFullInfo.can_set_location to check whether the method is allowed to use @chat_id Chat identifier @location New location for the chat; must be valid and not null
setChatLocation chat_id:int53 location:chatLocation = Ok;

//@description Changes the slow mode delay of a chat. Available only for supergroups; requires can_restrict_members right @chat_id Chat identifier @slow_mode_delay New slow mode delay for the chat, in seconds; must be one of 0, 10, 30, 60, 300, 900, 3600
setChatSlowModeDelay chat_id:int53 slow_mode_delay:int32 = Ok;

//@description Pins a message in a chat; requires can_pin_messages member right if the chat is a basic group or supergroup, or can_edit_messages administrator right if the chat is a channel
//@chat_id Identifier of the chat
//@message_id Identifier of the new pinned message
//@disable_notification Pass true to disable notification about the pinned message. Notifications are always disabled in channels and private chats
//@only_for_self Pass true to pin the message only for self; private chats only
pinChatMessage chat_id:int53 message_id:int53 disable_notification:Bool only_for_self:Bool = Ok;

//@description Removes a pinned message from a chat; requires can_pin_messages member right if the chat is a basic group or supergroup, or can_edit_messages administrator right if the chat is a channel @chat_id Identifier of the chat @message_id Identifier of the removed pinned message
unpinChatMessage chat_id:int53 message_id:int53 = Ok;

//@description Removes all pinned messages from a chat; requires can_pin_messages member right if the chat is a basic group or supergroup, or can_edit_messages administrator right if the chat is a channel @chat_id Identifier of the chat
unpinAllChatMessages chat_id:int53 = Ok;

//@description Removes all pinned messages from a forum topic; requires can_pin_messages member right in the supergroup
//@chat_id Identifier of the chat
//@message_thread_id Message thread identifier in which messages will be unpinned
unpinAllMessageThreadMessages chat_id:int53 message_thread_id:int53 = Ok;


//@description Adds the current user as a new member to a chat. Private and secret chats can't be joined using this method. May return an error with a message "INVITE_REQUEST_SENT" if only a join request was created @chat_id Chat identifier
joinChat chat_id:int53 = Ok;

//@description Removes the current user from chat members. Private and secret chats can't be left using this method @chat_id Chat identifier
leaveChat chat_id:int53 = Ok;

//@description Adds a new member to a chat; requires can_invite_users member right. Members can't be added to private or secret chats. Returns information about members that weren't added
//@chat_id Chat identifier
//@user_id Identifier of the user
//@forward_limit The number of earlier messages from the chat to be forwarded to the new member; up to 100. Ignored for supergroups and channels, or if the added user is a bot
addChatMember chat_id:int53 user_id:int53 forward_limit:int32 = FailedToAddMembers;

//@description Adds multiple new members to a chat; requires can_invite_users member right. Currently, this method is only available for supergroups and channels.
//-This method can't be used to join a chat. Members can't be added to a channel if it has more than 200 members. Returns information about members that weren't added
//@chat_id Chat identifier
//@user_ids Identifiers of the users to be added to the chat. The maximum number of added users is 20 for supergroups and 100 for channels
addChatMembers chat_id:int53 user_ids:vector<int53> = FailedToAddMembers;

//@description Changes the status of a chat member; requires can_invite_users member right to add a chat member, can_promote_members administrator right to change administrator rights of the member,
//-and can_restrict_members administrator right to change restrictions of a user. This function is currently not suitable for transferring chat ownership; use transferChatOwnership instead.
//-Use addChatMember or banChatMember if some additional parameters needs to be passed
//@chat_id Chat identifier
//@member_id Member identifier. Chats can be only banned and unbanned in supergroups and channels
//@status The new status of the member in the chat
setChatMemberStatus chat_id:int53 member_id:MessageSender status:ChatMemberStatus = Ok;

//@description Bans a member in a chat; requires can_restrict_members administrator right. Members can't be banned in private or secret chats. In supergroups and channels, the user will not be able to return to the group on their own using invite links, etc., unless unbanned first
//@chat_id Chat identifier
//@member_id Member identifier
//@banned_until_date Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days or for less than 30 seconds from the current time, the user is considered to be banned forever. Ignored in basic groups and if a chat is banned
//@revoke_messages Pass true to delete all messages in the chat for the user that is being removed. Always true for supergroups and channels
banChatMember chat_id:int53 member_id:MessageSender banned_until_date:int32 revoke_messages:Bool = Ok;

//@description Checks whether the current session can be used to transfer a chat ownership to another user
canTransferOwnership = CanTransferOwnershipResult;

//@description Changes the owner of a chat; requires owner privileges in the chat. Use the method canTransferOwnership to check whether the ownership can be transferred from the current session. Available only for supergroups and channel chats
//@chat_id Chat identifier
//@user_id Identifier of the user to which transfer the ownership. The ownership can't be transferred to a bot or to a deleted user
//@password The 2-step verification password of the current user
transferChatOwnership chat_id:int53 user_id:int53 password:string = Ok;

//@description Returns information about a single member of a chat @chat_id Chat identifier @member_id Member identifier
getChatMember chat_id:int53 member_id:MessageSender = ChatMember;

//@description Searches for a specified query in the first name, last name and usernames of the members of a specified chat. Requires administrator rights if the chat is a channel
//@chat_id Chat identifier
//@query Query to search for
//@limit The maximum number of users to be returned; up to 200
//@filter The type of users to search for; pass null to search among all chat members
searchChatMembers chat_id:int53 query:string limit:int32 filter:ChatMembersFilter = ChatMembers;

//@description Returns a list of administrators of the chat with their custom titles @chat_id Chat identifier
getChatAdministrators chat_id:int53 = ChatAdministrators;


//@description Clears message drafts in all chats @exclude_secret_chats Pass true to keep local message drafts in secret chats
clearAllDraftMessages exclude_secret_chats:Bool = Ok;


//@description Returns saved notification sound by its identifier. Returns a 404 error if there is no saved notification sound with the specified identifier @notification_sound_id Identifier of the notification sound
getSavedNotificationSound notification_sound_id:int64 = NotificationSounds;

//@description Returns the list of saved notification sounds. If a sound isn't in the list, then default sound needs to be used
getSavedNotificationSounds = NotificationSounds;

//@description Adds a new notification sound to the list of saved notification sounds. The new notification sound is added to the top of the list. If it is already in the list, its position isn't changed @sound Notification sound file to add
addSavedNotificationSound sound:InputFile = NotificationSound;

//@description Removes a notification sound from the list of saved notification sounds @notification_sound_id Identifier of the notification sound
removeSavedNotificationSound notification_sound_id:int64 = Ok;


//@description Returns the list of chats with non-default notification settings for new messages
//@scope If specified, only chats from the scope will be returned; pass null to return chats from all scopes
//@compare_sound Pass true to include in the response chats with only non-default sound
getChatNotificationSettingsExceptions scope:NotificationSettingsScope compare_sound:Bool = Chats;

//@description Returns the notification settings for chats of a given type @scope Types of chats for which to return the notification settings information
getScopeNotificationSettings scope:NotificationSettingsScope = ScopeNotificationSettings;

//@description Changes notification settings for chats of a given type @scope Types of chats for which to change the notification settings @notification_settings The new notification settings for the given scope
setScopeNotificationSettings scope:NotificationSettingsScope notification_settings:scopeNotificationSettings = Ok;

//@description Changes notification settings for reactions @notification_settings The new notification settings for reactions
setReactionNotificationSettings notification_settings:reactionNotificationSettings = Ok;

//@description Resets all chat and scope notification settings to their default values. By default, all chats are unmuted and message previews are shown
resetAllNotificationSettings = Ok;


//@description Changes the pinned state of a chat. There can be up to getOption("pinned_chat_count_max")/getOption("pinned_archived_chat_count_max") pinned non-secret chats and the same number of secret chats in the main/archive chat list. The limit can be increased with Telegram Premium
//@chat_list Chat list in which to change the pinned state of the chat
//@chat_id Chat identifier
//@is_pinned Pass true to pin the chat; pass false to unpin it
toggleChatIsPinned chat_list:ChatList chat_id:int53 is_pinned:Bool = Ok;

//@description Changes the order of pinned chats @chat_list Chat list in which to change the order of pinned chats @chat_ids The new list of pinned chats
setPinnedChats chat_list:ChatList chat_ids:vector<int53> = Ok;

//@description Traverse all chats in a chat list and marks all messages in the chats as read @chat_list Chat list in which to mark all chats as read
readChatList chat_list:ChatList = Ok;


//@description Returns a story
//@story_sender_chat_id Identifier of the chat that posted the story
//@story_id Story identifier
//@only_local Pass true to get only locally available information without sending network requests
getStory story_sender_chat_id:int53 story_id:int32 only_local:Bool = Story;

//@description Returns supergroup and channel chats in which the current user has the right to post stories. The chats must be rechecked with canSendStory before actually trying to post a story there
getChatsToSendStories = Chats;

//@description Checks whether the current user can send a story on behalf of a chat; requires can_post_stories right for supergroup and channel chats @chat_id Chat identifier
canSendStory chat_id:int53 = CanSendStoryResult;

//@description Sends a new story to a chat; requires can_post_stories right for supergroup and channel chats. Returns a temporary story
//@chat_id Identifier of the chat that will post the story
//@content Content of the story
//@areas Clickable rectangle areas to be shown on the story media; pass null if none
//@caption Story caption; pass null to use an empty caption; 0-getOption("story_caption_length_max") characters; can have entities only if getOption("can_use_text_entities_in_story_caption")
//@privacy_settings The privacy settings for the story; ignored for stories sent to supergroup and channel chats
//@active_period Period after which the story is moved to archive, in seconds; must be one of 6 * 3600, 12 * 3600, 86400, or 2 * 86400 for Telegram Premium users, and 86400 otherwise
//@from_story_full_id Full identifier of the original story, which content was used to create the story
//@is_posted_to_chat_page Pass true to keep the story accessible after expiration
//@protect_content Pass true if the content of the story must be protected from forwarding and screenshotting
sendStory chat_id:int53 content:InputStoryContent areas:inputStoryAreas caption:formattedText privacy_settings:StoryPrivacySettings active_period:int32 from_story_full_id:storyFullId is_posted_to_chat_page:Bool protect_content:Bool = Story;

//@description Changes content and caption of a story. Can be called only if story.can_be_edited == true
//@story_sender_chat_id Identifier of the chat that posted the story
//@story_id Identifier of the story to edit
//@content New content of the story; pass null to keep the current content
//@areas New clickable rectangle areas to be shown on the story media; pass null to keep the current areas. Areas can't be edited if story content isn't changed
//@caption New story caption; pass null to keep the current caption
editStory story_sender_chat_id:int53 story_id:int32 content:InputStoryContent areas:inputStoryAreas caption:formattedText = Ok;

//@description Changes privacy settings of a story. The method can be called only for stories posted on behalf of the current user and if story.can_be_edited == true
//@story_id Identifier of the story
//@privacy_settings The new privacy settigs for the story
setStoryPrivacySettings story_id:int32 privacy_settings:StoryPrivacySettings = Ok;

//@description Toggles whether a story is accessible after expiration. Can be called only if story.can_toggle_is_posted_to_chat_page == true
//@story_sender_chat_id Identifier of the chat that posted the story
//@story_id Identifier of the story
//@is_posted_to_chat_page Pass true to make the story accessible after expiration; pass false to make it private
toggleStoryIsPostedToChatPage story_sender_chat_id:int53 story_id:int32 is_posted_to_chat_page:Bool = Ok;

//@description Deletes a previously sent story. Can be called only if story.can_be_deleted == true
//@story_sender_chat_id Identifier of the chat that posted the story
//@story_id Identifier of the story to delete
deleteStory story_sender_chat_id:int53 story_id:int32 = Ok;

//@description Returns the list of chats with non-default notification settings for stories
getStoryNotificationSettingsExceptions = Chats;

//@description Loads more active stories from a story list. The loaded stories will be sent through updates. Active stories are sorted by
//-the pair (active_stories.order, active_stories.story_sender_chat_id) in descending order. Returns a 404 error if all active stories have been loaded
//@story_list The story list in which to load active stories
loadActiveStories story_list:StoryList = Ok;

//@description Changes story list in which stories from the chat are shown @chat_id Identifier of the chat that posted stories @story_list New list for active stories posted by the chat
setChatActiveStoriesList chat_id:int53 story_list:StoryList = Ok;

//@description Returns the list of active stories posted by the given chat @chat_id Chat identifier
getChatActiveStories chat_id:int53 = ChatActiveStories;

//@description Returns the list of stories that posted by the given chat to its chat page. If from_story_id == 0, then pinned stories are returned first.
//-Then, stories are returned in a reverse chronological order (i.e., in order of decreasing story_id). For optimal performance, the number of returned stories is chosen by TDLib
//@chat_id Chat identifier
//@from_story_id Identifier of the story starting from which stories must be returned; use 0 to get results from pinned and the newest story
//@limit The maximum number of stories to be returned
//-For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
getChatPostedToChatPageStories chat_id:int53 from_story_id:int32 limit:int32 = Stories;

//@description Returns the list of all stories posted by the given chat; requires can_edit_stories right in the chat.
//-The stories are returned in a reverse chronological order (i.e., in order of decreasing story_id). For optimal performance, the number of returned stories is chosen by TDLib
//@chat_id Chat identifier
//@from_story_id Identifier of the story starting from which stories must be returned; use 0 to get results from the last story
//@limit The maximum number of stories to be returned
//-For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
getChatArchivedStories chat_id:int53 from_story_id:int32 limit:int32 = Stories;

//@description Changes the list of pinned stories on a chat page; requires can_edit_stories right in the chat
//@chat_id Identifier of the chat that posted the stories
//@story_ids New list of pinned stories. All stories must be posted to the chat page first. There can be up to getOption("pinned_story_count_max") pinned stories on a chat page
setChatPinnedStories chat_id:int53 story_ids:vector<int32> = Ok;

//@description Informs TDLib that a story is opened and is being viewed by the user
//@story_sender_chat_id The identifier of the sender of the opened story
//@story_id The identifier of the story
openStory story_sender_chat_id:int53 story_id:int32 = Ok;

//@description Informs TDLib that a story is closed by the user
//@story_sender_chat_id The identifier of the sender of the story to close
//@story_id The identifier of the story
closeStory story_sender_chat_id:int53 story_id:int32 = Ok;

//@description Returns reactions, which can be chosen for a story @row_size Number of reaction per row, 5-25
getStoryAvailableReactions row_size:int32 = AvailableReactions;

//@description Changes chosen reaction on a story that has already been sent
//@story_sender_chat_id The identifier of the sender of the story
//@story_id The identifier of the story
//@reaction_type Type of the reaction to set; pass null to remove the reaction. `reactionTypeCustomEmoji` reactions can be used only by Telegram Premium users
//@update_recent_reactions Pass true if the reaction needs to be added to recent reactions
setStoryReaction story_sender_chat_id:int53 story_id:int32 reaction_type:ReactionType update_recent_reactions:Bool = Ok;

//@description Returns interactions with a story. The method can be called only for stories posted on behalf of the current user
//@story_id Story identifier
//@query Query to search for in names, usernames and titles; may be empty to get all relevant interactions
//@only_contacts Pass true to get only interactions by contacts; pass false to get all relevant interactions
//@prefer_forwards Pass true to get forwards and reposts first, then reactions, then other views; pass false to get interactions sorted just by interaction date
//@prefer_with_reaction Pass true to get interactions with reaction first; pass false to get interactions sorted just by interaction date. Ignored if prefer_forwards == true
//@offset Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
//@limit The maximum number of story interactions to return
getStoryInteractions story_id:int32 query:string only_contacts:Bool prefer_forwards:Bool prefer_with_reaction:Bool offset:string limit:int32 = StoryInteractions;

//@description Returns interactions with a story posted in a chat. Can be used only if story is posted on behalf of a chat and the user is an administrator in the chat
//@story_sender_chat_id The identifier of the sender of the story
//@story_id Story identifier
//@reaction_type Pass the default heart reaction or a suggested reaction type to receive only interactions with the specified reaction type; pass null to receive all interactions
//@prefer_forwards Pass true to get forwards and reposts first, then reactions, then other views; pass false to get interactions sorted just by interaction date
//@offset Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
//@limit The maximum number of story interactions to return
getChatStoryInteractions story_sender_chat_id:int53 story_id:int32 reaction_type:ReactionType prefer_forwards:Bool offset:string limit:int32 = StoryInteractions;

//@description Reports a story to the Telegram moderators
//@story_sender_chat_id The identifier of the sender of the story to report
//@story_id The identifier of the story to report
//@reason The reason for reporting the story
//@text Additional report details; 0-1024 characters
reportStory story_sender_chat_id:int53 story_id:int32 reason:ReportReason text:string = Ok;

//@description Activates stealth mode for stories, which hides all views of stories from the current user in the last "story_stealth_mode_past_period" seconds
//-and for the next "story_stealth_mode_future_period" seconds; for Telegram Premium users only
activateStoryStealthMode = Ok;

//@description Returns forwards of a story as a message to public chats and reposts by public channels. Can be used only if the story is posted on behalf of the current user or story.can_get_statistics == true.
//-For optimal performance, the number of returned messages and stories is chosen by TDLib
//@story_sender_chat_id The identifier of the sender of the story
//@story_id The identifier of the story
//@offset Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
//@limit The maximum number of messages and stories to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit
getStoryPublicForwards story_sender_chat_id:int53 story_id:int32 offset:string limit:int32 = PublicForwards;


//@description Returns the list of features available on the specific chat boost level; this is an offline request
//@is_channel Pass true to get the list of features for channels; pass false to get the list of features for supergroups
//@level Chat boost level
getChatBoostLevelFeatures is_channel:Bool level:int32 = ChatBoostLevelFeatures;

//@description Returns the list of features available for different chat boost levels; this is an offline request
//@is_channel Pass true to get the list of features for channels; pass false to get the list of features for supergroups
getChatBoostFeatures is_channel:Bool = ChatBoostFeatures;

//@description Returns the list of available chat boost slots for the current user
getAvailableChatBoostSlots = ChatBoostSlots;

//@description Returns the current boost status for a supergroup or a channel chat @chat_id Identifier of the chat
getChatBoostStatus chat_id:int53 = ChatBoostStatus;

//@description Boosts a chat and returns the list of available chat boost slots for the current user after the boost
//@chat_id Identifier of the chat
//@slot_ids Identifiers of boost slots of the current user from which to apply boosts to the chat
boostChat chat_id:int53 slot_ids:vector<int32> = ChatBoostSlots;

//@description Returns an HTTPS link to boost the specified supergroup or channel chat @chat_id Identifier of the chat
getChatBoostLink chat_id:int53 = ChatBoostLink;

//@description Returns information about a link to boost a chat. Can be called for any internal link of the type internalLinkTypeChatBoost @url The link to boost a chat
getChatBoostLinkInfo url:string = ChatBoostLinkInfo;

//@description Returns the list of boosts applied to a chat; requires administrator rights in the chat
//@chat_id Identifier of the chat
//@only_gift_codes Pass true to receive only boosts received from gift codes and giveaways created by the chat
//@offset Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
//@limit The maximum number of boosts to be returned; up to 100. For optimal performance, the number of returned boosts can be smaller than the specified limit
getChatBoosts chat_id:int53 only_gift_codes:Bool offset:string limit:int32 = FoundChatBoosts;

//@description Returns the list of boosts applied to a chat by a given user; requires administrator rights in the chat; for bots only
//@chat_id Identifier of the chat
//@user_id Identifier of the user
getUserChatBoosts chat_id:int53 user_id:int53 = FoundChatBoosts;


//@description Returns information about a bot that can be added to attachment or side menu @bot_user_id Bot's user identifier
getAttachmentMenuBot bot_user_id:int53 = AttachmentMenuBot;

//@description Adds or removes a bot to attachment and side menu. Bot can be added to the menu, only if userTypeBot.can_be_added_to_attachment_menu == true
//@bot_user_id Bot's user identifier
//@is_added Pass true to add the bot to attachment menu; pass false to remove the bot from attachment menu
//@allow_write_access Pass true if the current user allowed the bot to send them messages. Ignored if is_added is false
toggleBotIsAddedToAttachmentMenu bot_user_id:int53 is_added:Bool allow_write_access:Bool = Ok;


//@description Returns up to 8 emoji statuses, which must be shown right after the default Premium Badge in the emoji status list for self status
getThemedEmojiStatuses = EmojiStatuses;

//@description Returns recent emoji statuses for self status
getRecentEmojiStatuses = EmojiStatuses;

//@description Returns default emoji statuses for self status
getDefaultEmojiStatuses = EmojiStatuses;

//@description Clears the list of recently used emoji statuses for self status
clearRecentEmojiStatuses = Ok;


//@description Returns up to 8 emoji statuses, which must be shown in the emoji status list for chats
getThemedChatEmojiStatuses = EmojiStatuses;

//@description Returns default emoji statuses for chats
getDefaultChatEmojiStatuses = EmojiStatuses;

//@description Returns the list of emoji statuses, which can't be used as chat emoji status, even they are from a sticker set with is_allowed_as_chat_emoji_status == true
getDisallowedChatEmojiStatuses = EmojiStatuses;


//@description Downloads a file from the cloud. Download progress and completion of the download will be notified through updateFile updates
//@file_id Identifier of the file to download
//@priority Priority of the download (1-32). The higher the priority, the earlier the file will be downloaded. If the priorities of two files are equal, then the last one for which downloadFile/addFileToDownloads was called will be downloaded first
//@offset The starting position from which the file needs to be downloaded
//@limit Number of bytes which need to be downloaded starting from the "offset" position before the download will automatically be canceled; use 0 to download without a limit
//@synchronous Pass true to return response only after the file download has succeeded, has failed, has been canceled, or a new downloadFile request with different offset/limit parameters was sent; pass false to return file state immediately, just after the download has been started
downloadFile file_id:int32 priority:int32 offset:int53 limit:int53 synchronous:Bool = File;

//@description Returns file downloaded prefix size from a given offset, in bytes @file_id Identifier of the file @offset Offset from which downloaded prefix size needs to be calculated
getFileDownloadedPrefixSize file_id:int32 offset:int53 = FileDownloadedPrefixSize;

//@description Stops the downloading of a file. If a file has already been downloaded, does nothing @file_id Identifier of a file to stop downloading @only_if_pending Pass true to stop downloading only if it hasn't been started, i.e. request hasn't been sent to server
cancelDownloadFile file_id:int32 only_if_pending:Bool = Ok;

//@description Returns suggested name for saving a file in a given directory @file_id Identifier of the file @directory Directory in which the file is supposed to be saved
getSuggestedFileName file_id:int32 directory:string = Text;

//@description Preliminary uploads a file to the cloud before sending it in a message, which can be useful for uploading of being recorded voice and video notes.
//-In all other cases there is no need to preliminary upload a file. Updates updateFile will be used to notify about upload progress.
//-The upload will not be completed until the file is sent in a message
//@file File to upload
//@file_type File type; pass null if unknown
//@priority Priority of the upload (1-32). The higher the priority, the earlier the file will be uploaded. If the priorities of two files are equal, then the first one for which preliminaryUploadFile was called will be uploaded first
preliminaryUploadFile file:InputFile file_type:FileType priority:int32 = File;

//@description Stops the preliminary uploading of a file. Supported only for files uploaded by using preliminaryUploadFile. For other files the behavior is undefined @file_id Identifier of the file to stop uploading
cancelPreliminaryUploadFile file_id:int32 = Ok;

//@description Writes a part of a generated file. This method is intended to be used only if the application has no direct access to TDLib's file system, because it is usually slower than a direct write to the destination file
//@generation_id The identifier of the generation process
//@offset The offset from which to write the data to the file
//@data The data to write
writeGeneratedFilePart generation_id:int64 offset:int53 data:bytes = Ok;

//@description Informs TDLib on a file generation progress
//@generation_id The identifier of the generation process
//@expected_size Expected size of the generated file, in bytes; 0 if unknown
//@local_prefix_size The number of bytes already generated
setFileGenerationProgress generation_id:int64 expected_size:int53 local_prefix_size:int53 = Ok;

//@description Finishes the file generation
//@generation_id The identifier of the generation process
//@error If passed, the file generation has failed and must be terminated; pass null if the file generation succeeded
finishFileGeneration generation_id:int64 error:error = Ok;

//@description Reads a part of a file from the TDLib file cache and returns read bytes. This method is intended to be used only if the application has no direct access to TDLib's file system, because it is usually slower than a direct read from the file
//@file_id Identifier of the file. The file must be located in the TDLib file cache
//@offset The offset from which to read the file
//@count Number of bytes to read. An error will be returned if there are not enough bytes available in the file from the specified position. Pass 0 to read all available data from the specified position
readFilePart file_id:int32 offset:int53 count:int53 = FilePart;

//@description Deletes a file from the TDLib file cache @file_id Identifier of the file to delete
deleteFile file_id:int32 = Ok;

//@description Adds a file from a message to the list of file downloads. Download progress and completion of the download will be notified through updateFile updates.
//-If message database is used, the list of file downloads is persistent across application restarts. The downloading is independent of download using downloadFile, i.e. it continues if downloadFile is canceled or is used to download a part of the file
//@file_id Identifier of the file to download
//@chat_id Chat identifier of the message with the file
//@message_id Message identifier
//@priority Priority of the download (1-32). The higher the priority, the earlier the file will be downloaded. If the priorities of two files are equal, then the last one for which downloadFile/addFileToDownloads was called will be downloaded first
addFileToDownloads file_id:int32 chat_id:int53 message_id:int53 priority:int32 = File;

//@description Changes pause state of a file in the file download list
//@file_id Identifier of the downloaded file
//@is_paused Pass true if the download is paused
toggleDownloadIsPaused file_id:int32 is_paused:Bool = Ok;

//@description Changes pause state of all files in the file download list @are_paused Pass true to pause all downloads; pass false to unpause them
toggleAllDownloadsArePaused are_paused:Bool = Ok;

//@description Removes a file from the file download list @file_id Identifier of the downloaded file @delete_from_cache Pass true to delete the file from the TDLib file cache
removeFileFromDownloads file_id:int32 delete_from_cache:Bool = Ok;

//@description Removes all files from the file download list
//@only_active Pass true to remove only active downloads, including paused
//@only_completed Pass true to remove only completed downloads
//@delete_from_cache Pass true to delete the file from the TDLib file cache
removeAllFilesFromDownloads only_active:Bool only_completed:Bool delete_from_cache:Bool = Ok;

//@description Searches for files in the file download list or recently downloaded files from the list
//@query Query to search for; may be empty to return all downloaded files
//@only_active Pass true to search only for active downloads, including paused
//@only_completed Pass true to search only for completed downloads
//@offset Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
//@limit The maximum number of files to be returned
searchFileDownloads query:string only_active:Bool only_completed:Bool offset:string limit:int32 = FoundFileDownloads;


//@description Returns information about a file with messages exported from another application @message_file_head Beginning of the message file; up to 100 first lines
getMessageFileType message_file_head:string = MessageFileType;

//@description Returns a confirmation text to be shown to the user before starting message import
//@chat_id Identifier of a chat to which the messages will be imported. It must be an identifier of a private chat with a mutual contact or an identifier of a supergroup chat with can_change_info member right
getMessageImportConfirmationText chat_id:int53 = Text;

//@description Imports messages exported from another app
//@chat_id Identifier of a chat to which the messages will be imported. It must be an identifier of a private chat with a mutual contact or an identifier of a supergroup chat with can_change_info member right
//@message_file File with messages to import. Only inputFileLocal and inputFileGenerated are supported. The file must not be previously uploaded
//@attached_files Files used in the imported messages. Only inputFileLocal and inputFileGenerated are supported. The files must not be previously uploaded
importMessages chat_id:int53 message_file:InputFile attached_files:vector<InputFile> = Ok;


//@description Replaces current primary invite link for a chat with a new primary invite link. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right @chat_id Chat identifier
replacePrimaryChatInviteLink chat_id:int53 = ChatInviteLink;

//@description Creates a new invite link for a chat. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right in the chat
//@chat_id Chat identifier
//@name Invite link name; 0-32 characters
//@expiration_date Point in time (Unix timestamp) when the link will expire; pass 0 if never
//@member_limit The maximum number of chat members that can join the chat via the link simultaneously; 0-99999; pass 0 if not limited
//@creates_join_request Pass true if users joining the chat via the link need to be approved by chat administrators. In this case, member_limit must be 0
createChatInviteLink chat_id:int53 name:string expiration_date:int32 member_limit:int32 creates_join_request:Bool = ChatInviteLink;

//@description Edits a non-primary invite link for a chat. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
//@chat_id Chat identifier
//@invite_link Invite link to be edited
//@name Invite link name; 0-32 characters
//@expiration_date Point in time (Unix timestamp) when the link will expire; pass 0 if never
//@member_limit The maximum number of chat members that can join the chat via the link simultaneously; 0-99999; pass 0 if not limited
//@creates_join_request Pass true if users joining the chat via the link need to be approved by chat administrators. In this case, member_limit must be 0
editChatInviteLink chat_id:int53 invite_link:string name:string expiration_date:int32 member_limit:int32 creates_join_request:Bool = ChatInviteLink;

//@description Returns information about an invite link. Requires administrator privileges and can_invite_users right in the chat to get own links and owner privileges to get other links
//@chat_id Chat identifier
//@invite_link Invite link to get
getChatInviteLink chat_id:int53 invite_link:string = ChatInviteLink;

//@description Returns the list of chat administrators with number of their invite links. Requires owner privileges in the chat @chat_id Chat identifier
getChatInviteLinkCounts chat_id:int53 = ChatInviteLinkCounts;

//@description Returns invite links for a chat created by specified administrator. Requires administrator privileges and can_invite_users right in the chat to get own links and owner privileges to get other links
//@chat_id Chat identifier
//@creator_user_id User identifier of a chat administrator. Must be an identifier of the current user for non-owner
//@is_revoked Pass true if revoked links needs to be returned instead of active or expired
//@offset_date Creation date of an invite link starting after which to return invite links; use 0 to get results from the beginning
//@offset_invite_link Invite link starting after which to return invite links; use empty string to get results from the beginning
//@limit The maximum number of invite links to return; up to 100
getChatInviteLinks chat_id:int53 creator_user_id:int53 is_revoked:Bool offset_date:int32 offset_invite_link:string limit:int32 = ChatInviteLinks;

//@description Returns chat members joined a chat via an invite link. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
//@chat_id Chat identifier
//@invite_link Invite link for which to return chat members
//@offset_member A chat member from which to return next chat members; pass null to get results from the beginning
//@limit The maximum number of chat members to return; up to 100
getChatInviteLinkMembers chat_id:int53 invite_link:string offset_member:chatInviteLinkMember limit:int32 = ChatInviteLinkMembers;

//@description Revokes invite link for a chat. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links.
//-If a primary link is revoked, then additionally to the revoked link returns new primary link
//@chat_id Chat identifier
//@invite_link Invite link to be revoked
revokeChatInviteLink chat_id:int53 invite_link:string = ChatInviteLinks;

//@description Deletes revoked chat invite links. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links @chat_id Chat identifier @invite_link Invite link to revoke
deleteRevokedChatInviteLink chat_id:int53 invite_link:string = Ok;

//@description Deletes all revoked chat invite links created by a given chat administrator. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
//@chat_id Chat identifier
//@creator_user_id User identifier of a chat administrator, which links will be deleted. Must be an identifier of the current user for non-owner
deleteAllRevokedChatInviteLinks chat_id:int53 creator_user_id:int53 = Ok;

//@description Checks the validity of an invite link for a chat and returns information about the corresponding chat @invite_link Invite link to be checked
checkChatInviteLink invite_link:string = ChatInviteLinkInfo;

//@description Uses an invite link to add the current user to the chat if possible. May return an error with a message "INVITE_REQUEST_SENT" if only a join request was created @invite_link Invite link to use
joinChatByInviteLink invite_link:string = Chat;

//@description Returns pending join requests in a chat
//@chat_id Chat identifier
//@invite_link Invite link for which to return join requests. If empty, all join requests will be returned. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
//@query A query to search for in the first names, last names and usernames of the users to return
//@offset_request A chat join request from which to return next requests; pass null to get results from the beginning
//@limit The maximum number of requests to join the chat to return
getChatJoinRequests chat_id:int53 invite_link:string query:string offset_request:chatJoinRequest limit:int32 = ChatJoinRequests;

//@description Handles a pending join request in a chat @chat_id Chat identifier @user_id Identifier of the user that sent the request @approve Pass true to approve the request; pass false to decline it
processChatJoinRequest chat_id:int53 user_id:int53 approve:Bool = Ok;

//@description Handles all pending join requests for a given link in a chat
//@chat_id Chat identifier
//@invite_link Invite link for which to process join requests. If empty, all join requests will be processed. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
//@approve Pass true to approve all requests; pass false to decline them
processChatJoinRequests chat_id:int53 invite_link:string approve:Bool = Ok;


//@description Creates a new call @user_id Identifier of the user to be called @protocol The call protocols supported by the application @is_video Pass true to create a video call
createCall user_id:int53 protocol:callProtocol is_video:Bool = CallId;

//@description Accepts an incoming call @call_id Call identifier @protocol The call protocols supported by the application
acceptCall call_id:int32 protocol:callProtocol = Ok;

//@description Sends call signaling data @call_id Call identifier @data The data
sendCallSignalingData call_id:int32 data:bytes = Ok;

//@description Discards a call
//@call_id Call identifier
//@is_disconnected Pass true if the user was disconnected
//@duration The call duration, in seconds
//@is_video Pass true if the call was a video call
//@connection_id Identifier of the connection used during the call
discardCall call_id:int32 is_disconnected:Bool duration:int32 is_video:Bool connection_id:int64 = Ok;

//@description Sends a call rating
//@call_id Call identifier
//@rating Call rating; 1-5
//@comment An optional user comment if the rating is less than 5
//@problems List of the exact types of problems with the call, specified by the user
sendCallRating call_id:int32 rating:int32 comment:string problems:vector<CallProblem> = Ok;

//@description Sends debug information for a call to Telegram servers @call_id Call identifier @debug_information Debug information in application-specific format
sendCallDebugInformation call_id:int32 debug_information:string = Ok;

//@description Sends log file for a call to Telegram servers @call_id Call identifier @log_file Call log file. Only inputFileLocal and inputFileGenerated are supported
sendCallLog call_id:int32 log_file:InputFile = Ok;


//@description Returns the list of participant identifiers, on whose behalf a video chat in the chat can be joined @chat_id Chat identifier
getVideoChatAvailableParticipants chat_id:int53 = MessageSenders;

//@description Changes default participant identifier, on whose behalf a video chat in the chat will be joined @chat_id Chat identifier @default_participant_id Default group call participant identifier to join the video chats
setVideoChatDefaultParticipant chat_id:int53 default_participant_id:MessageSender = Ok;

//@description Creates a video chat (a group call bound to a chat). Available only for basic groups, supergroups and channels; requires can_manage_video_chats administrator right
//@chat_id Identifier of a chat in which the video chat will be created
//@title Group call title; if empty, chat title will be used
//@start_date Point in time (Unix timestamp) when the group call is supposed to be started by an administrator; 0 to start the video chat immediately. The date must be at least 10 seconds and at most 8 days in the future
//@is_rtmp_stream Pass true to create an RTMP stream instead of an ordinary video chat; requires owner privileges
createVideoChat chat_id:int53 title:string start_date:int32 is_rtmp_stream:Bool = GroupCallId;

//@description Returns RTMP URL for streaming to the chat; requires owner privileges @chat_id Chat identifier
getVideoChatRtmpUrl chat_id:int53 = RtmpUrl;

//@description Replaces the current RTMP URL for streaming to the chat; requires owner privileges @chat_id Chat identifier
replaceVideoChatRtmpUrl chat_id:int53 = RtmpUrl;

//@description Returns information about a group call @group_call_id Group call identifier
getGroupCall group_call_id:int32 = GroupCall;

//@description Starts a scheduled group call @group_call_id Group call identifier
startScheduledGroupCall group_call_id:int32 = Ok;

//@description Toggles whether the current user will receive a notification when the group call starts; scheduled group calls only
//@group_call_id Group call identifier
//@enabled_start_notification New value of the enabled_start_notification setting
toggleGroupCallEnabledStartNotification group_call_id:int32 enabled_start_notification:Bool = Ok;

//@description Joins an active group call. Returns join response payload for tgcalls
//@group_call_id Group call identifier
//@participant_id Identifier of a group call participant, which will be used to join the call; pass null to join as self; video chats only
//@audio_source_id Caller audio channel synchronization source identifier; received from tgcalls
//@payload Group call join payload; received from tgcalls
//@is_muted Pass true to join the call with muted microphone
//@is_my_video_enabled Pass true if the user's video is enabled
//@invite_hash If non-empty, invite hash to be used to join the group call without being muted by administrators
joinGroupCall group_call_id:int32 participant_id:MessageSender audio_source_id:int32 payload:string is_muted:Bool is_my_video_enabled:Bool invite_hash:string = Text;

//@description Starts screen sharing in a joined group call. Returns join response payload for tgcalls
//@group_call_id Group call identifier
//@audio_source_id Screen sharing audio channel synchronization source identifier; received from tgcalls
//@payload Group call join payload; received from tgcalls
startGroupCallScreenSharing group_call_id:int32 audio_source_id:int32 payload:string = Text;

//@description Pauses or unpauses screen sharing in a joined group call @group_call_id Group call identifier @is_paused Pass true to pause screen sharing; pass false to unpause it
toggleGroupCallScreenSharingIsPaused group_call_id:int32 is_paused:Bool = Ok;

//@description Ends screen sharing in a joined group call @group_call_id Group call identifier
endGroupCallScreenSharing group_call_id:int32 = Ok;

//@description Sets group call title. Requires groupCall.can_be_managed group call flag @group_call_id Group call identifier @title New group call title; 1-64 characters
setGroupCallTitle group_call_id:int32 title:string = Ok;

//@description Toggles whether new participants of a group call can be unmuted only by administrators of the group call. Requires groupCall.can_toggle_mute_new_participants group call flag
//@group_call_id Group call identifier
//@mute_new_participants New value of the mute_new_participants setting
toggleGroupCallMuteNewParticipants group_call_id:int32 mute_new_participants:Bool = Ok;

//@description Invites users to an active group call. Sends a service message of type messageInviteVideoChatParticipants for video chats
//@group_call_id Group call identifier
//@user_ids User identifiers. At most 10 users can be invited simultaneously
inviteGroupCallParticipants group_call_id:int32 user_ids:vector<int53> = Ok;

//@description Returns invite link to a video chat in a public chat
//@group_call_id Group call identifier
//@can_self_unmute Pass true if the invite link needs to contain an invite hash, passing which to joinGroupCall would allow the invited user to unmute themselves. Requires groupCall.can_be_managed group call flag
getGroupCallInviteLink group_call_id:int32 can_self_unmute:Bool = HttpUrl;

//@description Revokes invite link for a group call. Requires groupCall.can_be_managed group call flag @group_call_id Group call identifier
revokeGroupCallInviteLink group_call_id:int32 = Ok;

//@description Starts recording of an active group call. Requires groupCall.can_be_managed group call flag
//@group_call_id Group call identifier
//@title Group call recording title; 0-64 characters
//@record_video Pass true to record a video file instead of an audio file
//@use_portrait_orientation Pass true to use portrait orientation for video instead of landscape one
startGroupCallRecording group_call_id:int32 title:string record_video:Bool use_portrait_orientation:Bool = Ok;

//@description Ends recording of an active group call. Requires groupCall.can_be_managed group call flag @group_call_id Group call identifier
endGroupCallRecording group_call_id:int32 = Ok;

//@description Toggles whether current user's video is paused @group_call_id Group call identifier @is_my_video_paused Pass true if the current user's video is paused
toggleGroupCallIsMyVideoPaused group_call_id:int32 is_my_video_paused:Bool = Ok;

//@description Toggles whether current user's video is enabled @group_call_id Group call identifier @is_my_video_enabled Pass true if the current user's video is enabled
toggleGroupCallIsMyVideoEnabled group_call_id:int32 is_my_video_enabled:Bool = Ok;

//@description Informs TDLib that speaking state of a participant of an active group has changed
//@group_call_id Group call identifier
//@audio_source Group call participant's synchronization audio source identifier, or 0 for the current user
//@is_speaking Pass true if the user is speaking
setGroupCallParticipantIsSpeaking group_call_id:int32 audio_source:int32 is_speaking:Bool = Ok;

//@description Toggles whether a participant of an active group call is muted, unmuted, or allowed to unmute themselves
//@group_call_id Group call identifier
//@participant_id Participant identifier
//@is_muted Pass true to mute the user; pass false to unmute them
toggleGroupCallParticipantIsMuted group_call_id:int32 participant_id:MessageSender is_muted:Bool = Ok;

//@description Changes volume level of a participant of an active group call. If the current user can manage the group call, then the participant's volume level will be changed for all users with the default volume level
//@group_call_id Group call identifier
//@participant_id Participant identifier
//@volume_level New participant's volume level; 1-20000 in hundreds of percents
setGroupCallParticipantVolumeLevel group_call_id:int32 participant_id:MessageSender volume_level:int32 = Ok;

//@description Toggles whether a group call participant hand is rased
//@group_call_id Group call identifier
//@participant_id Participant identifier
//@is_hand_raised Pass true if the user's hand needs to be raised. Only self hand can be raised. Requires groupCall.can_be_managed group call flag to lower other's hand
toggleGroupCallParticipantIsHandRaised group_call_id:int32 participant_id:MessageSender is_hand_raised:Bool = Ok;

//@description Loads more participants of a group call. The loaded participants will be received through updates. Use the field groupCall.loaded_all_participants to check whether all participants have already been loaded
//@group_call_id Group call identifier. The group call must be previously received through getGroupCall and must be joined or being joined
//@limit The maximum number of participants to load; up to 100
loadGroupCallParticipants group_call_id:int32 limit:int32 = Ok;

//@description Leaves a group call @group_call_id Group call identifier
leaveGroupCall group_call_id:int32 = Ok;

//@description Ends a group call. Requires groupCall.can_be_managed @group_call_id Group call identifier
endGroupCall group_call_id:int32 = Ok;

//@description Returns information about available group call streams @group_call_id Group call identifier
getGroupCallStreams group_call_id:int32 = GroupCallStreams;

//@description Returns a file with a segment of a group call stream in a modified OGG format for audio or MPEG-4 format for video
//@group_call_id Group call identifier
//@time_offset Point in time when the stream segment begins; Unix timestamp in milliseconds
//@scale Segment duration scale; 0-1. Segment's duration is 1000/(2**scale) milliseconds
//@channel_id Identifier of an audio/video channel to get as received from tgcalls
//@video_quality Video quality as received from tgcalls; pass null to get the worst available quality
getGroupCallStreamSegment group_call_id:int32 time_offset:int53 scale:int32 channel_id:int32 video_quality:GroupCallVideoQuality = FilePart;


//@description Changes the block list of a message sender. Currently, only users and supergroup chats can be blocked
//@sender_id Identifier of a message sender to block/unblock
//@block_list New block list for the message sender; pass null to unblock the message sender
setMessageSenderBlockList sender_id:MessageSender block_list:BlockList = Ok;

//@description Blocks an original sender of a message in the Replies chat
//@message_id The identifier of an incoming message in the Replies chat
//@delete_message Pass true to delete the message
//@delete_all_messages Pass true to delete all messages from the same sender
//@report_spam Pass true to report the sender to the Telegram moderators
blockMessageSenderFromReplies message_id:int53 delete_message:Bool delete_all_messages:Bool report_spam:Bool = Ok;

//@description Returns users and chats that were blocked by the current user
//@block_list Block list from which to return users
//@offset Number of users and chats to skip in the result; must be non-negative
//@limit The maximum number of users and chats to return; up to 100
getBlockedMessageSenders block_list:BlockList offset:int32 limit:int32 = MessageSenders;


//@description Adds a user to the contact list or edits an existing contact by their user identifier
//@contact The contact to add or edit; phone number may be empty and needs to be specified only if known, vCard is ignored
//@share_phone_number Pass true to share the current user's phone number with the new contact. A corresponding rule to userPrivacySettingShowPhoneNumber will be added if needed.
//-Use the field userFullInfo.need_phone_number_privacy_exception to check whether the current user needs to be asked to share their phone number
addContact contact:contact share_phone_number:Bool = Ok;

//@description Adds new contacts or edits existing contacts by their phone numbers; contacts' user identifiers are ignored @contacts The list of contacts to import or edit; contacts' vCard are ignored and are not imported
importContacts contacts:vector<contact> = ImportedContacts;

//@description Returns all contacts of the user
getContacts = Users;

//@description Searches for the specified query in the first names, last names and usernames of the known user contacts
//@query Query to search for; may be empty to return all contacts
//@limit The maximum number of users to be returned
searchContacts query:string limit:int32 = Users;

//@description Removes users from the contact list @user_ids Identifiers of users to be deleted
removeContacts user_ids:vector<int53> = Ok;

//@description Returns the total number of imported contacts
getImportedContactCount = Count;

//@description Changes imported contacts using the list of contacts saved on the device. Imports newly added contacts and, if at least the file database is enabled, deletes recently deleted contacts.
//-Query result depends on the result of the previous query, so only one query is possible at the same time
//@contacts The new list of contacts, contact's vCard are ignored and are not imported
changeImportedContacts contacts:vector<contact> = ImportedContacts;

//@description Clears all imported contacts, contact list remains unchanged
clearImportedContacts = Ok;

//@description Changes the list of close friends of the current user @user_ids User identifiers of close friends; the users must be contacts of the current user
setCloseFriends user_ids:vector<int53> = Ok;

//@description Returns all close friends of the current user
getCloseFriends = Users;

//@description Changes a personal profile photo of a contact user @user_id User identifier @photo Profile photo to set; pass null to delete the photo; inputChatPhotoPrevious isn't supported in this function
setUserPersonalProfilePhoto user_id:int53 photo:InputChatPhoto = Ok;

//@description Suggests a profile photo to another regular user with common messages @user_id User identifier @photo Profile photo to suggest; inputChatPhotoPrevious isn't supported in this function
suggestUserProfilePhoto user_id:int53 photo:InputChatPhoto = Ok;


//@description Searches a user by their phone number. Returns a 404 error if the user can't be found @phone_number Phone number to search for
searchUserByPhoneNumber phone_number:string = User;

//@description Shares the phone number of the current user with a mutual contact. Supposed to be called when the user clicks on chatActionBarSharePhoneNumber @user_id Identifier of the user with whom to share the phone number. The user must be a mutual contact
sharePhoneNumber user_id:int53 = Ok;


//@description Returns the profile photos of a user. Personal and public photo aren't returned @user_id User identifier @offset The number of photos to skip; must be non-negative @limit The maximum number of photos to be returned; up to 100
getUserProfilePhotos user_id:int53 offset:int32 limit:int32 = ChatPhotos;


//@description Returns stickers from the installed sticker sets that correspond to any of the given emoji or can be found by sticker-specific keywords. If the query is non-empty, then favorite, recently used or trending stickers may also be returned
//@sticker_type Type of the stickers to return
//@query Search query; a space-separated list of emoji or a keyword prefix. If empty, returns all known installed stickers
//@limit The maximum number of stickers to be returned
//@chat_id Chat identifier for which to return stickers. Available custom emoji stickers may be different for different chats
getStickers sticker_type:StickerType query:string limit:int32 chat_id:int53 = Stickers;

//@description Returns unique emoji that correspond to stickers to be found by the getStickers(sticker_type, query, 1000000, chat_id)
//@sticker_type Type of the stickers to search for
//@query Search query
//@chat_id Chat identifier for which to find stickers
//@return_only_main_emoji Pass true if only main emoji for each found sticker must be included in the result
getAllStickerEmojis sticker_type:StickerType query:string chat_id:int53 return_only_main_emoji:Bool = Emojis;

//@description Searches for stickers from public sticker sets that correspond to any of the given emoji
//@sticker_type Type of the stickers to return
//@emojis Space-separated list of emoji to search for; must be non-empty
//@limit The maximum number of stickers to be returned; 0-100
searchStickers sticker_type:StickerType emojis:string limit:int32 = Stickers;

//@description Returns greeting stickers from regular sticker sets that can be used for the start page of other users
getGreetingStickers = Stickers;

//@description Returns premium stickers from regular sticker sets @limit The maximum number of stickers to be returned; 0-100
getPremiumStickers limit:int32 = Stickers;

//@description Returns a list of installed sticker sets @sticker_type Type of the sticker sets to return
getInstalledStickerSets sticker_type:StickerType = StickerSets;

//@description Returns a list of archived sticker sets
//@sticker_type Type of the sticker sets to return
//@offset_sticker_set_id Identifier of the sticker set from which to return the result; use 0 to get results from the beginning
//@limit The maximum number of sticker sets to return; up to 100
getArchivedStickerSets sticker_type:StickerType offset_sticker_set_id:int64 limit:int32 = StickerSets;

//@description Returns a list of trending sticker sets. For optimal performance, the number of returned sticker sets is chosen by TDLib
//@sticker_type Type of the sticker sets to return
//@offset The offset from which to return the sticker sets; must be non-negative
//@limit The maximum number of sticker sets to be returned; up to 100. For optimal performance, the number of returned sticker sets is chosen by TDLib and can be smaller than the specified limit, even if the end of the list has not been reached
getTrendingStickerSets sticker_type:StickerType offset:int32 limit:int32 = TrendingStickerSets;

//@description Returns a list of sticker sets attached to a file, including regular, mask, and emoji sticker sets. Currently, only animations, photos, and videos can have attached sticker sets @file_id File identifier
getAttachedStickerSets file_id:int32 = StickerSets;

//@description Returns information about a sticker set by its identifier @set_id Identifier of the sticker set
getStickerSet set_id:int64 = StickerSet;

//@description Searches for a sticker set by its name @name Name of the sticker set
searchStickerSet name:string = StickerSet;

//@description Searches for installed sticker sets by looking for specified query in their title and name @sticker_type Type of the sticker sets to search for @query Query to search for @limit The maximum number of sticker sets to return
searchInstalledStickerSets sticker_type:StickerType query:string limit:int32 = StickerSets;

//@description Searches for sticker sets by looking for specified query in their title and name. Excludes installed sticker sets from the results
//@sticker_type Type of the sticker sets to return
//@query Query to search for
searchStickerSets sticker_type:StickerType query:string = StickerSets;

//@description Installs/uninstalls or activates/archives a sticker set @set_id Identifier of the sticker set @is_installed The new value of is_installed @is_archived The new value of is_archived. A sticker set can't be installed and archived simultaneously
changeStickerSet set_id:int64 is_installed:Bool is_archived:Bool = Ok;

//@description Informs the server that some trending sticker sets have been viewed by the user @sticker_set_ids Identifiers of viewed trending sticker sets
viewTrendingStickerSets sticker_set_ids:vector<int64> = Ok;

//@description Changes the order of installed sticker sets @sticker_type Type of the sticker sets to reorder @sticker_set_ids Identifiers of installed sticker sets in the new correct order
reorderInstalledStickerSets sticker_type:StickerType sticker_set_ids:vector<int64> = Ok;

//@description Returns a list of recently used stickers @is_attached Pass true to return stickers and masks that were recently attached to photos or video files; pass false to return recently sent stickers
getRecentStickers is_attached:Bool = Stickers;

//@description Manually adds a new sticker to the list of recently used stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first.
//-Only stickers belonging to a sticker set or in WEBP or WEBM format can be added to this list. Emoji stickers can't be added to recent stickers
//@is_attached Pass true to add the sticker to the list of stickers recently attached to photo or video files; pass false to add the sticker to the list of recently sent stickers
//@sticker Sticker file to add
addRecentSticker is_attached:Bool sticker:InputFile = Stickers;

//@description Removes a sticker from the list of recently used stickers @is_attached Pass true to remove the sticker from the list of stickers recently attached to photo or video files; pass false to remove the sticker from the list of recently sent stickers @sticker Sticker file to delete
removeRecentSticker is_attached:Bool sticker:InputFile = Ok;

//@description Clears the list of recently used stickers @is_attached Pass true to clear the list of stickers recently attached to photo or video files; pass false to clear the list of recently sent stickers
clearRecentStickers is_attached:Bool = Ok;

//@description Returns favorite stickers
getFavoriteStickers = Stickers;

//@description Adds a new sticker to the list of favorite stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first.
//-Only stickers belonging to a sticker set or in WEBP or WEBM format can be added to this list. Emoji stickers can't be added to favorite stickers
//@sticker Sticker file to add
addFavoriteSticker sticker:InputFile = Ok;

//@description Removes a sticker from the list of favorite stickers @sticker Sticker file to delete from the list
removeFavoriteSticker sticker:InputFile = Ok;

//@description Returns emoji corresponding to a sticker. The list is only for informational purposes, because a sticker is always sent with a fixed emoji from the corresponding Sticker object @sticker Sticker file identifier
getStickerEmojis sticker:InputFile = Emojis;

//@description Searches for emojis by keywords. Supported only if the file database is enabled. Order of results is unspecified
//@text Text to search for
//@input_language_codes List of possible IETF language tags of the user's input language; may be empty if unknown
searchEmojis text:string input_language_codes:vector<string> = EmojiKeywords;

//@description Return emojis matching the keyword. Supported only if the file database is enabled. Order of results is unspecified
//@text Text to search for
//@input_language_codes List of possible IETF language tags of the user's input language; may be empty if unknown
getKeywordEmojis text:string input_language_codes:vector<string> = Emojis;

//@description Returns available emojis categories @type Type of emoji categories to return; pass null to get default emoji categories
getEmojiCategories type:EmojiCategoryType = EmojiCategories;

//@description Returns an animated emoji corresponding to a given emoji. Returns a 404 error if the emoji has no animated emoji @emoji The emoji
getAnimatedEmoji emoji:string = AnimatedEmoji;

//@description Returns an HTTP URL which can be used to automatically log in to the translation platform and suggest new emoji replacements. The URL will be valid for 30 seconds after generation
//@language_code Language code for which the emoji replacements will be suggested
getEmojiSuggestionsUrl language_code:string = HttpUrl;

//@description Returns the list of custom emoji stickers by their identifiers. Stickers are returned in arbitrary order. Only found stickers are returned
//@custom_emoji_ids Identifiers of custom emoji stickers. At most 200 custom emoji stickers can be received simultaneously
getCustomEmojiStickers custom_emoji_ids:vector<int64> = Stickers;

//@description Returns default list of custom emoji stickers for placing on a chat photo
getDefaultChatPhotoCustomEmojiStickers = Stickers;

//@description Returns default list of custom emoji stickers for placing on a profile photo
getDefaultProfilePhotoCustomEmojiStickers = Stickers;

//@description Returns default list of custom emoji stickers for reply background
getDefaultBackgroundCustomEmojiStickers = Stickers;


//@description Returns saved animations
getSavedAnimations = Animations;

//@description Manually adds a new animation to the list of saved animations. The new animation is added to the beginning of the list. If the animation was already in the list, it is removed first.
//-Only non-secret video animations with MIME type "video/mp4" can be added to the list
//@animation The animation file to be added. Only animations known to the server (i.e., successfully sent via a message) can be added to the list
addSavedAnimation animation:InputFile = Ok;

//@description Removes an animation from the list of saved animations @animation Animation file to be removed
removeSavedAnimation animation:InputFile = Ok;


//@description Returns up to 20 recently used inline bots in the order of their last usage
getRecentInlineBots = Users;


//@description Searches for recently used hashtags by their prefix @prefix Hashtag prefix to search for @limit The maximum number of hashtags to be returned
searchHashtags prefix:string limit:int32 = Hashtags;

//@description Removes a hashtag from the list of recently used hashtags @hashtag Hashtag to delete
removeRecentHashtag hashtag:string = Ok;


//@description Returns a link preview by the text of a message. Do not call this function too often. Returns a 404 error if the text has no link preview
//@text Message text with formatting
//@link_preview_options Options to be used for generation of the link preview; pass null to use default link preview options
getWebPagePreview text:formattedText link_preview_options:linkPreviewOptions = WebPage;

//@description Returns an instant view version of a web page if available. Returns a 404 error if the web page has no instant view page @url The web page URL @force_full Pass true to get full instant view for the web page
getWebPageInstantView url:string force_full:Bool = WebPageInstantView;


//@description Changes a profile photo for the current user
//@photo Profile photo to set
//@is_public Pass true to set a public photo, which will be visible even the main photo is hidden by privacy settings
setProfilePhoto photo:InputChatPhoto is_public:Bool = Ok;

//@description Deletes a profile photo @profile_photo_id Identifier of the profile photo to delete
deleteProfilePhoto profile_photo_id:int64 = Ok;

//@description Changes accent color and background custom emoji for the current user; for Telegram Premium users only
//@accent_color_id Identifier of the accent color to use
//@background_custom_emoji_id Identifier of a custom emoji to be shown on the reply header and link preview background; 0 if none
setAccentColor accent_color_id:int32 background_custom_emoji_id:int64 = Ok;

//@description Changes accent color and background custom emoji for profile of the current user; for Telegram Premium users only
//@profile_accent_color_id Identifier of the accent color to use for profile; pass -1 if none
//@profile_background_custom_emoji_id Identifier of a custom emoji to be shown on the user's profile photo background; 0 if none
setProfileAccentColor profile_accent_color_id:int32 profile_background_custom_emoji_id:int64 = Ok;

//@description Changes the first and last name of the current user @first_name The new value of the first name for the current user; 1-64 characters @last_name The new value of the optional last name for the current user; 0-64 characters
setName first_name:string last_name:string = Ok;

//@description Changes the bio of the current user @bio The new value of the user bio; 0-getOption("bio_length_max") characters without line feeds
setBio bio:string = Ok;

//@description Changes the editable username of the current user
//@username The new value of the username. Use an empty string to remove the username. The username can't be completely removed if there is another active or disabled username
setUsername username:string = Ok;

//@description Changes active state for a username of the current user. The editable username can't be disabled. May return an error with a message "USERNAMES_ACTIVE_TOO_MUCH" if the maximum number of active usernames has been reached
//@username The username to change
//@is_active Pass true to activate the username; pass false to disable it
toggleUsernameIsActive username:string is_active:Bool = Ok;

//@description Changes order of active usernames of the current user @usernames The new order of active usernames. All currently active usernames must be specified
reorderActiveUsernames usernames:vector<string> = Ok;

//@description Changes the birthdate of the current user @birthdate The new value of the current user's birthdate; pass null to remove the birthdate
setBirthdate birthdate:birthdate = Ok;

//@description Changes the personal chat of the current user @chat_id Identifier of the new personal chat; pass 0 to remove the chat. Use getSuitablePersonalChats to get suitable chats
setPersonalChat chat_id:int53 = Ok;

//@description Changes the emoji status of the current user; for Telegram Premium users only @emoji_status New emoji status; pass null to switch to the default badge
setEmojiStatus emoji_status:emojiStatus = Ok;

//@description Changes the location of the current user. Needs to be called if getOption("is_location_visible") is true and location changes for more than 1 kilometer. Must not be called if the user has a business location @location The new location of the user
setLocation location:location = Ok;

//@description Toggles whether the current user has sponsored messages enabled. The setting has no effect for users without Telegram Premium for which sponsored messages are always enabled
//@has_sponsored_messages_enabled Pass true to enable sponsored messages for the current user; false to disable them
toggleHasSponsoredMessagesEnabled has_sponsored_messages_enabled:Bool = Ok;

//@description Changes the business location of the current user. Requires Telegram Business subscription @location The new location of the business; pass null to remove the location
setBusinessLocation location:businessLocation = Ok;

//@description Changes the business opening hours of the current user. Requires Telegram Business subscription
//@opening_hours The new opening hours of the business; pass null to remove the opening hours; up to 28 time intervals can be specified
setBusinessOpeningHours opening_hours:businessOpeningHours = Ok;

//@description Changes the business greeting message settings of the current user. Requires Telegram Business subscription @greeting_message_settings The new settings for the greeting message of the business; pass null to disable the greeting message
setBusinessGreetingMessageSettings greeting_message_settings:businessGreetingMessageSettings = Ok;

//@description Changes the business away message settings of the current user. Requires Telegram Business subscription @away_message_settings The new settings for the away message of the business; pass null to disable the away message
setBusinessAwayMessageSettings away_message_settings:businessAwayMessageSettings = Ok;

//@description Changes the business start page of the current user. Requires Telegram Business subscription @start_page The new start page of the business; pass null to remove custom start page
setBusinessStartPage start_page:inputBusinessStartPage = Ok;


//@description Sends a code to the specified phone number. Aborts previous phone number verification if there was one. On success, returns information about the sent code
//@phone_number The phone number, in international format
//@settings Settings for the authentication of the user's phone number; pass null to use default settings
//@type Type of the request for which the code is sent
sendPhoneNumberCode phone_number:string settings:phoneNumberAuthenticationSettings type:PhoneNumberCodeType = AuthenticationCodeInfo;

//@description Sends Firebase Authentication SMS to the specified phone number. Works only when received a code of the type authenticationCodeTypeFirebaseAndroid or authenticationCodeTypeFirebaseIos
//@token SafetyNet Attestation API token for the Android application, or secret from push notification for the iOS application
sendPhoneNumberFirebaseSms token:string = Ok;

//@description Reports that authentication code wasn't delivered via SMS to the specified phone number; for official mobile apps only @mobile_network_code Current mobile network code
reportPhoneNumberCodeMissing mobile_network_code:string = Ok;

//@description Resends the authentication code sent to a phone number. Works only if the previously received authenticationCodeInfo next_code_type was not null and the server-specified timeout has passed
resendPhoneNumberCode = AuthenticationCodeInfo;

//@description Check the authentication code and completes the request for which the code was sent if appropriate @code Authentication code to check
checkPhoneNumberCode code:string = Ok;


//@description Returns the business bot that is connected to the current user account. Returns a 404 error if there is no connected bot
getBusinessConnectedBot = BusinessConnectedBot;

//@description Adds or changes business bot that is connected to the current user account @bot Connection settings for the bot
setBusinessConnectedBot bot:businessConnectedBot = Ok;

//@description Deletes the business bot that is connected to the current user account @bot_user_id Unique user identifier for the bot
deleteBusinessConnectedBot bot_user_id:int53 = Ok;

//@description Pauses or resumes the connected business bot in a specific chat @chat_id Chat identifier @is_paused Pass true to pause the connected bot in the chat; pass false to resume the bot
toggleBusinessConnectedBotChatIsPaused chat_id:int53 is_paused:Bool = Ok;

//@description Removes the connected business bot from a specific chat by adding the chat to businessRecipients.excluded_chat_ids @chat_id Chat identifier
removeBusinessConnectedBotFromChat chat_id:int53 = Ok;


//@description Returns business chat links created for the current account
getBusinessChatLinks = BusinessChatLinks;

//@description Creates a business chat link for the current account. Requires Telegram Business subscription. There can be up to getOption("business_chat_link_count_max") links created. Returns the created link
//@link_info Information about the link to create
createBusinessChatLink link_info:inputBusinessChatLink = BusinessChatLink;

//@description Edits a business chat link of the current account. Requires Telegram Business subscription. Returns the edited link
//@link The link to edit
//@link_info New description of the link
editBusinessChatLink link:string link_info:inputBusinessChatLink = BusinessChatLink;

//@description Deletes a business chat link of the current account @link The link to delete
deleteBusinessChatLink link:string = Ok;

//@description Returns information about a business chat link @link_name Name of the link
getBusinessChatLinkInfo link_name:string = BusinessChatLinkInfo;


//@description Returns an HTTPS link, which can be used to get information about the current user
getUserLink = UserLink;

//@description Searches a user by a token from the user's link @token Token to search for
searchUserByToken token:string = User;


//@description Sets the list of commands supported by the bot for the given user scope and language; for bots only
//@scope The scope to which the commands are relevant; pass null to change commands in the default bot command scope
//@language_code A two-letter ISO 639-1 language code. If empty, the commands will be applied to all users from the given scope, for which language there are no dedicated commands
//@commands List of the bot's commands
setCommands scope:BotCommandScope language_code:string commands:vector<botCommand> = Ok;

//@description Deletes commands supported by the bot for the given user scope and language; for bots only
//@scope The scope to which the commands are relevant; pass null to delete commands in the default bot command scope
//@language_code A two-letter ISO 639-1 language code or an empty string
deleteCommands scope:BotCommandScope language_code:string = Ok;

//@description Returns the list of commands supported by the bot for the given user scope and language; for bots only
//@scope The scope to which the commands are relevant; pass null to get commands in the default bot command scope
//@language_code A two-letter ISO 639-1 language code or an empty string
getCommands scope:BotCommandScope language_code:string = BotCommands;

//@description Sets menu button for the given user or for all users; for bots only
//@user_id Identifier of the user or 0 to set menu button for all users
//@menu_button New menu button
setMenuButton user_id:int53 menu_button:botMenuButton = Ok;

//@description Returns menu button set by the bot for the given user; for bots only @user_id Identifier of the user or 0 to get the default menu button
getMenuButton user_id:int53 = BotMenuButton;

//@description Sets default administrator rights for adding the bot to basic group and supergroup chats; for bots only @default_group_administrator_rights Default administrator rights for adding the bot to basic group and supergroup chats; pass null to remove default rights
setDefaultGroupAdministratorRights default_group_administrator_rights:chatAdministratorRights = Ok;

//@description Sets default administrator rights for adding the bot to channel chats; for bots only @default_channel_administrator_rights Default administrator rights for adding the bot to channels; pass null to remove default rights
setDefaultChannelAdministratorRights default_channel_administrator_rights:chatAdministratorRights = Ok;


//@description Checks whether the specified bot can send messages to the user. Returns a 404 error if can't and the access can be granted by call to allowBotToSendMessages @bot_user_id Identifier of the target bot
canBotSendMessages bot_user_id:int53 = Ok;

//@description Allows the specified bot to send messages to the user @bot_user_id Identifier of the target bot
allowBotToSendMessages bot_user_id:int53 = Ok;

//@description Sends a custom request from a Web App
//@bot_user_id Identifier of the bot
//@method The method name
//@parameters JSON-serialized method parameters
sendWebAppCustomRequest bot_user_id:int53 method:string parameters:string = CustomRequestResult;


//@description Sets the name of a bot. Can be called only if userTypeBot.can_be_edited == true
//@bot_user_id Identifier of the target bot
//@language_code A two-letter ISO 639-1 language code. If empty, the name will be shown to all users for whose languages there is no dedicated name
//@name New bot's name on the specified language; 0-64 characters; must be non-empty if language code is empty
setBotName bot_user_id:int53 language_code:string name:string = Ok;

//@description Returns the name of a bot in the given language. Can be called only if userTypeBot.can_be_edited == true
//@bot_user_id Identifier of the target bot
//@language_code A two-letter ISO 639-1 language code or an empty string
getBotName bot_user_id:int53 language_code:string = Text;

//@description Changes a profile photo for a bot @bot_user_id Identifier of the target bot @photo Profile photo to set; pass null to delete the chat photo
setBotProfilePhoto bot_user_id:int53 photo:InputChatPhoto = Ok;

//@description Changes active state for a username of a bot. The editable username can't be disabled. May return an error with a message "USERNAMES_ACTIVE_TOO_MUCH" if the maximum number of active usernames has been reached. Can be called only if userTypeBot.can_be_edited == true
//@bot_user_id Identifier of the target bot
//@username The username to change
//@is_active Pass true to activate the username; pass false to disable it
toggleBotUsernameIsActive bot_user_id:int53 username:string is_active:Bool = Ok;

//@description Changes order of active usernames of a bot. Can be called only if userTypeBot.can_be_edited == true @bot_user_id Identifier of the target bot @usernames The new order of active usernames. All currently active usernames must be specified
reorderBotActiveUsernames bot_user_id:int53 usernames:vector<string> = Ok;

//@description Sets the text shown in the chat with a bot if the chat is empty. Can be called only if userTypeBot.can_be_edited == true
//@bot_user_id Identifier of the target bot
//@language_code A two-letter ISO 639-1 language code. If empty, the description will be shown to all users for whose languages there is no dedicated description
//@param_description New bot's description on the specified language
setBotInfoDescription bot_user_id:int53 language_code:string description:string = Ok;

//@description Returns the text shown in the chat with a bot if the chat is empty in the given language. Can be called only if userTypeBot.can_be_edited == true
//@bot_user_id Identifier of the target bot
//@language_code A two-letter ISO 639-1 language code or an empty string
getBotInfoDescription bot_user_id:int53 language_code:string = Text;

//@description Sets the text shown on a bot's profile page and sent together with the link when users share the bot. Can be called only if userTypeBot.can_be_edited == true
//@bot_user_id Identifier of the target bot
//@language_code A two-letter ISO 639-1 language code. If empty, the short description will be shown to all users for whose languages there is no dedicated description
//@short_description New bot's short description on the specified language
setBotInfoShortDescription bot_user_id:int53 language_code:string short_description:string = Ok;

//@description Returns the text shown on a bot's profile page and sent together with the link when users share the bot in the given language. Can be called only if userTypeBot.can_be_edited == true
//@bot_user_id Identifier of the target bot
//@language_code A two-letter ISO 639-1 language code or an empty string
getBotInfoShortDescription bot_user_id:int53 language_code:string = Text;


//@description Returns all active sessions of the current user
getActiveSessions = Sessions;

//@description Terminates a session of the current user @session_id Session identifier
terminateSession session_id:int64 = Ok;

//@description Terminates all other sessions of the current user
terminateAllOtherSessions = Ok;

//@description Confirms an unconfirmed session of the current user from another device @session_id Session identifier
confirmSession session_id:int64 = Ok;

//@description Toggles whether a session can accept incoming calls @session_id Session identifier @can_accept_calls Pass true to allow accepting incoming calls by the session; pass false otherwise
toggleSessionCanAcceptCalls session_id:int64 can_accept_calls:Bool = Ok;

//@description Toggles whether a session can accept incoming secret chats @session_id Session identifier @can_accept_secret_chats Pass true to allow accepting secret chats by the session; pass false otherwise
toggleSessionCanAcceptSecretChats session_id:int64 can_accept_secret_chats:Bool = Ok;

//@description Changes the period of inactivity after which sessions will automatically be terminated @inactive_session_ttl_days New number of days of inactivity before sessions will be automatically terminated; 1-366 days
setInactiveSessionTtl inactive_session_ttl_days:int32 = Ok;


//@description Returns all website where the current user used Telegram to log in
getConnectedWebsites = ConnectedWebsites;

//@description Disconnects website from the current user's Telegram account @website_id Website identifier
disconnectWebsite website_id:int64 = Ok;

//@description Disconnects all websites from the current user's Telegram account
disconnectAllWebsites = Ok;


//@description Changes the editable username of a supergroup or channel, requires owner privileges in the supergroup or channel
//@supergroup_id Identifier of the supergroup or channel
//@username New value of the username. Use an empty string to remove the username. The username can't be completely removed if there is another active or disabled username
setSupergroupUsername supergroup_id:int53 username:string = Ok;

//@description Changes active state for a username of a supergroup or channel, requires owner privileges in the supergroup or channel. The editable username can't be disabled.
//-May return an error with a message "USERNAMES_ACTIVE_TOO_MUCH" if the maximum number of active usernames has been reached
//@supergroup_id Identifier of the supergroup or channel
//@username The username to change
//@is_active Pass true to activate the username; pass false to disable it
toggleSupergroupUsernameIsActive supergroup_id:int53 username:string is_active:Bool = Ok;

//@description Disables all active non-editable usernames of a supergroup or channel, requires owner privileges in the supergroup or channel @supergroup_id Identifier of the supergroup or channel
disableAllSupergroupUsernames supergroup_id:int53 = Ok;

//@description Changes order of active usernames of a supergroup or channel, requires owner privileges in the supergroup or channel
//@supergroup_id Identifier of the supergroup or channel
//@usernames The new order of active usernames. All currently active usernames must be specified
reorderSupergroupActiveUsernames supergroup_id:int53 usernames:vector<string> = Ok;

//@description Changes the sticker set of a supergroup; requires can_change_info administrator right @supergroup_id Identifier of the supergroup @sticker_set_id New value of the supergroup sticker set identifier. Use 0 to remove the supergroup sticker set
setSupergroupStickerSet supergroup_id:int53 sticker_set_id:int64 = Ok;

//@description Changes the custom emoji sticker set of a supergroup; requires can_change_info administrator right. The chat must have at least chatBoostFeatures.min_custom_emoji_sticker_set_boost_level boost level to pass the corresponding color
//@supergroup_id Identifier of the supergroup
//@custom_emoji_sticker_set_id New value of the custom emoji sticker set identifier for the supergroup. Use 0 to remove the custom emoji sticker set in the supergroup
setSupergroupCustomEmojiStickerSet supergroup_id:int53 custom_emoji_sticker_set_id:int64 = Ok;

//@description Changes the number of times the supergroup must be boosted by a user to ignore slow mode and chat permission restrictions; requires can_restrict_members administrator right
//@supergroup_id Identifier of the supergroup
//@unrestrict_boost_count New value of the unrestrict_boost_count supergroup setting; 0-8. Use 0 to remove the setting
setSupergroupUnrestrictBoostCount supergroup_id:int53 unrestrict_boost_count:int32 = Ok;

//@description Toggles whether sender signature is added to sent messages in a channel; requires can_change_info member right @supergroup_id Identifier of the channel @sign_messages New value of sign_messages
toggleSupergroupSignMessages supergroup_id:int53 sign_messages:Bool = Ok;

//@description Toggles whether joining is mandatory to send messages to a discussion supergroup; requires can_restrict_members administrator right @supergroup_id Identifier of the supergroup @join_to_send_messages New value of join_to_send_messages
toggleSupergroupJoinToSendMessages supergroup_id:int53 join_to_send_messages:Bool = Ok;

//@description Toggles whether all users directly joining the supergroup need to be approved by supergroup administrators; requires can_restrict_members administrator right @supergroup_id Identifier of the channel @join_by_request New value of join_by_request
toggleSupergroupJoinByRequest supergroup_id:int53 join_by_request:Bool = Ok;

//@description Toggles whether the message history of a supergroup is available to new members; requires can_change_info member right @supergroup_id The identifier of the supergroup @is_all_history_available The new value of is_all_history_available
toggleSupergroupIsAllHistoryAvailable supergroup_id:int53 is_all_history_available:Bool = Ok;

//@description Toggles whether sponsored messages are shown in the channel chat; requires owner privileges in the channel. The chat must have at least chatBoostFeatures.min_sponsored_message_disable_boost_level boost level to disable sponsored messages
//@supergroup_id The identifier of the channel
//@can_have_sponsored_messages The new value of can_have_sponsored_messages
toggleSupergroupCanHaveSponsoredMessages supergroup_id:int53 can_have_sponsored_messages:Bool = Ok;

//@description Toggles whether non-administrators can receive only administrators and bots using getSupergroupMembers or searchChatMembers. Can be called only if supergroupFullInfo.can_hide_members == true
//@supergroup_id Identifier of the supergroup
//@has_hidden_members New value of has_hidden_members
toggleSupergroupHasHiddenMembers supergroup_id:int53 has_hidden_members:Bool = Ok;

//@description Toggles whether aggressive anti-spam checks are enabled in the supergroup. Can be called only if supergroupFullInfo.can_toggle_aggressive_anti_spam == true
//@supergroup_id The identifier of the supergroup, which isn't a broadcast group
//@has_aggressive_anti_spam_enabled The new value of has_aggressive_anti_spam_enabled
toggleSupergroupHasAggressiveAntiSpamEnabled supergroup_id:int53 has_aggressive_anti_spam_enabled:Bool = Ok;

//@description Toggles whether the supergroup is a forum; requires owner privileges in the supergroup. Discussion supergroups can't be converted to forums @supergroup_id Identifier of the supergroup @is_forum New value of is_forum
toggleSupergroupIsForum supergroup_id:int53 is_forum:Bool = Ok;

//@description Upgrades supergroup to a broadcast group; requires owner privileges in the supergroup @supergroup_id Identifier of the supergroup
toggleSupergroupIsBroadcastGroup supergroup_id:int53 = Ok;

//@description Reports messages in a supergroup as spam; requires administrator rights in the supergroup @supergroup_id Supergroup identifier @message_ids Identifiers of messages to report
reportSupergroupSpam supergroup_id:int53 message_ids:vector<int53> = Ok;

//@description Reports a false deletion of a message by aggressive anti-spam checks; requires administrator rights in the supergroup. Can be called only for messages from chatEventMessageDeleted with can_report_anti_spam_false_positive == true
//@supergroup_id Supergroup identifier
//@message_id Identifier of the erroneously deleted message
reportSupergroupAntiSpamFalsePositive supergroup_id:int53 message_id:int53 = Ok;

//@description Returns information about members or banned users in a supergroup or channel. Can be used only if supergroupFullInfo.can_get_members == true; additionally, administrator privileges may be required for some filters
//@supergroup_id Identifier of the supergroup or channel
//@filter The type of users to return; pass null to use supergroupMembersFilterRecent
//@offset Number of users to skip
//@limit The maximum number of users to be returned; up to 200
getSupergroupMembers supergroup_id:int53 filter:SupergroupMembersFilter offset:int32 limit:int32 = ChatMembers;


//@description Closes a secret chat, effectively transferring its state to secretChatStateClosed @secret_chat_id Secret chat identifier
closeSecretChat secret_chat_id:int32 = Ok;


//@description Returns a list of service actions taken by chat members and administrators in the last 48 hours. Available only for supergroups and channels. Requires administrator rights. Returns results in reverse chronological order (i.e., in order of decreasing event_id)
//@chat_id Chat identifier
//@query Search query by which to filter events
//@from_event_id Identifier of an event from which to return results. Use 0 to get results from the latest events
//@limit The maximum number of events to return; up to 100
//@filters The types of events to return; pass null to get chat events of all types
//@user_ids User identifiers by which to filter events. By default, events relating to all users will be returned
getChatEventLog chat_id:int53 query:string from_event_id:int64 limit:int32 filters:chatEventLogFilters user_ids:vector<int53> = ChatEvents;


//@description Returns the list of supported time zones
getTimeZones = TimeZones;


//@description Returns an invoice payment form. This method must be called when the user presses inline button of the type inlineKeyboardButtonTypeBuy
//@input_invoice The invoice
//@theme Preferred payment form theme; pass null to use the default theme
getPaymentForm input_invoice:InputInvoice theme:themeParameters = PaymentForm;

//@description Validates the order information provided by a user and returns the available shipping options for a flexible invoice
//@input_invoice The invoice
//@order_info The order information, provided by the user; pass null if empty
//@allow_save Pass true to save the order information
validateOrderInfo input_invoice:InputInvoice order_info:orderInfo allow_save:Bool = ValidatedOrderInfo;

//@description Sends a filled-out payment form to the bot for final verification
//@input_invoice The invoice
//@payment_form_id Payment form identifier returned by getPaymentForm
//@order_info_id Identifier returned by validateOrderInfo, or an empty string
//@shipping_option_id Identifier of a chosen shipping option, if applicable
//@credentials The credentials chosen by user for payment
//@tip_amount Chosen by the user amount of tip in the smallest units of the currency
sendPaymentForm input_invoice:InputInvoice payment_form_id:int64 order_info_id:string shipping_option_id:string credentials:InputCredentials tip_amount:int53 = PaymentResult;

//@description Returns information about a successful payment @chat_id Chat identifier of the messagePaymentSuccessful message @message_id Message identifier
getPaymentReceipt chat_id:int53 message_id:int53 = PaymentReceipt;

//@description Returns saved order information. Returns a 404 error if there is no saved order information
getSavedOrderInfo = OrderInfo;

//@description Deletes saved order information
deleteSavedOrderInfo = Ok;

//@description Deletes saved credentials for all payment provider bots
deleteSavedCredentials = Ok;


//@description Creates a link for the given invoice; for bots only @invoice Information about the invoice of the type inputMessageInvoice
createInvoiceLink invoice:InputMessageContent = HttpUrl;


//@description Returns a user that can be contacted to get support
getSupportUser = User;


//@description Constructs a persistent HTTP URL for a background @name Background name @type Background type; backgroundTypeChatTheme isn't supported
getBackgroundUrl name:string type:BackgroundType = HttpUrl;

//@description Searches for a background by its name @name The name of the background
searchBackground name:string = Background;

//@description Sets default background for chats; adds the background to the list of installed backgrounds
//@background The input background to use; pass null to create a new filled background
//@type Background type; pass null to use the default type of the remote background; backgroundTypeChatTheme isn't supported
//@for_dark_theme Pass true if the background is set for a dark theme
setDefaultBackground background:InputBackground type:BackgroundType for_dark_theme:Bool = Background;

//@description Deletes default background for chats @for_dark_theme Pass true if the background is deleted for a dark theme
deleteDefaultBackground for_dark_theme:Bool = Ok;

//@description Returns backgrounds installed by the user @for_dark_theme Pass true to order returned backgrounds for a dark theme
getInstalledBackgrounds for_dark_theme:Bool = Backgrounds;

//@description Removes background from the list of installed backgrounds @background_id The background identifier
removeInstalledBackground background_id:int64 = Ok;

//@description Resets list of installed backgrounds to its default value
resetInstalledBackgrounds = Ok;


//@description Returns information about the current localization target. This is an offline request if only_local is true. Can be called before authorization @only_local Pass true to get only locally available information without sending network requests
getLocalizationTargetInfo only_local:Bool = LocalizationTargetInfo;

//@description Returns information about a language pack. Returned language pack identifier may be different from a provided one. Can be called before authorization @language_pack_id Language pack identifier
getLanguagePackInfo language_pack_id:string = LanguagePackInfo;

//@description Returns strings from a language pack in the current localization target by their keys. Can be called before authorization
//@language_pack_id Language pack identifier of the strings to be returned
//@keys Language pack keys of the strings to be returned; leave empty to request all available strings
getLanguagePackStrings language_pack_id:string keys:vector<string> = LanguagePackStrings;

//@description Fetches the latest versions of all strings from a language pack in the current localization target from the server.
//-This method doesn't need to be called explicitly for the current used/base language packs. Can be called before authorization
//@language_pack_id Language pack identifier
synchronizeLanguagePack language_pack_id:string = Ok;

//@description Adds a custom server language pack to the list of installed language packs in current localization target. Can be called before authorization @language_pack_id Identifier of a language pack to be added
addCustomServerLanguagePack language_pack_id:string = Ok;

//@description Adds or changes a custom local language pack to the current localization target
//@info Information about the language pack. Language pack identifier must start with 'X', consist only of English letters, digits and hyphens, and must not exceed 64 characters. Can be called before authorization
//@strings Strings of the new language pack
setCustomLanguagePack info:languagePackInfo strings:vector<languagePackString> = Ok;

//@description Edits information about a custom local language pack in the current localization target. Can be called before authorization @info New information about the custom local language pack
editCustomLanguagePackInfo info:languagePackInfo = Ok;

//@description Adds, edits or deletes a string in a custom local language pack. Can be called before authorization @language_pack_id Identifier of a previously added custom local language pack in the current localization target @new_string New language pack string
setCustomLanguagePackString language_pack_id:string new_string:languagePackString = Ok;

//@description Deletes all information about a language pack in the current localization target. The language pack which is currently in use (including base language pack) or is being synchronized can't be deleted.
//-Can be called before authorization
//@language_pack_id Identifier of the language pack to delete
deleteLanguagePack language_pack_id:string = Ok;


//@description Registers the currently used device for receiving push notifications. Returns a globally unique identifier of the push notification subscription @device_token Device token @other_user_ids List of user identifiers of other users currently using the application
registerDevice device_token:DeviceToken other_user_ids:vector<int53> = PushReceiverId;

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

//@description Changes privacy settings for message read date @settings New settings
setReadDatePrivacySettings settings:readDatePrivacySettings = Ok;

//@description Returns privacy settings for message read date
getReadDatePrivacySettings = ReadDatePrivacySettings;

//@description Changes privacy settings for new chat creation; can be used only if getOption("can_set_new_chat_privacy_settings") @settings New settings
setNewChatPrivacySettings settings:newChatPrivacySettings = Ok;

//@description Returns privacy settings for new chat creation
getNewChatPrivacySettings = NewChatPrivacySettings;


//@description Check whether the current user can message another user or try to create a chat with them
//@user_id Identifier of the other user
//@only_local Pass true to get only locally available information without sending network requests
canSendMessageToUser user_id:int53 only_local:Bool = CanSendMessageToUserResult;


//@description Returns the value of an option by its name. (Check the list of available options on https://core.telegram.org/tdlib/options.) Can be called before authorization. Can be called synchronously for options "version" and "commit_hash"
//@name The name of the option
getOption name:string = OptionValue;

//@description Sets the value of an option. (Check the list of available options on https://core.telegram.org/tdlib/options.) Only writable options can be set. Can be called before authorization
//@name The name of the option
//@value The new value of the option; pass null to reset option value to a default value
setOption name:string value:OptionValue = Ok;


//@description Changes the period of inactivity after which the account of the current user will automatically be deleted @ttl New account TTL
setAccountTtl ttl:accountTtl = Ok;

//@description Returns the period of inactivity after which the account of the current user will automatically be deleted
getAccountTtl = AccountTtl;

//@description Deletes the account of the current user, deleting all information associated with the user from the server. The phone number of the account can be used to create a new account.
//-Can be called before authorization when the current authorization state is authorizationStateWaitPassword
//@reason The reason why the account was deleted; optional
//@password The 2-step verification password of the current user. If the current user isn't authorized, then an empty string can be passed and account deletion can be canceled within one week
deleteAccount reason:string password:string = Ok;


//@description Changes the default message auto-delete time for new chats @message_auto_delete_time New default message auto-delete time; must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically
setDefaultMessageAutoDeleteTime message_auto_delete_time:messageAutoDeleteTime = Ok;

//@description Returns default message auto-delete time setting for new chats
getDefaultMessageAutoDeleteTime = MessageAutoDeleteTime;


//@description Removes a chat action bar without any other action @chat_id Chat identifier
removeChatActionBar chat_id:int53 = Ok;

//@description Reports a chat to the Telegram moderators. A chat can be reported only from the chat action bar, or if chat.can_be_reported
//@chat_id Chat identifier
//@message_ids Identifiers of reported messages; may be empty to report the whole chat
//@reason The reason for reporting the chat
//@text Additional report details; 0-1024 characters
reportChat chat_id:int53 message_ids:vector<int53> reason:ReportReason text:string = Ok;

//@description Reports a chat photo to the Telegram moderators. A chat photo can be reported only if chat.can_be_reported
//@chat_id Chat identifier
//@file_id Identifier of the photo to report. Only full photos from chatPhoto can be reported
//@reason The reason for reporting the chat photo
//@text Additional report details; 0-1024 characters
reportChatPhoto chat_id:int53 file_id:int32 reason:ReportReason text:string = Ok;

//@description Reports reactions set on a message to the Telegram moderators. Reactions on a message can be reported only if message.can_report_reactions
//@chat_id Chat identifier
//@message_id Message identifier
//@sender_id Identifier of the sender, which added the reaction
reportMessageReactions chat_id:int53 message_id:int53 sender_id:MessageSender = Ok;


//@description Returns detailed revenue statistics about a chat. Currently, this method can be used only for channels if supergroupFullInfo.can_get_revenue_statistics == true @chat_id Chat identifier @is_dark Pass true if a dark theme is used by the application
getChatRevenueStatistics chat_id:int53 is_dark:Bool = ChatRevenueStatistics;

//@description Returns URL for chat revenue withdrawal; requires owner privileges in the chat. Currently, this method can be used only for channels if supergroupFullInfo.can_get_revenue_statistics == true and getOption("can_withdraw_chat_revenue")
//@chat_id Chat identifier
//@password The 2-step verification password of the current user
getChatRevenueWithdrawalUrl chat_id:int53 password:string = HttpUrl;

//@description Returns the list of revenue transactions for a chat. Currently, this method can be used only for channels if supergroupFullInfo.can_get_revenue_statistics == true
//@chat_id Chat identifier
//@offset Number of transactions to skip
//@limit The maximum number of transactions to be returned; up to 200
getChatRevenueTransactions chat_id:int53 offset:int32 limit:int32 = ChatRevenueTransactions;


//@description Returns detailed statistics about a chat. Currently, this method can be used only for supergroups and channels. Can be used only if supergroupFullInfo.can_get_statistics == true @chat_id Chat identifier @is_dark Pass true if a dark theme is used by the application
getChatStatistics chat_id:int53 is_dark:Bool = ChatStatistics;

//@description Returns detailed statistics about a message. Can be used only if message.can_get_statistics == true @chat_id Chat identifier @message_id Message identifier @is_dark Pass true if a dark theme is used by the application
getMessageStatistics chat_id:int53 message_id:int53 is_dark:Bool = MessageStatistics;

//@description Returns forwarded copies of a channel message to different public channels and public reposts as a story. Can be used only if message.can_get_statistics == true. For optimal performance, the number of returned messages and stories is chosen by TDLib
//@chat_id Chat identifier of the message
//@message_id Message identifier
//@offset Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
//@limit The maximum number of messages and stories to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit
getMessagePublicForwards chat_id:int53 message_id:int53 offset:string limit:int32 = PublicForwards;

//@description Returns detailed statistics about a story. Can be used only if story.can_get_statistics == true @chat_id Chat identifier @story_id Story identifier @is_dark Pass true if a dark theme is used by the application
getStoryStatistics chat_id:int53 story_id:int32 is_dark:Bool = StoryStatistics;

//@description Loads an asynchronous or a zoomed in statistical graph @chat_id Chat identifier @token The token for graph loading @x X-value for zoomed in graph or 0 otherwise
getStatisticalGraph chat_id:int53 token:string x:int53 = StatisticalGraph;


//@description Returns storage usage statistics. Can be called before authorization
//@chat_limit The maximum number of chats with the largest storage usage for which separate statistics need to be returned. All other chats will be grouped in entries with chat_id == 0. If the chat info database is not used, the chat_limit is ignored and is always set to 0
getStorageStatistics chat_limit:int32 = StorageStatistics;

//@description Quickly returns approximate storage usage statistics. Can be called before authorization
getStorageStatisticsFast = StorageStatisticsFast;

//@description Returns database statistics
getDatabaseStatistics = DatabaseStatistics;

//@description Optimizes storage usage, i.e. deletes some files and returns new storage usage statistics. Secret thumbnails can't be deleted
//@size Limit on the total size of files after deletion, in bytes. Pass -1 to use the default limit
//@ttl Limit on the time that has passed since the last time a file was accessed (or creation time for some filesystems). Pass -1 to use the default limit
//@count Limit on the total number of files after deletion. Pass -1 to use the default limit
//@immunity_delay The amount of time after the creation of a file during which it can't be deleted, in seconds. Pass -1 to use the default value
//@file_types If non-empty, only files with the given types are considered. By default, all types except thumbnails, profile photos, stickers and wallpapers are deleted
//@chat_ids If non-empty, only files from the given chats are considered. Use 0 as chat identifier to delete files not belonging to any chat (e.g., profile photos)
//@exclude_chat_ids If non-empty, files from the given chats are excluded. Use 0 as chat identifier to exclude all files not belonging to any chat (e.g., profile photos)
//@return_deleted_file_statistics Pass true if statistics about the files that were deleted must be returned instead of the whole storage usage statistics. Affects only returned statistics
//@chat_limit Same as in getStorageStatistics. Affects only returned statistics
optimizeStorage size:int53 ttl:int32 count:int32 immunity_delay:int32 file_types:vector<FileType> chat_ids:vector<int53> exclude_chat_ids:vector<int53> return_deleted_file_statistics:Bool chat_limit:int32 = StorageStatistics;


//@description Sets the current network type. Can be called before authorization. Calling this method forces all network connections to reopen, mitigating the delay in switching between different networks,
//-so it must be called whenever the network is changed, even if the network type remains the same. Network type is used to check whether the library can use the network at all and also for collecting detailed network data usage statistics
//@type The new network type; pass null to set network type to networkTypeOther
setNetworkType type:NetworkType = Ok;

//@description Returns network data usage statistics. Can be called before authorization @only_current Pass true to get statistics only for the current library launch
getNetworkStatistics only_current:Bool = NetworkStatistics;

//@description Adds the specified data to data usage statistics. Can be called before authorization @entry The network statistics entry with the data to be added to statistics
addNetworkStatistics entry:NetworkStatisticsEntry = Ok;

//@description Resets all network data usage statistics to zero. Can be called before authorization
resetNetworkStatistics = Ok;

//@description Returns auto-download settings presets for the current user
getAutoDownloadSettingsPresets = AutoDownloadSettingsPresets;

//@description Sets auto-download settings @settings New user auto-download settings @type Type of the network for which the new settings are relevant
setAutoDownloadSettings settings:autoDownloadSettings type:NetworkType = Ok;

//@description Returns autosave settings for the current user
getAutosaveSettings = AutosaveSettings;

//@description Sets autosave settings for the given scope. The method is guaranteed to work only after at least one call to getAutosaveSettings @scope Autosave settings scope @settings New autosave settings for the scope; pass null to set autosave settings to default
setAutosaveSettings scope:AutosaveSettingsScope settings:scopeAutosaveSettings = Ok;

//@description Clears the list of all autosave settings exceptions. The method is guaranteed to work only after at least one call to getAutosaveSettings
clearAutosaveSettingsExceptions = Ok;


//@description Returns information about a bank card @bank_card_number The bank card number
getBankCardInfo bank_card_number:string = BankCardInfo;


//@description Returns one of the available Telegram Passport elements @type Telegram Passport element type @password The 2-step verification password of the current user
getPassportElement type:PassportElementType password:string = PassportElement;

//@description Returns all available Telegram Passport elements @password The 2-step verification password of the current user
getAllPassportElements password:string = PassportElements;

//@description Adds an element to the user's Telegram Passport. May return an error with a message "PHONE_VERIFICATION_NEEDED" or "EMAIL_VERIFICATION_NEEDED" if the chosen phone number or the chosen email address must be verified first
//@element Input Telegram Passport element
//@password The 2-step verification password of the current user
setPassportElement element:InputPassportElement password:string = PassportElement;

//@description Deletes a Telegram Passport element @type Element type
deletePassportElement type:PassportElementType = Ok;

//@description Informs the user that some of the elements in their Telegram Passport contain errors; for bots only. The user will not be able to resend the elements, until the errors are fixed @user_id User identifier @errors The errors
setPassportElementErrors user_id:int53 errors:vector<inputPassportElementError> = Ok;


//@description Returns an IETF language tag of the language preferred in the country, which must be used to fill native fields in Telegram Passport personal details. Returns a 404 error if unknown @country_code A two-letter ISO 3166-1 alpha-2 country code
getPreferredCountryLanguage country_code:string = Text;


//@description Sends a code to verify an email address to be added to a user's Telegram Passport @email_address Email address
sendEmailAddressVerificationCode email_address:string = EmailAddressAuthenticationCodeInfo;

//@description Resends the code to verify an email address to be added to a user's Telegram Passport
resendEmailAddressVerificationCode = EmailAddressAuthenticationCodeInfo;

//@description Checks the email address verification code for Telegram Passport @code Verification code to check
checkEmailAddressVerificationCode code:string = Ok;


//@description Returns a Telegram Passport authorization form for sharing data with a service
//@bot_user_id User identifier of the service's bot
//@scope Telegram Passport element types requested by the service
//@public_key Service's public key
//@nonce Unique request identifier provided by the service
getPassportAuthorizationForm bot_user_id:int53 scope:string public_key:string nonce:string = PassportAuthorizationForm;

//@description Returns already available Telegram Passport elements suitable for completing a Telegram Passport authorization form. Result can be received only once for each authorization form
//@authorization_form_id Authorization form identifier
//@password The 2-step verification password of the current user
getPassportAuthorizationFormAvailableElements authorization_form_id:int32 password:string = PassportElementsWithErrors;

//@description Sends a Telegram Passport authorization form, effectively sharing data with the service. This method must be called after getPassportAuthorizationFormAvailableElements if some previously available elements are going to be reused
//@authorization_form_id Authorization form identifier
//@types Types of Telegram Passport elements chosen by user to complete the authorization form
sendPassportAuthorizationForm authorization_form_id:int32 types:vector<PassportElementType> = Ok;


//@description Informs the server about the number of pending bot updates if they haven't been processed for a long time; for bots only @pending_update_count The number of pending updates @error_message The last error message
setBotUpdatesStatus pending_update_count:int32 error_message:string = Ok;


//@description Uploads a file with a sticker; returns the uploaded file
//@user_id Sticker file owner; ignored for regular users
//@sticker_format Sticker format
//@sticker File file to upload; must fit in a 512x512 square. For WEBP stickers the file must be in WEBP or PNG format, which will be converted to WEBP server-side.
//-See https://core.telegram.org/animated_stickers#technical-requirements for technical requirements
uploadStickerFile user_id:int53 sticker_format:StickerFormat sticker:InputFile = File;

//@description Returns a suggested name for a new sticker set with a given title @title Sticker set title; 1-64 characters
getSuggestedStickerSetName title:string = Text;

//@description Checks whether a name can be used for a new sticker set @name Name to be checked
checkStickerSetName name:string = CheckStickerSetNameResult;

//@description Creates a new sticker set. Returns the newly created sticker set
//@user_id Sticker set owner; ignored for regular users
//@title Sticker set title; 1-64 characters
//@name Sticker set name. Can contain only English letters, digits and underscores. Must end with *"_by_<bot username>"* (*<bot_username>* is case insensitive) for bots; 0-64 characters.
//-If empty, then the name returned by getSuggestedStickerSetName will be used automatically
//@sticker_type Type of the stickers in the set
//@needs_repainting Pass true if stickers in the sticker set must be repainted; for custom emoji sticker sets only
//@stickers List of stickers to be added to the set; 1-200 stickers for custom emoji sticker sets, and 1-120 stickers otherwise. For TGS stickers, uploadStickerFile must be used before the sticker is shown
//@source Source of the sticker set; may be empty if unknown
createNewStickerSet user_id:int53 title:string name:string sticker_type:StickerType needs_repainting:Bool stickers:vector<inputSticker> source:string = StickerSet;

//@description Adds a new sticker to a set
//@user_id Sticker set owner; ignored for regular users
//@name Sticker set name. The sticker set must be owned by the current user, and contain less than 200 stickers for custom emoji sticker sets and less than 120 otherwise
//@sticker Sticker to add to the set
addStickerToSet user_id:int53 name:string sticker:inputSticker = Ok;

//@description Replaces existing sticker in a set. The function is equivalent to removeStickerFromSet, then addStickerToSet, then setStickerPositionInSet
//@user_id Sticker set owner; ignored for regular users
//@name Sticker set name. The sticker set must be owned by the current user
//@old_sticker Sticker to remove from the set
//@new_sticker Sticker to add to the set
replaceStickerInSet user_id:int53 name:string old_sticker:InputFile new_sticker:inputSticker = Ok;

//@description Sets a sticker set thumbnail
//@user_id Sticker set owner; ignored for regular users
//@name Sticker set name. The sticker set must be owned by the current user
//@thumbnail Thumbnail to set; pass null to remove the sticker set thumbnail
//@format Format of the thumbnail; pass null if thumbnail is removed
setStickerSetThumbnail user_id:int53 name:string thumbnail:InputFile format:StickerFormat = Ok;

//@description Sets a custom emoji sticker set thumbnail
//@name Sticker set name. The sticker set must be owned by the current user
//@custom_emoji_id Identifier of the custom emoji from the sticker set, which will be set as sticker set thumbnail; pass 0 to remove the sticker set thumbnail
setCustomEmojiStickerSetThumbnail name:string custom_emoji_id:int64 = Ok;

//@description Sets a sticker set title @name Sticker set name. The sticker set must be owned by the current user @title New sticker set title
setStickerSetTitle name:string title:string = Ok;

//@description Completely deletes a sticker set @name Sticker set name. The sticker set must be owned by the current user
deleteStickerSet name:string = Ok;

//@description Changes the position of a sticker in the set to which it belongs. The sticker set must be owned by the current user
//@sticker Sticker
//@position New position of the sticker in the set, 0-based
setStickerPositionInSet sticker:InputFile position:int32 = Ok;

//@description Removes a sticker from the set to which it belongs. The sticker set must be owned by the current user @sticker Sticker to remove from the set
removeStickerFromSet sticker:InputFile = Ok;

//@description Changes the list of emoji corresponding to a sticker. The sticker must belong to a regular or custom emoji sticker set that is owned by the current user
//@sticker Sticker
//@emojis New string with 1-20 emoji corresponding to the sticker
setStickerEmojis sticker:InputFile emojis:string = Ok;

//@description Changes the list of keywords of a sticker. The sticker must belong to a regular or custom emoji sticker set that is owned by the current user
//@sticker Sticker
//@keywords List of up to 20 keywords with total length up to 64 characters, which can be used to find the sticker
setStickerKeywords sticker:InputFile keywords:vector<string> = Ok;

//@description Changes the mask position of a mask sticker. The sticker must belong to a mask sticker set that is owned by the current user
//@sticker Sticker
//@mask_position Position where the mask is placed; pass null to remove mask position
setStickerMaskPosition sticker:InputFile mask_position:maskPosition = Ok;

//@description Returns sticker sets owned by the current user
//@offset_sticker_set_id Identifier of the sticker set from which to return owned sticker sets; use 0 to get results from the beginning
//@limit The maximum number of sticker sets to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit
getOwnedStickerSets offset_sticker_set_id:int64 limit:int32 = StickerSets;


//@description Returns information about a file with a map thumbnail in PNG format. Only map thumbnail files with size less than 1MB can be downloaded
//@location Location of the map center
//@zoom Map zoom level; 13-20
//@width Map width in pixels before applying scale; 16-1024
//@height Map height in pixels before applying scale; 16-1024
//@scale Map scale; 1-3
//@chat_id Identifier of a chat in which the thumbnail will be shown. Use 0 if unknown
getMapThumbnailFile location:location zoom:int32 width:int32 height:int32 scale:int32 chat_id:int53 = File;


//@description Returns information about a limit, increased for Premium users. Returns a 404 error if the limit is unknown @limit_type Type of the limit
getPremiumLimit limit_type:PremiumLimitType = PremiumLimit;

//@description Returns information about features, available to Premium users @source Source of the request; pass null if the method is called from some non-standard source
getPremiumFeatures source:PremiumSource = PremiumFeatures;

//@description Returns examples of premium stickers for demonstration purposes
getPremiumStickerExamples = Stickers;

//@description Informs TDLib that the user viewed detailed information about a Premium feature on the Premium features screen @feature The viewed premium feature
viewPremiumFeature feature:PremiumFeature = Ok;

//@description Informs TDLib that the user clicked Premium subscription button on the Premium features screen
clickPremiumSubscriptionButton = Ok;

//@description Returns state of Telegram Premium subscription and promotion videos for Premium features
getPremiumState = PremiumState;

//@description Returns available options for Telegram Premium gift code or giveaway creation
//@boosted_chat_id Identifier of the supergroup or channel chat, which will be automatically boosted by receivers of the gift codes and which is administered by the user; 0 if none
getPremiumGiftCodePaymentOptions boosted_chat_id:int53 = PremiumGiftCodePaymentOptions;

//@description Return information about a Telegram Premium gift code @code The code to check
checkPremiumGiftCode code:string = PremiumGiftCodeInfo;

//@description Applies a Telegram Premium gift code @code The code to apply
applyPremiumGiftCode code:string = Ok;

//@description Launches a prepaid Telegram Premium giveaway
//@giveaway_id Unique identifier of the prepaid giveaway
//@parameters Giveaway parameters
launchPrepaidPremiumGiveaway giveaway_id:int64 parameters:premiumGiveawayParameters = Ok;

//@description Returns information about a Telegram Premium giveaway
//@chat_id Identifier of the channel chat which started the giveaway
//@message_id Identifier of the giveaway or a giveaway winners message in the chat
getPremiumGiveawayInfo chat_id:int53 message_id:int53 = PremiumGiveawayInfo;

//@description Checks whether Telegram Premium purchase is possible. Must be called before in-store Premium purchase @purpose Transaction purpose
canPurchasePremium purpose:StorePaymentPurpose = Ok;

//@description Informs server about a purchase through App Store. For official applications only @receipt App Store receipt @purpose Transaction purpose
assignAppStoreTransaction receipt:bytes purpose:StorePaymentPurpose = Ok;

//@description Informs server about a purchase through Google Play. For official applications only
//@package_name Application package name
//@store_product_id Identifier of the purchased store product
//@purchase_token Google Play purchase token
//@purpose Transaction purpose
assignGooglePlayTransaction package_name:string store_product_id:string purchase_token:string purpose:StorePaymentPurpose = Ok;


//@description Returns information about features, available to Business users @source Source of the request; pass null if the method is called from settings or some non-standard source
getBusinessFeatures source:BusinessFeature = BusinessFeatures;


//@description Accepts Telegram terms of services @terms_of_service_id Terms of service identifier
acceptTermsOfService terms_of_service_id:string = Ok;


//@description Searches specified query by word prefixes in the provided strings. Returns 0-based positions of strings that matched. Can be called synchronously
//@strings The strings to search in for the query
//@query Query to search for
//@limit The maximum number of objects to return
//@return_none_for_empty_query Pass true to receive no results for an empty query
searchStringsByPrefix strings:vector<string> query:string limit:int32 return_none_for_empty_query:Bool = FoundPositions;


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

//@description Returns information about a phone number by its prefix synchronously. getCountries must be called at least once after changing localization to the specified language if properly localized country information is expected. Can be called synchronously
//@language_code A two-letter ISO 639-1 language code for country information localization
//@phone_number_prefix The phone number prefix
getPhoneNumberInfoSync language_code:string phone_number_prefix:string = PhoneNumberInfo;


//@description Returns information about a given collectible item that was purchased at https://fragment.com
//@type Type of the collectible item. The item must be used by a user and must be visible to the current user
getCollectibleItemInfo type:CollectibleItemType = CollectibleItemInfo;


//@description Returns information about a tg:// deep link. Use "tg://need_update_for_some_feature" or "tg:some_unsupported_feature" for testing. Returns a 404 error for unknown links. Can be called before authorization @link The link
getDeepLinkInfo link:string = DeepLinkInfo;


//@description Returns application config, provided by the server. Can be called before authorization
getApplicationConfig = JsonValue;

//@description Saves application log event on the server. Can be called before authorization @type Event type @chat_id Optional chat identifier, associated with the event @data The log event data
saveApplicationLogEvent type:string chat_id:int53 data:JsonValue = Ok;

//@description Returns the link for downloading official Telegram application to be used when the current user invites friends to Telegram
getApplicationDownloadLink = HttpUrl;


//@description Adds a proxy server for network requests. Can be called before authorization
//@server Proxy server domain or IP address
//@port Proxy server port
//@enable Pass true to immediately enable the proxy
//@type Proxy type
addProxy server:string port:int32 enable:Bool type:ProxyType = Proxy;

//@description Edits an existing proxy server for network requests. Can be called before authorization
//@proxy_id Proxy identifier
//@server Proxy server domain or IP address
//@port Proxy server port
//@enable Pass true to immediately enable the proxy
//@type Proxy type
editProxy proxy_id:int32 server:string port:int32 enable:Bool type:ProxyType = Proxy;

//@description Enables a proxy. Only one proxy can be enabled at a time. Can be called before authorization @proxy_id Proxy identifier
enableProxy proxy_id:int32 = Ok;

//@description Disables the currently enabled proxy. Can be called before authorization
disableProxy = Ok;

//@description Removes a proxy server. Can be called before authorization @proxy_id Proxy identifier
removeProxy proxy_id:int32 = Ok;

//@description Returns the list of proxies that are currently set up. Can be called before authorization
getProxies = Proxies;

//@description Returns an HTTPS link, which can be used to add a proxy. Available only for SOCKS5 and MTProto proxies. Can be called before authorization @proxy_id Proxy identifier
getProxyLink proxy_id:int32 = HttpUrl;

//@description Computes time needed to receive a response from a Telegram server through a proxy. Can be called before authorization @proxy_id Proxy identifier. Use 0 to ping a Telegram server without a proxy
pingProxy proxy_id:int32 = Seconds;


//@description Sets new log stream for internal logging of TDLib. Can be called synchronously @log_stream New log stream
setLogStream log_stream:LogStream = Ok;

//@description Returns information about currently used log stream for internal logging of TDLib. Can be called synchronously
getLogStream = LogStream;

//@description Sets the verbosity level of the internal logging of TDLib. Can be called synchronously
//@new_verbosity_level New value of the verbosity level for logging. Value 0 corresponds to fatal errors, value 1 corresponds to errors, value 2 corresponds to warnings and debug warnings,
//-value 3 corresponds to informational, value 4 corresponds to debug, value 5 corresponds to verbose debug, value greater than 5 and up to 1023 can be used to enable even more logging
setLogVerbosityLevel new_verbosity_level:int32 = Ok;

//@description Returns current verbosity level of the internal logging of TDLib. Can be called synchronously
getLogVerbosityLevel = LogVerbosityLevel;

//@description Returns the list of available TDLib internal log tags, for example, ["actor", "binlog", "connections", "notifications", "proxy"]. Can be called synchronously
getLogTags = LogTags;

//@description Sets the verbosity level for a specified TDLib internal log tag. Can be called synchronously
//@tag Logging tag to change verbosity level
//@new_verbosity_level New verbosity level; 1-1024
setLogTagVerbosityLevel tag:string new_verbosity_level:int32 = Ok;

//@description Returns current verbosity level for a specified TDLib internal log tag. Can be called synchronously @tag Logging tag to change verbosity level
getLogTagVerbosityLevel tag:string = LogVerbosityLevel;

//@description Adds a message to TDLib internal log. Can be called synchronously
//@verbosity_level The minimum verbosity level needed for the message to be logged; 0-1023
//@text Text of a message to log
addLogMessage verbosity_level:int32 text:string = Ok;


//@description Returns support information for the given user; for Telegram support only @user_id User identifier
getUserSupportInfo user_id:int53 = UserSupportInfo;

//@description Sets support information for the given user; for Telegram support only @user_id User identifier @message New information message
setUserSupportInfo user_id:int53 message:formattedText = UserSupportInfo;

//@description Returns localized name of the Telegram support user; for Telegram support only
getSupportName = Text;


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

//@description Sends a simple network request to the Telegram servers via proxy; for testing only. Can be called before authorization
//@server Proxy server domain or IP address
//@port Proxy server port
//@type Proxy type
//@dc_id Identifier of a datacenter with which to test connection
//@timeout The maximum overall timeout for the request
testProxy server:string port:int32 type:ProxyType dc_id:int32 timeout:double = Ok;

//@description Forces an updates.getDifference call to the Telegram servers; for testing only
testGetDifference = Ok;

//@description Does nothing and ensures that the Update object is used; for testing only. This is an offline method. Can be called before authorization
testUseUpdate = Update;

//@description Returns the specified error and ensures that the Error object is used; for testing only. Can be called synchronously @error The error to be returned
testReturnError error:error = Error;
