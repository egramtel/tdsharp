double ? = Double;
string ? = String;

int32 = Int32;
int53 = Int53;
int64 = Int64;
bytes = Bytes;

boolFalse = Bool;
boolTrue = Bool;

vector {t:Type} # [ t ] = Vector t;


//@description An object of this type can be returned on every function call, in case of an error
//@code Error code; subject to future changes. If the error code is 406, the error message must not be processed in any way and must not be displayed to the user
//@message Error message; subject to future changes
error code:int32 message:string = Error;


//@description An object of this type is returned on a successful function call for certain functions
ok = Ok;


//@class AuthenticationCodeType @description Provides information about the method by which an authentication code is delivered to the user

//@description An authentication code is delivered via a private Telegram message, which can be viewed from another active session
//@length Length of the code
authenticationCodeTypeTelegramMessage length:int32 = AuthenticationCodeType;

//@description An authentication code is delivered via an SMS message to the specified phone number; applications may not receive this type of code
//@length Length of the code
authenticationCodeTypeSms length:int32 = AuthenticationCodeType;

//@description An authentication code is delivered via a phone call to the specified phone number
//@length Length of the code
authenticationCodeTypeCall length:int32 = AuthenticationCodeType;

//@description An authentication code is delivered by an immediately canceled call to the specified phone number. The phone number that calls is the code that must be entered automatically
//@pattern Pattern of the phone number from which the call will be made
authenticationCodeTypeFlashCall pattern:string = AuthenticationCodeType;

//@description An authentication code is delivered by an immediately canceled call to the specified phone number. The last digits of the phone number that calls are the code that must be entered manually by the user
//@phone_number_prefix Prefix of the phone number from which the call will be made
//@length Number of digits in the code, excluding the prefix
authenticationCodeTypeMissedCall phone_number_prefix:string length:int32 = AuthenticationCodeType;

//@description An authentication code is delivered to https://fragment.com. The user must be logged in there via a wallet owning the phone number's NFT
//@url URL to open to receive the code
//@length Length of the code
authenticationCodeTypeFragment url:string length:int32 = AuthenticationCodeType;

//@description An authentication code is delivered via Firebase Authentication to the official Android application
//@nonce Nonce to pass to the SafetyNet Attestation API
//@length Length of the code
authenticationCodeTypeFirebaseAndroid nonce:bytes length:int32 = AuthenticationCodeType;

//@description An authentication code is delivered via Firebase Authentication to the official iOS application
//@receipt Receipt of successful application token validation to compare with receipt from push notification
//@push_timeout Time after the next authentication method is supposed to be used if verification push notification isn't received, in seconds
//@length Length of the code
authenticationCodeTypeFirebaseIos receipt:string push_timeout:int32 length:int32 = AuthenticationCodeType;


//@description Information about the authentication code that was sent
//@phone_number A phone number that is being authenticated
//@type The way the code was sent to the user
//@next_type The way the next code will be sent to the user; may be null
//@timeout Timeout before the code can be re-sent, in seconds
authenticationCodeInfo phone_number:string type:AuthenticationCodeType next_type:AuthenticationCodeType timeout:int32 = AuthenticationCodeInfo;

//@description Information about the email address authentication code that was sent
//@email_address_pattern Pattern of the email address to which an authentication code was sent
//@length Length of the code; 0 if unknown
emailAddressAuthenticationCodeInfo email_address_pattern:string length:int32 = EmailAddressAuthenticationCodeInfo;


//@class EmailAddressAuthentication @description Contains authentication data for a email address

//@description An authentication code delivered to a user's email address @code The code
emailAddressAuthenticationCode code:string = EmailAddressAuthentication;

//@description An authentication token received through Apple ID @token The token
emailAddressAuthenticationAppleId token:string = EmailAddressAuthentication;

//@description An authentication token received through Google ID @token The token
emailAddressAuthenticationGoogleId token:string = EmailAddressAuthentication;


//@class EmailAddressResetState @description Describes reset state of a email address

//@description Email address can be reset after the given period. Call resetAuthenticationEmailAddress to reset it and allow the user to authorize with a code sent to the user's phone number
//@wait_period Time required to wait before the email address can be reset; 0 if the user is subscribed to Telegram Premium
emailAddressResetStateAvailable wait_period:int32 = EmailAddressResetState;

//@description Email address reset has already been requested. Call resetAuthenticationEmailAddress to check whether immediate reset is possible
//@reset_in Left time before the email address will be reset, in seconds. updateAuthorizationState is not sent when this field changes
emailAddressResetStatePending reset_in:int32 = EmailAddressResetState;


//@description Represents a part of the text that needs to be formatted in some unusual way @offset Offset of the entity, in UTF-16 code units @length Length of the entity, in UTF-16 code units @type Type of the entity
textEntity offset:int32 length:int32 type:TextEntityType = TextEntity;

//@description Contains a list of text entities @entities List of text entities
textEntities entities:vector<textEntity> = TextEntities;

//@description A text with some entities @text The text @entities Entities contained in the text. Entities can be nested, but must not mutually intersect with each other.
//-Pre, Code and PreCode entities can't contain other entities. Bold, Italic, Underline, Strikethrough, and Spoiler entities can contain and can be part of any other entities. All other entities can't contain each other
formattedText text:string entities:vector<textEntity> = FormattedText;


//@description Contains Telegram terms of service @text Text of the terms of service @min_user_age The minimum age of a user to be able to accept the terms; 0 if age isn't restricted @show_popup True, if a blocking popup with terms of service must be shown to the user
termsOfService text:formattedText min_user_age:int32 show_popup:Bool = TermsOfService;


//@class AuthorizationState @description Represents the current authorization state of the TDLib client

//@description Initialization parameters are needed. Call setTdlibParameters to provide them
authorizationStateWaitTdlibParameters = AuthorizationState;

//@description TDLib needs the user's phone number to authorize. Call setAuthenticationPhoneNumber to provide the phone number, or use requestQrCodeAuthentication or checkAuthenticationBotToken for other authentication options
authorizationStateWaitPhoneNumber = AuthorizationState;

//@description TDLib needs the user's email address to authorize. Call setAuthenticationEmailAddress to provide the email address, or directly call checkAuthenticationEmailCode with Apple ID/Google ID token if allowed
//@allow_apple_id True, if authorization through Apple ID is allowed
//@allow_google_id True, if authorization through Google ID is allowed
authorizationStateWaitEmailAddress allow_apple_id:Bool allow_google_id:Bool = AuthorizationState;

//@description TDLib needs the user's authentication code sent to an email address to authorize. Call checkAuthenticationEmailCode to provide the code
//@allow_apple_id True, if authorization through Apple ID is allowed
//@allow_google_id True, if authorization through Google ID is allowed
//@code_info Information about the sent authentication code
//@email_address_reset_state Reset state of the email address; may be null if the email address can't be reset
authorizationStateWaitEmailCode allow_apple_id:Bool allow_google_id:Bool code_info:emailAddressAuthenticationCodeInfo email_address_reset_state:EmailAddressResetState = AuthorizationState;

//@description TDLib needs the user's authentication code to authorize. Call checkAuthenticationCode to check the code @code_info Information about the authorization code that was sent
authorizationStateWaitCode code_info:authenticationCodeInfo = AuthorizationState;

//@description The user needs to confirm authorization on another logged in device by scanning a QR code with the provided link @link A tg:// URL for the QR code. The link will be updated frequently
authorizationStateWaitOtherDeviceConfirmation link:string = AuthorizationState;

//@description The user is unregistered and need to accept terms of service and enter their first name and last name to finish registration. Call registerUser to accept the terms of service and provide the data @terms_of_service Telegram terms of service
authorizationStateWaitRegistration terms_of_service:termsOfService = AuthorizationState;

//@description The user has been authorized, but needs to enter a 2-step verification password to start using the application.
//-Call checkAuthenticationPassword to provide the password, or requestAuthenticationPasswordRecovery to recover the password, or deleteAccount to delete the account after a week
//@password_hint Hint for the password; may be empty
//@has_recovery_email_address True, if a recovery email address has been set up
//@has_passport_data True, if some Telegram Passport elements were saved
//@recovery_email_address_pattern Pattern of the email address to which the recovery email was sent; empty until a recovery email has been sent
authorizationStateWaitPassword password_hint:string has_recovery_email_address:Bool has_passport_data:Bool recovery_email_address_pattern:string = AuthorizationState;

//@description The user has been successfully authorized. TDLib is now ready to answer general requests
authorizationStateReady = AuthorizationState;

//@description The user is currently logging out
authorizationStateLoggingOut = AuthorizationState;

//@description TDLib is closing, all subsequent queries will be answered with the error 500. Note that closing TDLib can take a while. All resources will be freed only after authorizationStateClosed has been received
authorizationStateClosing = AuthorizationState;

//@description TDLib client is in its final state. All databases are closed and all resources are released. No other updates will be received after this. All queries will be responded to
//-with error code 500. To continue working, one must create a new instance of the TDLib client
authorizationStateClosed = AuthorizationState;


//@description Represents the current state of 2-step verification
//@has_password True, if a 2-step verification password is set
//@password_hint Hint for the password; may be empty
//@has_recovery_email_address True, if a recovery email is set
//@has_passport_data True, if some Telegram Passport elements were saved
//@recovery_email_address_code_info Information about the recovery email address to which the confirmation email was sent; may be null
//@login_email_address_pattern Pattern of the email address set up for logging in
//@pending_reset_date If not 0, point in time (Unix timestamp) after which the 2-step verification password can be reset immediately using resetPassword
passwordState has_password:Bool password_hint:string has_recovery_email_address:Bool has_passport_data:Bool recovery_email_address_code_info:emailAddressAuthenticationCodeInfo login_email_address_pattern:string pending_reset_date:int32 = PasswordState;

//@description Contains information about the current recovery email address @recovery_email_address Recovery email address
recoveryEmailAddress recovery_email_address:string = RecoveryEmailAddress;


//@description Returns information about the availability of a temporary password, which can be used for payments @has_password True, if a temporary password is available @valid_for Time left before the temporary password expires, in seconds
temporaryPasswordState has_password:Bool valid_for:int32 = TemporaryPasswordState;


//@description Represents a local file
//@path Local path to the locally available file part; may be empty
//@can_be_downloaded True, if it is possible to download or generate the file
//@can_be_deleted True, if the file can be deleted
//@is_downloading_active True, if the file is currently being downloaded (or a local copy is being generated by some other means)
//@is_downloading_completed True, if the local copy is fully available
//@download_offset Download will be started from this offset. downloaded_prefix_size is calculated from this offset
//@downloaded_prefix_size If is_downloading_completed is false, then only some prefix of the file starting from download_offset is ready to be read. downloaded_prefix_size is the size of that prefix in bytes
//@downloaded_size Total downloaded file size, in bytes. Can be used only for calculating download progress. The actual file size may be bigger, and some parts of it may contain garbage
localFile path:string can_be_downloaded:Bool can_be_deleted:Bool is_downloading_active:Bool is_downloading_completed:Bool download_offset:int53 downloaded_prefix_size:int53 downloaded_size:int53 = LocalFile;

//@description Represents a remote file
//@id Remote file identifier; may be empty. Can be used by the current user across application restarts or even from other devices. Uniquely identifies a file, but a file can have a lot of different valid identifiers.
//-If the ID starts with "http://" or "https://", it represents the HTTP URL of the file. TDLib is currently unable to download files if only their URL is known.
//-If downloadFile/addFileToDownloads is called on such a file or if it is sent to a secret chat, TDLib starts a file generation process by sending updateFileGenerationStart to the application with the HTTP URL in the original_path and "#url#" as the conversion string.
//-Application must generate the file by downloading it to the specified location
//@unique_id Unique file identifier; may be empty if unknown. The unique file identifier which is the same for the same file even for different users and is persistent over time
//@is_uploading_active True, if the file is currently being uploaded (or a remote copy is being generated by some other means)
//@is_uploading_completed True, if a remote copy is fully available
//@uploaded_size Size of the remote available part of the file, in bytes; 0 if unknown
remoteFile id:string unique_id:string is_uploading_active:Bool is_uploading_completed:Bool uploaded_size:int53 = RemoteFile;

//@description Represents a file
//@id Unique file identifier
//@size File size, in bytes; 0 if unknown
//@expected_size Approximate file size in bytes in case the exact file size is unknown. Can be used to show download/upload progress
//@local Information about the local copy of the file
//@remote Information about the remote copy of the file
file id:int32 size:int53 expected_size:int53 local:localFile remote:remoteFile = File;


//@class InputFile @description Points to a file

//@description A file defined by its unique ID @id Unique file identifier
inputFileId id:int32 = InputFile;

//@description A file defined by its remote ID. The remote ID is guaranteed to be usable only if the corresponding file is still accessible to the user and known to TDLib.
//-For example, if the file is from a message, then the message must be not deleted and accessible to the user. If the file database is disabled, then the corresponding object with the file must be preloaded by the application
//@id Remote file identifier
inputFileRemote id:string = InputFile;

//@description A file defined by a local path @path Local path to the file
inputFileLocal path:string = InputFile;

//@description A file generated by the application
//@original_path Local path to a file from which the file is generated; may be empty if there is no such file
//@conversion String specifying the conversion applied to the original file; must be persistent across application restarts. Conversions beginning with '#' are reserved for internal TDLib usage
//@expected_size Expected size of the generated file, in bytes; 0 if unknown
inputFileGenerated original_path:string conversion:string expected_size:int53 = InputFile;


//@description Describes an image in JPEG format
//@type Image type (see https://core.telegram.org/constructor/photoSize)
//@photo Information about the image file
//@width Image width
//@height Image height
//@progressive_sizes Sizes of progressive JPEG file prefixes, which can be used to preliminarily show the image; in bytes
photoSize type:string photo:file width:int32 height:int32 progressive_sizes:vector<int32> = PhotoSize;

//@description Thumbnail image of a very poor quality and low resolution @width Thumbnail width, usually doesn't exceed 40 @height Thumbnail height, usually doesn't exceed 40 @data The thumbnail in JPEG format
minithumbnail width:int32 height:int32 data:bytes = Minithumbnail;


//@class ThumbnailFormat @description Describes format of a thumbnail

//@description The thumbnail is in JPEG format
thumbnailFormatJpeg = ThumbnailFormat;

//@description The thumbnail is in static GIF format. It will be used only for some bot inline results
thumbnailFormatGif = ThumbnailFormat;

//@description The thumbnail is in MPEG4 format. It will be used only for some animations and videos
thumbnailFormatMpeg4 = ThumbnailFormat;

//@description The thumbnail is in PNG format. It will be used only for background patterns
thumbnailFormatPng = ThumbnailFormat;

//@description The thumbnail is in TGS format. It will be used only for TGS sticker sets
thumbnailFormatTgs = ThumbnailFormat;

//@description The thumbnail is in WEBM format. It will be used only for WEBM sticker sets
thumbnailFormatWebm = ThumbnailFormat;

//@description The thumbnail is in WEBP format. It will be used only for some stickers
thumbnailFormatWebp = ThumbnailFormat;


//@description Represents a thumbnail
//@format Thumbnail format
//@width Thumbnail width
//@height Thumbnail height
//@file The thumbnail
thumbnail format:ThumbnailFormat width:int32 height:int32 file:file = Thumbnail;


//@class MaskPoint @description Part of the face, relative to which a mask is placed

//@description The mask is placed relatively to the forehead
maskPointForehead = MaskPoint;

//@description The mask is placed relatively to the eyes
maskPointEyes = MaskPoint;

//@description The mask is placed relatively to the mouth
maskPointMouth = MaskPoint;

//@description The mask is placed relatively to the chin
maskPointChin = MaskPoint;

//@description Position on a photo where a mask is placed
//@point Part of the face, relative to which the mask is placed
//@x_shift Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. (For example, -1.0 will place the mask just to the left of the default mask position)
//@y_shift Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. (For example, 1.0 will place the mask just below the default mask position)
//@scale Mask scaling coefficient. (For example, 2.0 means a doubled size)
maskPosition point:MaskPoint x_shift:double y_shift:double scale:double = MaskPosition;


//@class StickerFormat @description Describes format of a sticker

//@description The sticker is an image in WEBP format
stickerFormatWebp = StickerFormat;

//@description The sticker is an animation in TGS format
stickerFormatTgs = StickerFormat;

//@description The sticker is a video in WEBM format
stickerFormatWebm = StickerFormat;


//@class StickerType @description Describes type of a sticker

//@description The sticker is a regular sticker
stickerTypeRegular = StickerType;

//@description The sticker is a mask in WEBP format to be placed on photos or videos
stickerTypeMask = StickerType;

//@description The sticker is a custom emoji to be used inside message text and caption
stickerTypeCustomEmoji = StickerType;


//@class StickerFullType @description Contains full information about sticker type

//@description The sticker is a regular sticker @premium_animation Premium animation of the sticker; may be null. If present, only Telegram Premium users can use the sticker
stickerFullTypeRegular premium_animation:file = StickerFullType;

//@description The sticker is a mask in WEBP format to be placed on photos or videos @mask_position Position where the mask is placed; may be null
stickerFullTypeMask mask_position:maskPosition = StickerFullType;

//@description The sticker is a custom emoji to be used inside message text and caption. Currently, only Telegram Premium users can use custom emoji
//@custom_emoji_id Identifier of the custom emoji
//@needs_repainting True, if the sticker must be repainted to a text color in messages, the color of the Telegram Premium badge in emoji status, white color on chat photos, or another appropriate color in other places
stickerFullTypeCustomEmoji custom_emoji_id:int64 needs_repainting:Bool = StickerFullType;


//@description Represents a closed vector path. The path begins at the end point of the last command @commands List of vector path commands
closedVectorPath commands:vector<VectorPathCommand> = ClosedVectorPath;


//@description Describes one answer option of a poll
//@text Option text; 1-100 characters
//@voter_count Number of voters for this option, available only for closed or voted polls
//@vote_percentage The percentage of votes for this option; 0-100
//@is_chosen True, if the option was chosen by the user
//@is_being_chosen True, if the option is being chosen by a pending setPollAnswer request
pollOption text:string voter_count:int32 vote_percentage:int32 is_chosen:Bool is_being_chosen:Bool = PollOption;


//@class PollType @description Describes the type of a poll

//@description A regular poll @allow_multiple_answers True, if multiple answer options can be chosen simultaneously
pollTypeRegular allow_multiple_answers:Bool = PollType;

//@description A poll in quiz mode, which has exactly one correct answer option and can be answered only once
//@correct_option_id 0-based identifier of the correct answer option; -1 for a yet unanswered poll
//@explanation Text that is shown when the user chooses an incorrect answer or taps on the lamp icon; 0-200 characters with at most 2 line feeds; empty for a yet unanswered poll
pollTypeQuiz correct_option_id:int32 explanation:formattedText = PollType;


//@description Describes an animation file. The animation must be encoded in GIF or MPEG4 format
//@duration Duration of the animation, in seconds; as defined by the sender
//@width Width of the animation
//@height Height of the animation
//@file_name Original name of the file; as defined by the sender
//@mime_type MIME type of the file, usually "image/gif" or "video/mp4"
//@has_stickers True, if stickers were added to the animation. The list of corresponding sticker set can be received using getAttachedStickerSets
//@minithumbnail Animation minithumbnail; may be null
//@thumbnail Animation thumbnail in JPEG or MPEG4 format; may be null
//@animation File containing the animation
animation duration:int32 width:int32 height:int32 file_name:string mime_type:string has_stickers:Bool minithumbnail:minithumbnail thumbnail:thumbnail animation:file = Animation;

//@description Describes an audio file. Audio is usually in MP3 or M4A format
//@duration Duration of the audio, in seconds; as defined by the sender
//@title Title of the audio; as defined by the sender
//@performer Performer of the audio; as defined by the sender
//@file_name Original name of the file; as defined by the sender
//@mime_type The MIME type of the file; as defined by the sender
//@album_cover_minithumbnail The minithumbnail of the album cover; may be null
//@album_cover_thumbnail The thumbnail of the album cover in JPEG format; as defined by the sender. The full size thumbnail is supposed to be extracted from the downloaded audio file; may be null
//@external_album_covers Album cover variants to use if the downloaded audio file contains no album cover. Provided thumbnail dimensions are approximate
//@audio File containing the audio
audio duration:int32 title:string performer:string file_name:string mime_type:string album_cover_minithumbnail:minithumbnail album_cover_thumbnail:thumbnail external_album_covers:vector<thumbnail> audio:file = Audio;

//@description Describes a document of any type
//@file_name Original name of the file; as defined by the sender
//@mime_type MIME type of the file; as defined by the sender
//@minithumbnail Document minithumbnail; may be null
//@thumbnail Document thumbnail in JPEG or PNG format (PNG will be used only for background patterns); as defined by the sender; may be null
//@document File containing the document
document file_name:string mime_type:string minithumbnail:minithumbnail thumbnail:thumbnail document:file = Document;

//@description Describes a photo
//@has_stickers True, if stickers were added to the photo. The list of corresponding sticker sets can be received using getAttachedStickerSets
//@minithumbnail Photo minithumbnail; may be null
//@sizes Available variants of the photo, in different sizes
photo has_stickers:Bool minithumbnail:minithumbnail sizes:vector<photoSize> = Photo;

//@description Describes a sticker
//@id Unique sticker identifier within the set; 0 if none
//@set_id The identifier of the sticker set to which the sticker belongs; 0 if none
//@width Sticker width; as defined by the sender
//@height Sticker height; as defined by the sender
//@emoji Emoji corresponding to the sticker
//@format Sticker format
//@full_type Sticker's full type
//@outline Sticker's outline represented as a list of closed vector paths; may be empty. The coordinate system origin is in the upper-left corner
//@thumbnail Sticker thumbnail in WEBP or JPEG format; may be null
//@sticker File containing the sticker
sticker id:int64 set_id:int64 width:int32 height:int32 emoji:string format:StickerFormat full_type:StickerFullType outline:vector<closedVectorPath> thumbnail:thumbnail sticker:file = Sticker;

//@description Describes a video file
//@duration Duration of the video, in seconds; as defined by the sender
//@width Video width; as defined by the sender
//@height Video height; as defined by the sender
//@file_name Original name of the file; as defined by the sender
//@mime_type MIME type of the file; as defined by the sender
//@has_stickers True, if stickers were added to the video. The list of corresponding sticker sets can be received using getAttachedStickerSets
//@supports_streaming True, if the video is supposed to be streamed
//@minithumbnail Video minithumbnail; may be null
//@thumbnail Video thumbnail in JPEG or MPEG4 format; as defined by the sender; may be null
//@video File containing the video
video duration:int32 width:int32 height:int32 file_name:string mime_type:string has_stickers:Bool supports_streaming:Bool minithumbnail:minithumbnail thumbnail:thumbnail video:file = Video;

//@description Describes a video note. The video must be equal in width and height, cropped to a circle, and stored in MPEG4 format
//@duration Duration of the video, in seconds; as defined by the sender
//@waveform A waveform representation of the video note's audio in 5-bit format; may be empty if unknown
//@length Video width and height; as defined by the sender
//@minithumbnail Video minithumbnail; may be null
//@thumbnail Video thumbnail in JPEG format; as defined by the sender; may be null
//@speech_recognition_result Result of speech recognition in the video note; may be null
//@video File containing the video
videoNote duration:int32 waveform:bytes length:int32 minithumbnail:minithumbnail thumbnail:thumbnail speech_recognition_result:SpeechRecognitionResult video:file = VideoNote;

//@description Describes a voice note. The voice note must be encoded with the Opus codec, and stored inside an OGG container. Voice notes can have only a single audio channel
//@duration Duration of the voice note, in seconds; as defined by the sender
//@waveform A waveform representation of the voice note in 5-bit format
//@mime_type MIME type of the file; as defined by the sender
//@speech_recognition_result Result of speech recognition in the voice note; may be null
//@voice File containing the voice note
voiceNote duration:int32 waveform:bytes mime_type:string speech_recognition_result:SpeechRecognitionResult voice:file = VoiceNote;

//@description Describes an animated or custom representation of an emoji
//@sticker Sticker for the emoji; may be null if yet unknown for a custom emoji. If the sticker is a custom emoji, it can have arbitrary format different from stickerFormatTgs
//@sticker_width Expected width of the sticker, which can be used if the sticker is null
//@sticker_height Expected height of the sticker, which can be used if the sticker is null
//@fitzpatrick_type Emoji modifier fitzpatrick type; 0-6; 0 if none
//@sound File containing the sound to be played when the sticker is clicked; may be null. The sound is encoded with the Opus codec, and stored inside an OGG container
animatedEmoji sticker:sticker sticker_width:int32 sticker_height:int32 fitzpatrick_type:int32 sound:file = AnimatedEmoji;

//@description Describes a user contact
//@phone_number Phone number of the user
//@first_name First name of the user; 1-255 characters in length
//@last_name Last name of the user
//@vcard Additional data about the user in a form of vCard; 0-2048 bytes in length
//@user_id Identifier of the user, if known; 0 otherwise
contact phone_number:string first_name:string last_name:string vcard:string user_id:int53 = Contact;

//@description Describes a location on planet Earth
//@latitude Latitude of the location in degrees; as defined by the sender
//@longitude Longitude of the location, in degrees; as defined by the sender
//@horizontal_accuracy The estimated horizontal accuracy of the location, in meters; as defined by the sender. 0 if unknown
location latitude:double longitude:double horizontal_accuracy:double = Location;

//@description Describes a venue
//@location Venue location; as defined by the sender
//@title Venue name; as defined by the sender
//@address Venue address; as defined by the sender
//@provider Provider of the venue database; as defined by the sender. Currently, only "foursquare" and "gplaces" (Google Places) need to be supported
//@id Identifier of the venue in the provider database; as defined by the sender
//@type Type of the venue in the provider database; as defined by the sender
venue location:location title:string address:string provider:string id:string type:string = Venue;

//@description Describes a game. Use getInternalLink with internalLinkTypeGame to share the game
//@id Unique game identifier
//@short_name Game short name
//@title Game title
//@text Game text, usually containing scoreboards for a game
//@param_description Game description
//@photo Game photo
//@animation Game animation; may be null
game id:int64 short_name:string title:string text:formattedText description:string photo:photo animation:animation = Game;

//@description Describes a Web App. Use getInternalLink with internalLinkTypeWebApp to share the Web App
//@short_name Web App short name
//@title Web App title
//@param_description Web App description
//@photo Web App photo
//@animation Web App animation; may be null
webApp short_name:string title:string description:string photo:photo animation:animation = WebApp;

//@description Describes a poll
//@id Unique poll identifier
//@question Poll question; 1-300 characters
//@options List of poll answer options
//@total_voter_count Total number of voters, participating in the poll
//@recent_voter_user_ids User identifiers of recent voters, if the poll is non-anonymous
//@is_anonymous True, if the poll is anonymous
//@type Type of the poll
//@open_period Amount of time the poll will be active after creation, in seconds
//@close_date Point in time (Unix timestamp) when the poll will automatically be closed
//@is_closed True, if the poll is closed
poll id:int64 question:string options:vector<pollOption> total_voter_count:int32 recent_voter_user_ids:vector<int53> is_anonymous:Bool type:PollType open_period:int32 close_date:int32 is_closed:Bool = Poll;


//@description Describes a user profile photo
//@id Photo identifier; 0 for an empty photo. Can be used to find a photo in a list of user profile photos
//@small A small (160x160) user profile photo. The file can be downloaded only before the photo is changed
//@big A big (640x640) user profile photo. The file can be downloaded only before the photo is changed
//@minithumbnail User profile photo minithumbnail; may be null
//@has_animation True, if the photo has animated variant
//@is_personal True, if the photo is visible only for the current user
profilePhoto id:int64 small:file big:file minithumbnail:minithumbnail has_animation:Bool is_personal:Bool = ProfilePhoto;

//@description Contains basic information about the photo of a chat
//@small A small (160x160) chat photo variant in JPEG format. The file can be downloaded only before the photo is changed
//@big A big (640x640) chat photo variant in JPEG format. The file can be downloaded only before the photo is changed
//@minithumbnail Chat photo minithumbnail; may be null
//@has_animation True, if the photo has animated variant
//@is_personal True, if the photo is visible only for the current user
chatPhotoInfo small:file big:file minithumbnail:minithumbnail has_animation:Bool is_personal:Bool = ChatPhotoInfo;


//@class UserType @description Represents the type of a user. The following types are possible: regular users, deleted users and bots

//@description A regular user
userTypeRegular = UserType;

//@description A deleted user or deleted bot. No information on the user besides the user identifier is available. It is not possible to perform any active actions on this type of user
userTypeDeleted = UserType;

//@description A bot (see https://core.telegram.org/bots)
//@can_join_groups True, if the bot can be invited to basic group and supergroup chats
//@can_read_all_group_messages True, if the bot can read all messages in basic group or supergroup chats and not just those addressed to the bot. In private and channel chats a bot can always read all messages
//@is_inline True, if the bot supports inline queries
//@inline_query_placeholder Placeholder for inline queries (displayed on the application input field)
//@need_location True, if the location of the user is expected to be sent with every inline query to this bot
//@can_be_added_to_attachment_menu True, if the bot can be added to attachment menu
userTypeBot can_join_groups:Bool can_read_all_group_messages:Bool is_inline:Bool inline_query_placeholder:string need_location:Bool can_be_added_to_attachment_menu:Bool = UserType;

//@description No information on the user besides the user identifier is available, yet this user has not been deleted. This object is extremely rare and must be handled like a deleted user. It is not possible to perform any actions on users of this type
userTypeUnknown = UserType;


//@description Represents a command supported by a bot @command Text of the bot command @param_description Description of the bot command
botCommand command:string description:string = BotCommand;

//@description Contains a list of bot commands @bot_user_id Bot's user identifier @commands List of bot commands
botCommands bot_user_id:int53 commands:vector<botCommand> = BotCommands;

//@description Describes a button to be shown instead of bot commands menu button @text Text of the button @url URL to be passed to openWebApp
botMenuButton text:string url:string = BotMenuButton;


//@description Represents a location to which a chat is connected @location The location @address Location address; 1-64 characters, as defined by the chat owner
chatLocation location:location address:string = ChatLocation;


//@class ChatPhotoStickerType @description Describes type of a sticker, which was used to create a chat photo

//@description Information about the sticker, which was used to create the chat photo
//@sticker_set_id Sticker set identifier
//@sticker_id Identifier of the sticker in the set
chatPhotoStickerTypeRegularOrMask sticker_set_id:int64 sticker_id:int64 = ChatPhotoStickerType;

//@description Information about the custom emoji, which was used to create the chat photo
//@custom_emoji_id Identifier of the custom emoji
chatPhotoStickerTypeCustomEmoji custom_emoji_id:int64 = ChatPhotoStickerType;


//@description Information about the sticker, which was used to create the chat photo. The sticker is shown at the center of the photo and occupies at most 67% of it
//@type Type of the sticker
//@background_fill The fill to be used as background for the sticker; rotation angle in backgroundFillGradient isn't supported
chatPhotoSticker type:ChatPhotoStickerType background_fill:BackgroundFill = ChatPhotoSticker;

//@description Animated variant of a chat photo in MPEG4 format
//@length Animation width and height
//@file Information about the animation file
//@main_frame_timestamp Timestamp of the frame, used as a static chat photo
animatedChatPhoto length:int32 file:file main_frame_timestamp:double = AnimatedChatPhoto;


//@description Describes a chat or user profile photo
//@id Unique photo identifier
//@added_date Point in time (Unix timestamp) when the photo has been added
//@minithumbnail Photo minithumbnail; may be null
//@sizes Available variants of the photo in JPEG format, in different size
//@animation A big (up to 1280x1280) animated variant of the photo in MPEG4 format; may be null
//@small_animation A small (160x160) animated variant of the photo in MPEG4 format; may be null even the big animation is available
//@sticker Sticker-based version of the chat photo; may be null
chatPhoto id:int64 added_date:int32 minithumbnail:minithumbnail sizes:vector<photoSize> animation:animatedChatPhoto small_animation:animatedChatPhoto sticker:chatPhotoSticker = ChatPhoto;

//@description Contains a list of chat or user profile photos @total_count Total number of photos @photos List of photos
chatPhotos total_count:int32 photos:vector<chatPhoto> = ChatPhotos;


//@class InputChatPhoto @description Describes a photo to be set as a user profile or chat photo

//@description A previously used profile photo of the current user @chat_photo_id Identifier of the current user's profile photo to reuse
inputChatPhotoPrevious chat_photo_id:int64 = InputChatPhoto;

//@description A static photo in JPEG format @photo Photo to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed
inputChatPhotoStatic photo:InputFile = InputChatPhoto;

//@description An animation in MPEG4 format; must be square, at most 10 seconds long, have width between 160 and 1280 and be at most 2MB in size
//@animation Animation to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed
//@main_frame_timestamp Timestamp of the frame, which will be used as static chat photo
inputChatPhotoAnimation animation:InputFile main_frame_timestamp:double = InputChatPhoto;

//@description A sticker on a custom background @sticker Information about the sticker
inputChatPhotoSticker sticker:chatPhotoSticker = InputChatPhoto;


//@description Describes actions that a user is allowed to take in a chat
//@can_send_basic_messages True, if the user can send text messages, contacts, invoices, locations, and venues
//@can_send_audios True, if the user can send music files
//@can_send_documents True, if the user can send documents
//@can_send_photos True, if the user can send audio photos
//@can_send_videos True, if the user can send audio videos
//@can_send_video_notes True, if the user can send video notes
//@can_send_voice_notes True, if the user can send voice notes
//@can_send_polls True, if the user can send polls
//@can_send_other_messages True, if the user can send animations, games, stickers, and dice and use inline bots
//@can_add_web_page_previews True, if the user may add a web page preview to their messages
//@can_change_info True, if the user can change the chat title, photo, and other settings
//@can_invite_users True, if the user can invite new users to the chat
//@can_pin_messages True, if the user can pin messages
//@can_manage_topics True, if the user can manage topics
chatPermissions can_send_basic_messages:Bool can_send_audios:Bool can_send_documents:Bool can_send_photos:Bool can_send_videos:Bool can_send_video_notes:Bool can_send_voice_notes:Bool can_send_polls:Bool can_send_other_messages:Bool can_add_web_page_previews:Bool can_change_info:Bool can_invite_users:Bool can_pin_messages:Bool can_manage_topics:Bool = ChatPermissions;

//@description Describes rights of the administrator
//@can_manage_chat True, if the administrator can get chat event log, get chat statistics, get message statistics in channels, get channel members, see anonymous administrators in supergroups and ignore slow mode. Implied by any other privilege; applicable to supergroups and channels only
//@can_change_info True, if the administrator can change the chat title, photo, and other settings
//@can_post_messages True, if the administrator can create channel posts; applicable to channels only
//@can_edit_messages True, if the administrator can edit messages of other users and pin messages; applicable to channels only
//@can_delete_messages True, if the administrator can delete messages of other users
//@can_invite_users True, if the administrator can invite new users to the chat
//@can_restrict_members True, if the administrator can restrict, ban, or unban chat members; always true for channels
//@can_pin_messages True, if the administrator can pin messages; applicable to basic groups and supergroups only
//@can_manage_topics True, if the administrator can manage topics; applicable to forum supergroups only
//@can_promote_members True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that were directly or indirectly promoted by them
//@can_manage_video_chats True, if the administrator can manage video chats
//@is_anonymous True, if the administrator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only
chatAdministratorRights can_manage_chat:Bool can_change_info:Bool can_post_messages:Bool can_edit_messages:Bool can_delete_messages:Bool can_invite_users:Bool can_restrict_members:Bool can_pin_messages:Bool can_manage_topics:Bool can_promote_members:Bool can_manage_video_chats:Bool is_anonymous:Bool = ChatAdministratorRights;


//@description Describes an option for buying Telegram Premium to a user
//@currency ISO 4217 currency code for Telegram Premium subscription payment
//@amount The amount to pay, in the smallest units of the currency
//@discount_percentage The discount associated with this option, as a percentage
//@month_count Number of month the Telegram Premium subscription will be active
//@store_product_id Identifier of the store product associated with the option
//@payment_link An internal link to be opened for buying Telegram Premium to the user if store payment isn't possible; may be null if direct payment isn't available
premiumPaymentOption currency:string amount:int53 discount_percentage:int32 month_count:int32 store_product_id:string payment_link:InternalLinkType = PremiumPaymentOption;

//@description Describes an option for buying or upgrading Telegram Premium for self
//@payment_option Information about the payment option
//@is_current True, if this is the currently used Telegram Premium subscription option
//@is_upgrade True, if the payment option can be used to upgrade the existing Telegram Premium subscription
//@last_transaction_id Identifier of the last in-store transaction for the currently used option
premiumStatePaymentOption payment_option:premiumPaymentOption is_current:Bool is_upgrade:Bool last_transaction_id:string = PremiumStatePaymentOption;


//@description Describes a custom emoji to be shown instead of the Telegram Premium badge @custom_emoji_id Identifier of the custom emoji in stickerFormatTgs format
emojiStatus custom_emoji_id:int64 = EmojiStatus;

//@description Contains a list of emoji statuses @emoji_statuses The list of emoji statuses
emojiStatuses emoji_statuses:vector<emojiStatus> = EmojiStatuses;


//@description Describes usernames assigned to a user, a supergroup, or a channel
//@active_usernames List of active usernames; the first one must be shown as the primary username. The order of active usernames can be changed with reorderActiveUsernames or reorderSupergroupActiveUsernames
//@disabled_usernames List of currently disabled usernames; the username can be activated with toggleUsernameIsActive/toggleSupergroupUsernameIsActive
//@editable_username The active username, which can be changed with setUsername/setSupergroupUsername
usernames active_usernames:vector<string> disabled_usernames:vector<string> editable_username:string = Usernames;


//@description Represents a user
//@id User identifier
//@first_name First name of the user
//@last_name Last name of the user
//@usernames Usernames of the user; may be null
//@phone_number Phone number of the user
//@status Current online status of the user
//@profile_photo Profile photo of the user; may be null
//@emoji_status Emoji status to be shown instead of the default Telegram Premium badge; may be null. For Telegram Premium users only
//@is_contact The user is a contact of the current user
//@is_mutual_contact The user is a contact of the current user and the current user is a contact of the user
//@is_verified True, if the user is verified
//@is_premium True, if the user is a Telegram Premium user
//@is_support True, if the user is Telegram support account
//@restriction_reason If non-empty, it contains a human-readable description of the reason why access to this user must be restricted
//@is_scam True, if many users reported this user as a scam
//@is_fake True, if many users reported this user as a fake account
//@have_access If false, the user is inaccessible, and the only information known about the user is inside this class. Identifier of the user can't be passed to any method
//@type Type of the user
//@language_code IETF language tag of the user's language; only available to bots
//@added_to_attachment_menu True, if the user added the current bot to attachment menu; only available to bots
user id:int53 first_name:string last_name:string usernames:usernames phone_number:string status:UserStatus profile_photo:profilePhoto emoji_status:emojiStatus is_contact:Bool is_mutual_contact:Bool is_verified:Bool is_premium:Bool is_support:Bool restriction_reason:string is_scam:Bool is_fake:Bool have_access:Bool type:UserType language_code:string added_to_attachment_menu:Bool = User;


//@description Contains information about a bot
//@short_description The text that is shown on the bot's profile page and is sent together with the link when users share the bot
//@param_description The text shown in the chat with the bot if the chat is empty
//@photo Photo shown in the chat with the bot if the chat is empty; may be null
//@animation Animation shown in the chat with the bot if the chat is empty; may be null
//@menu_button Information about a button to show instead of the bot commands menu button; may be null if ordinary bot commands menu must be shown
//@commands List of the bot commands
//@default_group_administrator_rights Default administrator rights for adding the bot to basic group and supergroup chats; may be null
//@default_channel_administrator_rights Default administrator rights for adding the bot to channels; may be null
botInfo short_description:string description:string photo:photo animation:animation menu_button:botMenuButton commands:vector<botCommand> default_group_administrator_rights:chatAdministratorRights default_channel_administrator_rights:chatAdministratorRights = BotInfo;

//@description Contains full information about a user
//@personal_photo User profile photo set by the current user for the contact; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown.
//-If non-null, then it is the same photo as in user.profile_photo and chat.photo. This photo isn't returned in the list of user photos
//@photo User profile photo; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown.
//-If non-null and personal_photo is null, then it is the same photo as in user.profile_photo and chat.photo
//@public_photo User profile photo visible if the main photo is hidden by privacy settings; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown.
//-If non-null and both photo and personal_photo are null, then it is the same photo as in user.profile_photo and chat.photo. This photo isn't returned in the list of user photos
//@is_blocked True, if the user is blocked by the current user
//@can_be_called True, if the user can be called
//@supports_video_calls True, if a video call can be created with the user
//@has_private_calls True, if the user can't be called due to their privacy settings
//@has_private_forwards True, if the user can't be linked in forwarded messages due to their privacy settings
//@has_restricted_voice_and_video_note_messages True, if voice and video notes can't be sent or forwarded to the user
//@need_phone_number_privacy_exception True, if the current user needs to explicitly allow to share their phone number with the user when the method addContact is used
//@bio A short user bio; may be null for bots
//@premium_gift_options The list of available options for gifting Telegram Premium to the user
//@group_in_common_count Number of group chats where both the other user and the current user are a member; 0 for the current user
//@bot_info For bots, information about the bot; may be null
userFullInfo personal_photo:chatPhoto photo:chatPhoto public_photo:chatPhoto is_blocked:Bool can_be_called:Bool supports_video_calls:Bool has_private_calls:Bool has_private_forwards:Bool has_restricted_voice_and_video_note_messages:Bool need_phone_number_privacy_exception:Bool bio:formattedText premium_gift_options:vector<premiumPaymentOption> group_in_common_count:int32 bot_info:botInfo = UserFullInfo;

//@description Represents a list of users @total_count Approximate total number of users found @user_ids A list of user identifiers
users total_count:int32 user_ids:vector<int53> = Users;


//@description Contains information about a chat administrator @user_id User identifier of the administrator @custom_title Custom title of the administrator @is_owner True, if the user is the owner of the chat
chatAdministrator user_id:int53 custom_title:string is_owner:Bool = ChatAdministrator;

//@description Represents a list of chat administrators @administrators A list of chat administrators
chatAdministrators administrators:vector<chatAdministrator> = ChatAdministrators;


//@class ChatMemberStatus @description Provides information about the status of a member in a chat

//@description The user is the owner of the chat and has all the administrator privileges
//@custom_title A custom title of the owner; 0-16 characters without emojis; applicable to supergroups only
//@is_anonymous True, if the creator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only
//@is_member True, if the user is a member of the chat
chatMemberStatusCreator custom_title:string is_anonymous:Bool is_member:Bool = ChatMemberStatus;

//@description The user is a member of the chat and has some additional privileges. In basic groups, administrators can edit and delete messages sent by others, add new members, ban unprivileged members, and manage video chats.
//-In supergroups and channels, there are more detailed options for administrator privileges
//@custom_title A custom title of the administrator; 0-16 characters without emojis; applicable to supergroups only
//@can_be_edited True, if the current user can edit the administrator privileges for the called user
//@rights Rights of the administrator
chatMemberStatusAdministrator custom_title:string can_be_edited:Bool rights:chatAdministratorRights = ChatMemberStatus;

//@description The user is a member of the chat, without any additional privileges or restrictions
chatMemberStatusMember = ChatMemberStatus;

//@description The user is under certain restrictions in the chat. Not supported in basic groups and channels
//@is_member True, if the user is a member of the chat
//@restricted_until_date Point in time (Unix timestamp) when restrictions will be lifted from the user; 0 if never. If the user is restricted for more than 366 days or for less than 30 seconds from the current time, the user is considered to be restricted forever
//@permissions User permissions in the chat
chatMemberStatusRestricted is_member:Bool restricted_until_date:int32 permissions:chatPermissions = ChatMemberStatus;

//@description The user or the chat is not a chat member
chatMemberStatusLeft = ChatMemberStatus;

//@description The user or the chat was banned (and hence is not a member of the chat). Implies the user can't return to the chat, view messages, or be used as a participant identifier to join a video chat of the chat
//@banned_until_date Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days or for less than 30 seconds from the current time, the user is considered to be banned forever. Always 0 in basic groups
chatMemberStatusBanned banned_until_date:int32 = ChatMemberStatus;


//@description Describes a user or a chat as a member of another chat
//@member_id Identifier of the chat member. Currently, other chats can be only Left or Banned. Only supergroups and channels can have other chats as Left or Banned members and these chats must be supergroups or channels
//@inviter_user_id Identifier of a user that invited/promoted/banned this member in the chat; 0 if unknown
//@joined_chat_date Point in time (Unix timestamp) when the user joined/was promoted/was banned in the chat
//@status Status of the member in the chat
chatMember member_id:MessageSender inviter_user_id:int53 joined_chat_date:int32 status:ChatMemberStatus = ChatMember;

//@description Contains a list of chat members @total_count Approximate total number of chat members found @members A list of chat members
chatMembers total_count:int32 members:vector<chatMember> = ChatMembers;


//@class ChatMembersFilter @description Specifies the kind of chat members to return in searchChatMembers

//@description Returns contacts of the user
chatMembersFilterContacts = ChatMembersFilter;

//@description Returns the owner and administrators
chatMembersFilterAdministrators = ChatMembersFilter;

//@description Returns all chat members, including restricted chat members
chatMembersFilterMembers = ChatMembersFilter;

//@description Returns users which can be mentioned in the chat @message_thread_id If non-zero, the identifier of the current message thread
chatMembersFilterMention message_thread_id:int53 = ChatMembersFilter;

//@description Returns users under certain restrictions in the chat; can be used only by administrators in a supergroup
chatMembersFilterRestricted = ChatMembersFilter;

//@description Returns users banned from the chat; can be used only by administrators in a supergroup or in a channel
chatMembersFilterBanned = ChatMembersFilter;

//@description Returns bot members of the chat
chatMembersFilterBots = ChatMembersFilter;


//@class SupergroupMembersFilter @description Specifies the kind of chat members to return in getSupergroupMembers

//@description Returns recently active users in reverse chronological order
supergroupMembersFilterRecent = SupergroupMembersFilter;

//@description Returns contacts of the user, which are members of the supergroup or channel @query Query to search for
supergroupMembersFilterContacts query:string = SupergroupMembersFilter;

//@description Returns the owner and administrators
supergroupMembersFilterAdministrators = SupergroupMembersFilter;

//@description Used to search for supergroup or channel members via a (string) query @query Query to search for
supergroupMembersFilterSearch query:string = SupergroupMembersFilter;

//@description Returns restricted supergroup members; can be used only by administrators @query Query to search for
supergroupMembersFilterRestricted query:string = SupergroupMembersFilter;

//@description Returns users banned from the supergroup or channel; can be used only by administrators @query Query to search for
supergroupMembersFilterBanned query:string = SupergroupMembersFilter;

//@description Returns users which can be mentioned in the supergroup @query Query to search for @message_thread_id If non-zero, the identifier of the current message thread
supergroupMembersFilterMention query:string message_thread_id:int53 = SupergroupMembersFilter;

//@description Returns bot members of the supergroup or channel
supergroupMembersFilterBots = SupergroupMembersFilter;


//@description Contains a chat invite link
//@invite_link Chat invite link
//@name Name of the link
//@creator_user_id User identifier of an administrator created the link
//@date Point in time (Unix timestamp) when the link was created
//@edit_date Point in time (Unix timestamp) when the link was last edited; 0 if never or unknown
//@expiration_date Point in time (Unix timestamp) when the link will expire; 0 if never
//@member_limit The maximum number of members, which can join the chat using the link simultaneously; 0 if not limited. Always 0 if the link requires approval
//@member_count Number of chat members, which joined the chat using the link
//@pending_join_request_count Number of pending join requests created using this link
//@creates_join_request True, if the link only creates join request. If true, total number of joining members will be unlimited
//@is_primary True, if the link is primary. Primary invite link can't have name, expiration date, or usage limit. There is exactly one primary invite link for each administrator with can_invite_users right at a given time
//@is_revoked True, if the link was revoked
chatInviteLink invite_link:string name:string creator_user_id:int53 date:int32 edit_date:int32 expiration_date:int32 member_limit:int32 member_count:int32 pending_join_request_count:int32 creates_join_request:Bool is_primary:Bool is_revoked:Bool = ChatInviteLink;

//@description Contains a list of chat invite links @total_count Approximate total number of chat invite links found @invite_links List of invite links
chatInviteLinks total_count:int32 invite_links:vector<chatInviteLink> = ChatInviteLinks;

//@description Describes a chat administrator with a number of active and revoked chat invite links
//@user_id Administrator's user identifier
//@invite_link_count Number of active invite links
//@revoked_invite_link_count Number of revoked invite links
chatInviteLinkCount user_id:int53 invite_link_count:int32 revoked_invite_link_count:int32 = ChatInviteLinkCount;

//@description Contains a list of chat invite link counts @invite_link_counts List of invite link counts
chatInviteLinkCounts invite_link_counts:vector<chatInviteLinkCount> = ChatInviteLinkCounts;

//@description Describes a chat member joined a chat via an invite link @user_id User identifier @joined_chat_date Point in time (Unix timestamp) when the user joined the chat @approver_user_id User identifier of the chat administrator, approved user join request
chatInviteLinkMember user_id:int53 joined_chat_date:int32 approver_user_id:int53 = ChatInviteLinkMember;

//@description Contains a list of chat members joined a chat via an invite link @total_count Approximate total number of chat members found @members List of chat members, joined a chat via an invite link
chatInviteLinkMembers total_count:int32 members:vector<chatInviteLinkMember> = ChatInviteLinkMembers;

//@description Contains information about a chat invite link
//@chat_id Chat identifier of the invite link; 0 if the user has no access to the chat before joining
//@accessible_for If non-zero, the amount of time for which read access to the chat will remain available, in seconds
//@type Type of the chat
//@title Title of the chat
//@photo Chat photo; may be null
//@param_description Chat description
//@member_count Number of members in the chat
//@member_user_ids User identifiers of some chat members that may be known to the current user
//@creates_join_request True, if the link only creates join request
//@is_public True, if the chat is a public supergroup or channel, i.e. it has a username or it is a location-based supergroup
chatInviteLinkInfo chat_id:int53 accessible_for:int32 type:ChatType title:string photo:chatPhotoInfo description:string member_count:int32 member_user_ids:vector<int53> creates_join_request:Bool is_public:Bool = ChatInviteLinkInfo;

//@description Describes a user that sent a join request and waits for administrator approval @user_id User identifier @date Point in time (Unix timestamp) when the user sent the join request @bio A short bio of the user
chatJoinRequest user_id:int53 date:int32 bio:string = ChatJoinRequest;

//@description Contains a list of requests to join a chat @total_count Approximate total number of requests found @requests List of the requests
chatJoinRequests total_count:int32 requests:vector<chatJoinRequest> = ChatJoinRequests;

//@description Contains information about pending join requests for a chat @total_count Total number of pending join requests @user_ids Identifiers of at most 3 users sent the newest pending join requests
chatJoinRequestsInfo total_count:int32 user_ids:vector<int53> = ChatJoinRequestsInfo;


//@description Represents a basic group of 0-200 users (must be upgraded to a supergroup to accommodate more than 200 users)
//@id Group identifier
//@member_count Number of members in the group
//@status Status of the current user in the group
//@is_active True, if the group is active
//@upgraded_to_supergroup_id Identifier of the supergroup to which this group was upgraded; 0 if none
basicGroup id:int53 member_count:int32 status:ChatMemberStatus is_active:Bool upgraded_to_supergroup_id:int53 = BasicGroup;

//@description Contains full information about a basic group
//@photo Chat photo; may be null if empty or unknown. If non-null, then it is the same photo as in chat.photo
//@param_description Group description. Updated only after the basic group is opened
//@creator_user_id User identifier of the creator of the group; 0 if unknown
//@members Group members
//@can_hide_members True, if non-administrators and non-bots can be hidden in responses to getSupergroupMembers and searchChatMembers for non-administrators after upgrading the basic group to a supergroup
//@can_toggle_aggressive_anti_spam True, if aggressive anti-spam checks can be enabled or disabled in the supergroup after upgrading the basic group to a supergroup
//@invite_link Primary invite link for this group; may be null. For chat administrators with can_invite_users right only. Updated only after the basic group is opened
//@bot_commands List of commands of bots in the group
basicGroupFullInfo photo:chatPhoto description:string creator_user_id:int53 members:vector<chatMember> can_hide_members:Bool can_toggle_aggressive_anti_spam:Bool invite_link:chatInviteLink bot_commands:vector<botCommands> = BasicGroupFullInfo;


//@description Represents a supergroup or channel with zero or more members (subscribers in the case of channels). From the point of view of the system, a channel is a special kind of a supergroup:
//-only administrators can post and see the list of members, and posts from all administrators use the name and photo of the channel instead of individual names and profile photos.
//-Unlike supergroups, channels can have an unlimited number of subscribers
//@id Supergroup or channel identifier
//@usernames Usernames of the supergroup or channel; may be null
//@date Point in time (Unix timestamp) when the current user joined, or the point in time when the supergroup or channel was created, in case the user is not a member
//@status Status of the current user in the supergroup or channel; custom title will always be empty
//@member_count Number of members in the supergroup or channel; 0 if unknown. Currently, it is guaranteed to be known only if the supergroup or channel was received
//-through searchPublicChats, searchChatsNearby, getInactiveSupergroupChats, getSuitableDiscussionChats, getGroupsInCommon, or getUserPrivacySettingRules
//@has_linked_chat True, if the channel has a discussion group, or the supergroup is the designated discussion group for a channel
//@has_location True, if the supergroup is connected to a location, i.e. the supergroup is a location-based supergroup
//@sign_messages True, if messages sent to the channel need to contain information about the sender. This field is only applicable to channels
//@join_to_send_messages True, if users need to join the supergroup before they can send messages. Always true for channels and non-discussion supergroups
//@join_by_request True, if all users directly joining the supergroup need to be approved by supergroup administrators. Always false for channels and supergroups without username, location, or a linked chat
//@is_slow_mode_enabled True, if the slow mode is enabled in the supergroup
//@is_channel True, if the supergroup is a channel
//@is_broadcast_group True, if the supergroup is a broadcast group, i.e. only administrators can send messages and there is no limit on the number of members
//@is_forum True, if the supergroup must be shown as a forum by default
//@is_verified True, if the supergroup or channel is verified
//@restriction_reason If non-empty, contains a human-readable description of the reason why access to this supergroup or channel must be restricted
//@is_scam True, if many users reported this supergroup or channel as a scam
//@is_fake True, if many users reported this supergroup or channel as a fake account
supergroup id:int53 usernames:usernames date:int32 status:ChatMemberStatus member_count:int32 has_linked_chat:Bool has_location:Bool sign_messages:Bool join_to_send_messages:Bool join_by_request:Bool is_slow_mode_enabled:Bool is_channel:Bool is_broadcast_group:Bool is_forum:Bool is_verified:Bool restriction_reason:string is_scam:Bool is_fake:Bool = Supergroup;

//@description Contains full information about a supergroup or channel
//@photo Chat photo; may be null if empty or unknown. If non-null, then it is the same photo as in chat.photo
//@param_description Supergroup or channel description
//@member_count Number of members in the supergroup or channel; 0 if unknown
//@administrator_count Number of privileged users in the supergroup or channel; 0 if unknown
//@restricted_count Number of restricted users in the supergroup; 0 if unknown
//@banned_count Number of users banned from chat; 0 if unknown
//@linked_chat_id Chat identifier of a discussion group for the channel, or a channel, for which the supergroup is the designated discussion group; 0 if none or unknown
//@slow_mode_delay Delay between consecutive sent messages for non-administrator supergroup members, in seconds
//@slow_mode_delay_expires_in Time left before next message can be sent in the supergroup, in seconds. An updateSupergroupFullInfo update is not triggered when value of this field changes, but both new and old values are non-zero
//@can_get_members True, if members of the chat can be retrieved via getSupergroupMembers or searchChatMembers
//@has_hidden_members True, if non-administrators can receive only administrators and bots using getSupergroupMembers or searchChatMembers
//@can_hide_members True, if non-administrators and non-bots can be hidden in responses to getSupergroupMembers and searchChatMembers for non-administrators
//@can_set_username True, if the chat username can be changed
//@can_set_sticker_set True, if the supergroup sticker set can be changed
//@can_set_location True, if the supergroup location can be changed
//@can_get_statistics True, if the supergroup or channel statistics are available
//@can_toggle_aggressive_anti_spam True, if aggressive anti-spam checks can be enabled or disabled in the supergroup
//@is_all_history_available True, if new chat members will have access to old messages. In public, discussion, of forum groups and all channels, old messages are always available,
//-so this option affects only private non-forum supergroups without a linked chat. The value of this field is only available to chat administrators
//@has_aggressive_anti_spam_enabled True, if aggressive anti-spam checks are enabled in the supergroup. The value of this field is only available to chat administrators
//@sticker_set_id Identifier of the supergroup sticker set; 0 if none
//@location Location to which the supergroup is connected; may be null
//@invite_link Primary invite link for the chat; may be null. For chat administrators with can_invite_users right only
//@bot_commands List of commands of bots in the group
//@upgraded_from_basic_group_id Identifier of the basic group from which supergroup was upgraded; 0 if none
//@upgraded_from_max_message_id Identifier of the last message in the basic group from which supergroup was upgraded; 0 if none
supergroupFullInfo photo:chatPhoto description:string member_count:int32 administrator_count:int32 restricted_count:int32 banned_count:int32 linked_chat_id:int53 slow_mode_delay:int32 slow_mode_delay_expires_in:double can_get_members:Bool has_hidden_members:Bool can_hide_members:Bool can_set_username:Bool can_set_sticker_set:Bool can_set_location:Bool can_get_statistics:Bool can_toggle_aggressive_anti_spam:Bool is_all_history_available:Bool has_aggressive_anti_spam_enabled:Bool sticker_set_id:int64 location:chatLocation invite_link:chatInviteLink bot_commands:vector<botCommands> upgraded_from_basic_group_id:int53 upgraded_from_max_message_id:int53 = SupergroupFullInfo;


//@class SecretChatState @description Describes the current secret chat state

//@description The secret chat is not yet created; waiting for the other user to get online
secretChatStatePending = SecretChatState;

//@description The secret chat is ready to use
secretChatStateReady = SecretChatState;

//@description The secret chat is closed
secretChatStateClosed = SecretChatState;


//@description Represents a secret chat
//@id Secret chat identifier
//@user_id Identifier of the chat partner
//@state State of the secret chat
//@is_outbound True, if the chat was created by the current user; false otherwise
//@key_hash Hash of the currently used key for comparison with the hash of the chat partner's key. This is a string of 36 little-endian bytes, which must be split into groups of 2 bits, each denoting a pixel of one of 4 colors FFFFFF, D5E6F3, 2D5775, and 2F99C9.
//-The pixels must be used to make a 12x12 square image filled from left to right, top to bottom. Alternatively, the first 32 bytes of the hash can be converted to the hexadecimal format and printed as 32 2-digit hex numbers
//@layer Secret chat layer; determines features supported by the chat partner's application. Nested text entities and underline and strikethrough entities are supported if the layer >= 101,
//-files bigger than 2000MB are supported if the layer >= 143, spoiler and custom emoji text entities are supported if the layer >= 144
secretChat id:int32 user_id:int53 state:SecretChatState is_outbound:Bool key_hash:bytes layer:int32 = SecretChat;


//@class MessageSender @description Contains information about the sender of a message

//@description The message was sent by a known user @user_id Identifier of the user that sent the message
messageSenderUser user_id:int53 = MessageSender;

//@description The message was sent on behalf of a chat @chat_id Identifier of the chat that sent the message
messageSenderChat chat_id:int53 = MessageSender;


//@description Represents a list of message senders @total_count Approximate total number of messages senders found @senders List of message senders
messageSenders total_count:int32 senders:vector<MessageSender> = MessageSenders;


//@description Represents a message sender, which can be used to send messages in a chat @sender Available message senders @needs_premium True, if Telegram Premium is needed to use the message sender
chatMessageSender sender:MessageSender needs_premium:Bool = ChatMessageSender;

//@description Represents a list of message senders, which can be used to send messages in a chat @senders List of available message senders
chatMessageSenders senders:vector<chatMessageSender> = ChatMessageSenders;


//@description Represents a viewer of a message @user_id User identifier of the viewer @view_date Approximate point in time (Unix timestamp) when the message was viewed
messageViewer user_id:int53 view_date:int32 = MessageViewer;

//@description Represents a list of message viewers @viewers List of message viewers
messageViewers viewers:vector<messageViewer> = MessageViewers;


//@class MessageForwardOrigin @description Contains information about the origin of a forwarded message

//@description The message was originally sent by a known user @sender_user_id Identifier of the user that originally sent the message
messageForwardOriginUser sender_user_id:int53 = MessageForwardOrigin;

//@description The message was originally sent on behalf of a chat
//@sender_chat_id Identifier of the chat that originally sent the message
//@author_signature For messages originally sent by an anonymous chat administrator, original message author signature
messageForwardOriginChat sender_chat_id:int53 author_signature:string = MessageForwardOrigin;

//@description The message was originally sent by a user, which is hidden by their privacy settings @sender_name Name of the sender
messageForwardOriginHiddenUser sender_name:string = MessageForwardOrigin;

//@description The message was originally a post in a channel
//@chat_id Identifier of the chat from which the message was originally forwarded
//@message_id Message identifier of the original message
//@author_signature Original post author signature
messageForwardOriginChannel chat_id:int53 message_id:int53 author_signature:string = MessageForwardOrigin;

//@description The message was imported from an exported message history @sender_name Name of the sender
messageForwardOriginMessageImport sender_name:string = MessageForwardOrigin;


//@class ReactionType @description Describes type of message reaction

//@description A reaction with an emoji @emoji Text representation of the reaction
reactionTypeEmoji emoji:string = ReactionType;

//@description A reaction with a custom emoji @custom_emoji_id Unique identifier of the custom emoji
reactionTypeCustomEmoji custom_emoji_id:int64 = ReactionType;


//@description Contains information about a forwarded message
//@origin Origin of a forwarded message
//@date Point in time (Unix timestamp) when the message was originally sent
//@public_service_announcement_type The type of a public service announcement for the forwarded message
//@from_chat_id For messages forwarded to the chat with the current user (Saved Messages), to the Replies bot chat, or to the channel's discussion group, the identifier of the chat from which the message was forwarded last time; 0 if unknown
//@from_message_id For messages forwarded to the chat with the current user (Saved Messages), to the Replies bot chat, or to the channel's discussion group, the identifier of the original message from which the new message was forwarded last time; 0 if unknown
messageForwardInfo origin:MessageForwardOrigin date:int32 public_service_announcement_type:string from_chat_id:int53 from_message_id:int53 = MessageForwardInfo;

//@description Contains information about replies to a message
//@reply_count Number of times the message was directly or indirectly replied
//@recent_replier_ids Identifiers of at most 3 recent repliers to the message; available in channels with a discussion supergroup. The users and chats are expected to be inaccessible: only their photo and name will be available
//@last_read_inbox_message_id Identifier of the last read incoming reply to the message
//@last_read_outbox_message_id Identifier of the last read outgoing reply to the message
//@last_message_id Identifier of the last reply to the message
messageReplyInfo reply_count:int32 recent_replier_ids:vector<MessageSender> last_read_inbox_message_id:int53 last_read_outbox_message_id:int53 last_message_id:int53 = MessageReplyInfo;

//@description Contains information about a reaction to a message
//@type Type of the reaction
//@total_count Number of times the reaction was added
//@is_chosen True, if the reaction is chosen by the current user
//@recent_sender_ids Identifiers of at most 3 recent message senders, added the reaction; available in private, basic group and supergroup chats
messageReaction type:ReactionType total_count:int32 is_chosen:Bool recent_sender_ids:vector<MessageSender> = MessageReaction;

//@description Contains information about interactions with a message
//@view_count Number of times the message was viewed
//@forward_count Number of times the message was forwarded
//@reply_info Information about direct or indirect replies to the message; may be null. Currently, available only in channels with a discussion supergroup and discussion supergroups for messages, which are not replies itself
//@reactions The list of reactions added to the message
messageInteractionInfo view_count:int32 forward_count:int32 reply_info:messageReplyInfo reactions:vector<messageReaction> = MessageInteractionInfo;

//@description Contains information about an unread reaction to a message
//@type Type of the reaction
//@sender_id Identifier of the sender, added the reaction
//@is_big True, if the reaction was added with a big animation
unreadReaction type:ReactionType sender_id:MessageSender is_big:Bool = UnreadReaction;


//@class MessageSendingState @description Contains information about the sending state of the message

//@description The message is being sent now, but has not yet been delivered to the server @sending_id Non-persistent message sending identifier, specified by the application
messageSendingStatePending sending_id:int32 = MessageSendingState;

//@description The message failed to be sent
//@error_code An error code; 0 if unknown
//@error_message Error message
//@can_retry True, if the message can be re-sent
//@need_another_sender True, if the message can be re-sent only on behalf of a different sender
//@retry_after Time left before the message can be re-sent, in seconds. No update is sent when this field changes
messageSendingStateFailed error_code:int32 error_message:string can_retry:Bool need_another_sender:Bool retry_after:double = MessageSendingState;


//@description Describes a message
//@id Message identifier; unique for the chat to which the message belongs
//@sender_id Identifier of the sender of the message
//@chat_id Chat identifier
//@sending_state The sending state of the message; may be null
//@scheduling_state The scheduling state of the message; may be null
//@is_outgoing True, if the message is outgoing
//@is_pinned True, if the message is pinned
//@can_be_edited True, if the message can be edited. For live location and poll messages this fields shows whether editMessageLiveLocation or stopPoll can be used with this message by the application
//@can_be_forwarded True, if the message can be forwarded
//@can_be_saved True, if content of the message can be saved locally or copied
//@can_be_deleted_only_for_self True, if the message can be deleted only for the current user while other users will continue to see it
//@can_be_deleted_for_all_users True, if the message can be deleted for all users
//@can_get_added_reactions True, if the list of added reactions is available through getMessageAddedReactions
//@can_get_statistics True, if the message statistics are available through getMessageStatistics
//@can_get_message_thread True, if information about the message thread is available through getMessageThread and getMessageThreadHistory
//@can_get_viewers True, if chat members already viewed the message can be received through getMessageViewers
//@can_get_media_timestamp_links True, if media timestamp links can be generated for media timestamp entities in the message text, caption or web page description through getMessageLink
//@can_report_reactions True, if reactions on the message can be reported through reportMessageReactions
//@has_timestamped_media True, if media timestamp entities refers to a media in this message as opposed to a media in the replied message
//@is_channel_post True, if the message is a channel post. All messages to channels are channel posts, all other messages are not channel posts
//@is_topic_message True, if the message is a forum topic message
//@contains_unread_mention True, if the message contains an unread mention for the current user
//@date Point in time (Unix timestamp) when the message was sent
//@edit_date Point in time (Unix timestamp) when the message was last edited
//@forward_info Information about the initial message sender; may be null
//@interaction_info Information about interactions with the message; may be null
//@unread_reactions Information about unread reactions added to the message
//@reply_in_chat_id If non-zero, the identifier of the chat to which the replied message belongs; Currently, only messages in the Replies chat can have different reply_in_chat_id and chat_id
//@reply_to_message_id If non-zero, the identifier of the message this message is replying to; can be the identifier of a deleted message
//@message_thread_id If non-zero, the identifier of the message thread the message belongs to; unique within the chat to which the message belongs
//@self_destruct_time The message's self-destruct time, in seconds; 0 if none. TDLib will send updateDeleteMessages or updateMessageContent once the time expires
//@self_destruct_in Time left before the message self-destruct timer expires, in seconds. If the self-destruct timer isn't started yet, equals to the value of the self_destruct_time field
//@auto_delete_in Time left before the message will be automatically deleted by message_auto_delete_time setting of the chat, in seconds; 0 if never. TDLib will send updateDeleteMessages or updateMessageContent once the time expires
//@via_bot_user_id If non-zero, the user identifier of the bot through which this message was sent
//@author_signature For channel posts and anonymous group messages, optional author signature
//@media_album_id Unique identifier of an album this message belongs to. Only audios, documents, photos and videos can be grouped together in albums
//@restriction_reason If non-empty, contains a human-readable description of the reason why access to this message must be restricted
//@content Content of the message
//@reply_markup Reply markup for the message; may be null
message id:int53 sender_id:MessageSender chat_id:int53 sending_state:MessageSendingState scheduling_state:MessageSchedulingState is_outgoing:Bool is_pinned:Bool can_be_edited:Bool can_be_forwarded:Bool can_be_saved:Bool can_be_deleted_only_for_self:Bool can_be_deleted_for_all_users:Bool can_get_added_reactions:Bool can_get_statistics:Bool can_get_message_thread:Bool can_get_viewers:Bool can_get_media_timestamp_links:Bool can_report_reactions:Bool has_timestamped_media:Bool is_channel_post:Bool is_topic_message:Bool contains_unread_mention:Bool date:int32 edit_date:int32 forward_info:messageForwardInfo interaction_info:messageInteractionInfo unread_reactions:vector<unreadReaction> reply_in_chat_id:int53 reply_to_message_id:int53 message_thread_id:int53 self_destruct_time:int32 self_destruct_in:double auto_delete_in:double via_bot_user_id:int53 author_signature:string media_album_id:int64 restriction_reason:string content:MessageContent reply_markup:ReplyMarkup = Message;

//@description Contains a list of messages @total_count Approximate total number of messages found @messages List of messages; messages may be null
messages total_count:int32 messages:vector<message> = Messages;

//@description Contains a list of messages found by a search @total_count Approximate total number of messages found; -1 if unknown @messages List of messages @next_offset The offset for the next request. If empty, there are no more results
foundMessages total_count:int32 messages:vector<message> next_offset:string = FoundMessages;

//@description Contains a list of messages found by a search in a given chat @total_count Approximate total number of messages found; -1 if unknown @messages List of messages @next_from_message_id The offset for the next request. If 0, there are no more results
foundChatMessages total_count:int32 messages:vector<message> next_from_message_id:int53 = FoundChatMessages;

//@description Contains information about a message in a specific position @position 0-based message position in the full list of suitable messages @message_id Message identifier @date Point in time (Unix timestamp) when the message was sent
messagePosition position:int32 message_id:int53 date:int32 = MessagePosition;

//@description Contains a list of message positions @total_count Total number of messages found @positions List of message positions
messagePositions total_count:int32 positions:vector<messagePosition> = MessagePositions;

//@description Contains information about found messages sent on a specific day @total_count Total number of found messages sent on the day @message First message sent on the day
messageCalendarDay total_count:int32 message:message = MessageCalendarDay;

//@description Contains information about found messages, split by days according to the option "utc_time_offset" @total_count Total number of found messages @days Information about messages sent
messageCalendar total_count:int32 days:vector<messageCalendarDay> = MessageCalendar;


//@class MessageSource @description Describes source of a message

//@description The message is from a chat history
messageSourceChatHistory = MessageSource;

//@description The message is from a message thread history
messageSourceMessageThreadHistory = MessageSource;

//@description The message is from a forum topic history
messageSourceForumTopicHistory = MessageSource;

//@description The message is from chat, message thread or forum topic history preview
messageSourceHistoryPreview = MessageSource;

//@description The message is from a chat list or a forum topic list
messageSourceChatList = MessageSource;

//@description The message is from search results, including file downloads, local file list, outgoing document messages, calendar
messageSourceSearch = MessageSource;

//@description The message is from a chat event log
messageSourceChatEventLog = MessageSource;

//@description The message is from a notification
messageSourceNotification = MessageSource;

//@description The message is from some other source
messageSourceOther = MessageSource;


//@description Describes a sponsored message
//@message_id Message identifier; unique for the chat to which the sponsored message belongs among both ordinary and sponsored messages
//@is_recommended True, if the message needs to be labeled as "recommended" instead of "sponsored"
//@sponsor_chat_id Sponsor chat identifier; 0 if the sponsor chat is accessible through an invite link
//@sponsor_chat_info Information about the sponsor chat; may be null unless sponsor_chat_id == 0
//@show_chat_photo True, if the sponsor's chat photo must be shown
//@link An internal link to be opened when the sponsored message is clicked; may be null if the sponsor chat needs to be opened instead
//@content Content of the message. Currently, can be only of the type messageText
//@sponsor_info If non-empty, information about the sponsor to be shown along with the message
//@additional_info If non-empty, additional information about the sponsored message to be shown along with the message
sponsoredMessage message_id:int53 is_recommended:Bool sponsor_chat_id:int53 sponsor_chat_info:chatInviteLinkInfo show_chat_photo:Bool link:InternalLinkType content:MessageContent sponsor_info:string additional_info:string = SponsoredMessage;

//@description Contains a list of sponsored messages @messages List of sponsored messages @messages_between The minimum number of messages between shown sponsored messages, or 0 if only one sponsored message must be shown after all ordinary messages
sponsoredMessages messages:vector<sponsoredMessage> messages_between:int32 = SponsoredMessages;


//@description Describes a file added to file download list
//@file_id File identifier
//@message The message with the file
//@add_date Point in time (Unix timestamp) when the file was added to the download list
//@complete_date Point in time (Unix timestamp) when the file downloading was completed; 0 if the file downloading isn't completed
//@is_paused True, if downloading of the file is paused
fileDownload file_id:int32 message:message add_date:int32 complete_date:int32 is_paused:Bool = FileDownload;

//@description Contains number of being downloaded and recently downloaded files found
//@active_count Number of active file downloads found, including paused
//@paused_count Number of paused file downloads found
//@completed_count Number of completed file downloads found
downloadedFileCounts active_count:int32 paused_count:int32 completed_count:int32 = DownloadedFileCounts;

//@description Contains a list of downloaded files, found by a search
//@total_counts Total number of suitable files, ignoring offset
//@files The list of files
//@next_offset The offset for the next request. If empty, there are no more results
foundFileDownloads total_counts:downloadedFileCounts files:vector<fileDownload> next_offset:string = FoundFileDownloads;


//@class NotificationSettingsScope @description Describes the types of chats to which notification settings are relevant

//@description Notification settings applied to all private and secret chats when the corresponding chat setting has a default value
notificationSettingsScopePrivateChats = NotificationSettingsScope;

//@description Notification settings applied to all basic group and supergroup chats when the corresponding chat setting has a default value
notificationSettingsScopeGroupChats = NotificationSettingsScope;

//@description Notification settings applied to all channel chats when the corresponding chat setting has a default value
notificationSettingsScopeChannelChats = NotificationSettingsScope;


//@description Contains information about notification settings for a chat or a forum topic
//@use_default_mute_for If true, mute_for is ignored and the value for the relevant type of chat or the forum chat is used instead
//@mute_for Time left before notifications will be unmuted, in seconds
//@use_default_sound If true, the value for the relevant type of chat or the forum chat is used instead of sound_id
//@sound_id Identifier of the notification sound to be played; 0 if sound is disabled
//@use_default_show_preview If true, show_preview is ignored and the value for the relevant type of chat or the forum chat is used instead
//@show_preview True, if message content must be displayed in notifications
//@use_default_disable_pinned_message_notifications If true, disable_pinned_message_notifications is ignored and the value for the relevant type of chat or the forum chat is used instead
//@disable_pinned_message_notifications If true, notifications for incoming pinned messages will be created as for an ordinary unread message
//@use_default_disable_mention_notifications If true, disable_mention_notifications is ignored and the value for the relevant type of chat or the forum chat is used instead
//@disable_mention_notifications If true, notifications for messages with mentions will be created as for an ordinary unread message
chatNotificationSettings use_default_mute_for:Bool mute_for:int32 use_default_sound:Bool sound_id:int64 use_default_show_preview:Bool show_preview:Bool use_default_disable_pinned_message_notifications:Bool disable_pinned_message_notifications:Bool use_default_disable_mention_notifications:Bool disable_mention_notifications:Bool = ChatNotificationSettings;

//@description Contains information about notification settings for several chats
//@mute_for Time left before notifications will be unmuted, in seconds
//@sound_id Identifier of the notification sound to be played; 0 if sound is disabled
//@show_preview True, if message content must be displayed in notifications
//@disable_pinned_message_notifications True, if notifications for incoming pinned messages will be created as for an ordinary unread message
//@disable_mention_notifications True, if notifications for messages with mentions will be created as for an ordinary unread message
scopeNotificationSettings mute_for:int32 sound_id:int64 show_preview:Bool disable_pinned_message_notifications:Bool disable_mention_notifications:Bool = ScopeNotificationSettings;


//@description Contains information about a message draft
//@reply_to_message_id Identifier of the replied message; 0 if none
//@date Point in time (Unix timestamp) when the draft was created
//@input_message_text Content of the message draft; must be of the type inputMessageText
draftMessage reply_to_message_id:int53 date:int32 input_message_text:InputMessageContent = DraftMessage;


//@class ChatType @description Describes the type of a chat

//@description An ordinary chat with a user @user_id User identifier
chatTypePrivate user_id:int53 = ChatType;

//@description A basic group (a chat with 0-200 other users) @basic_group_id Basic group identifier
chatTypeBasicGroup basic_group_id:int53 = ChatType;

//@description A supergroup or channel (with unlimited members) @supergroup_id Supergroup or channel identifier @is_channel True, if the supergroup is a channel
chatTypeSupergroup supergroup_id:int53 is_channel:Bool = ChatType;

//@description A secret chat with a user @secret_chat_id Secret chat identifier @user_id User identifier of the secret chat peer
chatTypeSecret secret_chat_id:int32 user_id:int53 = ChatType;


//@description Represents a filter of user chats
//@title The title of the filter; 1-12 characters without line feeds
//@icon_name The chosen icon name for short filter representation. If non-empty, must be one of "All", "Unread", "Unmuted", "Bots", "Channels", "Groups", "Private", "Custom", "Setup", "Cat", "Crown",
//-"Favorite", "Flower", "Game", "Home", "Love", "Mask", "Party", "Sport", "Study", "Trade", "Travel", "Work", "Airplane", "Book", "Light", "Like", "Money", "Note", "Palette".
//-If empty, use getChatFilterDefaultIconName to get default icon name for the filter
//@pinned_chat_ids The chat identifiers of pinned chats in the filtered chat list. There can be up to getOption("chat_filter_chosen_chat_count_max") pinned and always included non-secret chats and the same number of secret chats, but the limit can be increased with Telegram Premium
//@included_chat_ids The chat identifiers of always included chats in the filtered chat list. There can be up to getOption("chat_filter_chosen_chat_count_max") pinned and always included non-secret chats and the same number of secret chats, but the limit can be increased with Telegram Premium
//@excluded_chat_ids The chat identifiers of always excluded chats in the filtered chat list. There can be up to getOption("chat_filter_chosen_chat_count_max") always excluded non-secret chats and the same number of secret chats, but the limit can be increased with Telegram Premium
//@exclude_muted True, if muted chats need to be excluded
//@exclude_read True, if read chats need to be excluded
//@exclude_archived True, if archived chats need to be excluded
//@include_contacts True, if contacts need to be included
//@include_non_contacts True, if non-contact users need to be included
//@include_bots True, if bots need to be included
//@include_groups True, if basic groups and supergroups need to be included
//@include_channels True, if channels need to be included
chatFilter title:string icon_name:string pinned_chat_ids:vector<int53> included_chat_ids:vector<int53> excluded_chat_ids:vector<int53> exclude_muted:Bool exclude_read:Bool exclude_archived:Bool include_contacts:Bool include_non_contacts:Bool include_bots:Bool include_groups:Bool include_channels:Bool = ChatFilter;

//@description Contains basic information about a chat filter
//@id Unique chat filter identifier
//@title The title of the filter; 1-12 characters without line feeds
//@icon_name The chosen or default icon name for short filter representation. One of "All", "Unread", "Unmuted", "Bots", "Channels", "Groups", "Private", "Custom", "Setup", "Cat", "Crown",
//-"Favorite", "Flower", "Game", "Home", "Love", "Mask", "Party", "Sport", "Study", "Trade", "Travel", "Work", "Airplane", "Book", "Light", "Like", "Money", "Note", "Palette"
chatFilterInfo id:int32 title:string icon_name:string = ChatFilterInfo;

//@description Describes a recommended chat filter @filter The chat filter @param_description Chat filter description
recommendedChatFilter filter:chatFilter description:string = RecommendedChatFilter;

//@description Contains a list of recommended chat filters @chat_filters List of recommended chat filters
recommendedChatFilters chat_filters:vector<recommendedChatFilter> = RecommendedChatFilters;


//@class ChatList @description Describes a list of chats

//@description A main list of chats
chatListMain = ChatList;

//@description A list of chats usually located at the top of the main chat list. Unmuted chats are automatically moved from the Archive to the Main chat list when a new message arrives
chatListArchive = ChatList;

//@description A list of chats belonging to a chat filter @chat_filter_id Chat filter identifier
chatListFilter chat_filter_id:int32 = ChatList;

//@description Contains a list of chat lists @chat_lists List of chat lists
chatLists chat_lists:vector<ChatList> = ChatLists;


//@class ChatSource @description Describes a reason why an external chat is shown in a chat list

//@description The chat is sponsored by the user's MTProxy server
chatSourceMtprotoProxy = ChatSource;

//@description The chat contains a public service announcement @type The type of the announcement @text The text of the announcement
chatSourcePublicServiceAnnouncement type:string text:string = ChatSource;


//@description Describes a position of a chat in a chat list
//@list The chat list
//@order A parameter used to determine order of the chat in the chat list. Chats must be sorted by the pair (order, chat.id) in descending order
//@is_pinned True, if the chat is pinned in the chat list
//@source Source of the chat in the chat list; may be null
chatPosition list:ChatList order:int64 is_pinned:Bool source:ChatSource = ChatPosition;


//@class ChatAvailableReactions @description Describes reactions available in the chat

//@description All reactions are available in the chat
chatAvailableReactionsAll = ChatAvailableReactions;

//@description Only specific reactions are available in the chat @reactions The list of reactions
chatAvailableReactionsSome reactions:vector<ReactionType> = ChatAvailableReactions;


//@description Describes a video chat
//@group_call_id Group call identifier of an active video chat; 0 if none. Full information about the video chat can be received through the method getGroupCall
//@has_participants True, if the video chat has participants
//@default_participant_id Default group call participant identifier to join the video chat; may be null
videoChat group_call_id:int32 has_participants:Bool default_participant_id:MessageSender = VideoChat;


//@description A chat. (Can be a private chat, basic group, supergroup, or secret chat)
//@id Chat unique identifier
//@type Type of the chat
//@title Chat title
//@photo Chat photo; may be null
//@permissions Actions that non-administrator chat members are allowed to take in the chat
//@last_message Last message in the chat; may be null
//@positions Positions of the chat in chat lists
//@message_sender_id Identifier of a user or chat that is selected to send messages in the chat; may be null if the user can't change message sender
//@has_protected_content True, if chat content can't be saved locally, forwarded, or copied
//@is_translatable True, if translation of all messages in the chat must be suggested to the user
//@is_marked_as_unread True, if the chat is marked as unread
//@is_blocked True, if the chat is blocked by the current user and private messages from the chat can't be received
//@has_scheduled_messages True, if the chat has scheduled messages
//@can_be_deleted_only_for_self True, if the chat messages can be deleted only for the current user while other users will continue to see the messages
//@can_be_deleted_for_all_users True, if the chat messages can be deleted for all users
//@can_be_reported True, if the chat can be reported to Telegram moderators through reportChat or reportChatPhoto
//@default_disable_notification Default value of the disable_notification parameter, used when a message is sent to the chat
//@unread_count Number of unread messages in the chat
//@last_read_inbox_message_id Identifier of the last read incoming message
//@last_read_outbox_message_id Identifier of the last read outgoing message
//@unread_mention_count Number of unread messages with a mention/reply in the chat
//@unread_reaction_count Number of messages with unread reactions in the chat
//@notification_settings Notification settings for the chat
//@available_reactions Types of reaction, available in the chat
//@message_auto_delete_time Current message auto-delete or self-destruct timer setting for the chat, in seconds; 0 if disabled. Self-destruct timer in secret chats starts after the message or its content is viewed. Auto-delete timer in other chats starts from the send date
//@theme_name If non-empty, name of a theme, set for the chat
//@action_bar Information about actions which must be possible to do through the chat action bar; may be null
//@video_chat Information about video chat of the chat
//@pending_join_requests Information about pending join requests; may be null
//@reply_markup_message_id Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat
//@draft_message A draft of a message in the chat; may be null
//@client_data Application-specific data associated with the chat. (For example, the chat scroll position or local chat notification settings can be stored here.) Persistent if the message database is used
chat id:int53 type:ChatType title:string photo:chatPhotoInfo permissions:chatPermissions last_message:message positions:vector<chatPosition> message_sender_id:MessageSender has_protected_content:Bool is_translatable:Bool is_marked_as_unread:Bool is_blocked:Bool has_scheduled_messages:Bool can_be_deleted_only_for_self:Bool can_be_deleted_for_all_users:Bool can_be_reported:Bool default_disable_notification:Bool unread_count:int32 last_read_inbox_message_id:int53 last_read_outbox_message_id:int53 unread_mention_count:int32 unread_reaction_count:int32 notification_settings:chatNotificationSettings available_reactions:ChatAvailableReactions message_auto_delete_time:int32 theme_name:string action_bar:ChatActionBar video_chat:videoChat pending_join_requests:chatJoinRequestsInfo reply_markup_message_id:int53 draft_message:draftMessage client_data:string = Chat;

//@description Represents a list of chats @total_count Approximate total number of chats found @chat_ids List of chat identifiers
chats total_count:int32 chat_ids:vector<int53> = Chats;


//@description Describes a chat located nearby @chat_id Chat identifier @distance Distance to the chat location, in meters
chatNearby chat_id:int53 distance:int32 = ChatNearby;

//@description Represents a list of chats located nearby @users_nearby List of users nearby @supergroups_nearby List of location-based supergroups nearby
chatsNearby users_nearby:vector<chatNearby> supergroups_nearby:vector<chatNearby> = ChatsNearby;


//@class PublicChatType @description Describes a type of public chats

//@description The chat is public, because it has an active username
publicChatTypeHasUsername = PublicChatType;

//@description The chat is public, because it is a location-based supergroup
publicChatTypeIsLocationBased = PublicChatType;


//@class ChatActionBar @description Describes actions which must be possible to do through a chat action bar

//@description The chat can be reported as spam using the method reportChat with the reason chatReportReasonSpam. If the chat is a private chat with a user with an emoji status, then a notice about emoji status usage must be shown
//@can_unarchive If true, the chat was automatically archived and can be moved back to the main chat list using addChatToList simultaneously with setting chat notification settings to default using setChatNotificationSettings
chatActionBarReportSpam can_unarchive:Bool = ChatActionBar;

//@description The chat is a location-based supergroup, which can be reported as having unrelated location using the method reportChat with the reason chatReportReasonUnrelatedLocation
chatActionBarReportUnrelatedLocation = ChatActionBar;

//@description The chat is a recently created group chat to which new members can be invited
chatActionBarInviteMembers = ChatActionBar;

//@description The chat is a private or secret chat, which can be reported using the method reportChat, or the other user can be blocked using the method toggleMessageSenderIsBlocked,
//-or the other user can be added to the contact list using the method addContact. If the chat is a private chat with a user with an emoji status, then a notice about emoji status usage must be shown
//@can_unarchive If true, the chat was automatically archived and can be moved back to the main chat list using addChatToList simultaneously with setting chat notification settings to default using setChatNotificationSettings
//@distance If non-negative, the current user was found by the peer through searchChatsNearby and this is the distance between the users
chatActionBarReportAddBlock can_unarchive:Bool distance:int32 = ChatActionBar;

//@description The chat is a private or secret chat and the other user can be added to the contact list using the method addContact
chatActionBarAddContact = ChatActionBar;

//@description The chat is a private or secret chat with a mutual contact and the user's phone number can be shared with the other user using the method sharePhoneNumber
chatActionBarSharePhoneNumber = ChatActionBar;

//@description The chat is a private chat with an administrator of a chat to which the user sent join request
//@title Title of the chat to which the join request was sent
//@is_channel True, if the join request was sent to a channel chat
//@request_date Point in time (Unix timestamp) when the join request was sent
chatActionBarJoinRequest title:string is_channel:Bool request_date:int32 = ChatActionBar;


//@class KeyboardButtonType @description Describes a keyboard button type

//@description A simple button, with text that must be sent when the button is pressed
keyboardButtonTypeText = KeyboardButtonType;

//@description A button that sends the user's phone number when pressed; available only in private chats
keyboardButtonTypeRequestPhoneNumber = KeyboardButtonType;

//@description A button that sends the user's location when pressed; available only in private chats
keyboardButtonTypeRequestLocation = KeyboardButtonType;

//@description A button that allows the user to create and send a poll when pressed; available only in private chats @force_regular If true, only regular polls must be allowed to create @force_quiz If true, only polls in quiz mode must be allowed to create
keyboardButtonTypeRequestPoll force_regular:Bool force_quiz:Bool = KeyboardButtonType;

//@description A button that requests a user to be shared by the current user; available only in private chats. Use the method shareUserWithBot to complete the request
//@id Unique button identifier
//@restrict_user_is_bot True, if the shared user must or must not be a bot
//@user_is_bot True, if the shared user must be a bot; otherwise, the shared user must no be a bot. Ignored if restrict_user_is_bot is false
//@restrict_user_is_premium True, if the shared user must or must not be a Telegram Premium user
//@user_is_premium True, if the shared user must be a Telegram Premium user; otherwise, the shared user must no be a Telegram Premium user. Ignored if restrict_user_is_premium is false
keyboardButtonTypeRequestUser id:int32 restrict_user_is_bot:Bool user_is_bot:Bool restrict_user_is_premium:Bool user_is_premium:Bool = KeyboardButtonType;

//@description A button that requests a chat to be shared by the current user; available only in private chats. Use the method shareChatWithBot to complete the request
//@id Unique button identifier
//@chat_is_channel True, if the chat must be a channel; otherwise, a basic group or a supergroup chat is shared
//@restrict_chat_is_forum True, if the chat must or must not be a forum supergroup
//@chat_is_forum True, if the chat must be a forum supergroup; otherwise, the chat must not be a forum supergroup. Ignored if restrict_chat_is_forum is false
//@restrict_chat_has_username True, if the chat must or must not have a username
//@chat_has_username True, if the chat must have a username; otherwise, the chat must not have a username. Ignored if restrict_chat_has_username is false
//@chat_is_created True, if the chat must be created by the current user
//@user_administrator_rights Expected user administrator rights in the chat; may be null if they aren't restricted
//@bot_administrator_rights Expected bot administrator rights in the chat; may be null if they aren't restricted
//@bot_is_member True, if the bot must be a member of the chat; for basic group and supergroup chats only
keyboardButtonTypeRequestChat id:int32 chat_is_channel:Bool restrict_chat_is_forum:Bool chat_is_forum:Bool restrict_chat_has_username:Bool chat_has_username:Bool chat_is_created:Bool user_administrator_rights:chatAdministratorRights bot_administrator_rights:chatAdministratorRights bot_is_member:Bool = KeyboardButtonType;

//@description A button that opens a Web App by calling getWebAppUrl @url An HTTP URL to pass to getWebAppUrl
keyboardButtonTypeWebApp url:string = KeyboardButtonType;


//@description Represents a single button in a bot keyboard @text Text of the button @type Type of the button
keyboardButton text:string type:KeyboardButtonType = KeyboardButton;


//@class InlineKeyboardButtonType @description Describes the type of an inline keyboard button

//@description A button that opens a specified URL @url HTTP or tg:// URL to open
inlineKeyboardButtonTypeUrl url:string = InlineKeyboardButtonType;

//@description A button that opens a specified URL and automatically authorize the current user by calling getLoginUrlInfo @url An HTTP URL to pass to getLoginUrlInfo @id Unique button identifier @forward_text If non-empty, new text of the button in forwarded messages
inlineKeyboardButtonTypeLoginUrl url:string id:int53 forward_text:string = InlineKeyboardButtonType;

//@description A button that opens a Web App by calling openWebApp @url An HTTP URL to pass to openWebApp
inlineKeyboardButtonTypeWebApp url:string = InlineKeyboardButtonType;

//@description A button that sends a callback query to a bot @data Data to be sent to the bot via a callback query
inlineKeyboardButtonTypeCallback data:bytes = InlineKeyboardButtonType;

//@description A button that asks for the 2-step verification password of the current user and then sends a callback query to a bot @data Data to be sent to the bot via a callback query
inlineKeyboardButtonTypeCallbackWithPassword data:bytes = InlineKeyboardButtonType;

//@description A button with a game that sends a callback query to a bot. This button must be in the first column and row of the keyboard and can be attached only to a message with content of the type messageGame
inlineKeyboardButtonTypeCallbackGame = InlineKeyboardButtonType;

//@description A button that forces an inline query to the bot to be inserted in the input field @query Inline query to be sent to the bot @in_current_chat True, if the inline query must be sent from the current chat
inlineKeyboardButtonTypeSwitchInline query:string in_current_chat:Bool = InlineKeyboardButtonType;

//@description A button to buy something. This button must be in the first column and row of the keyboard and can be attached only to a message with content of the type messageInvoice
inlineKeyboardButtonTypeBuy = InlineKeyboardButtonType;

//@description A button with a user reference to be handled in the same way as textEntityTypeMentionName entities @user_id User identifier
inlineKeyboardButtonTypeUser user_id:int53 = InlineKeyboardButtonType;


//@description Represents a single button in an inline keyboard @text Text of the button @type Type of the button
inlineKeyboardButton text:string type:InlineKeyboardButtonType = InlineKeyboardButton;


//@class ReplyMarkup @description Contains a description of a custom keyboard and actions that can be done with it to quickly reply to bots

//@description Instructs application to remove the keyboard once this message has been received. This kind of keyboard can't be received in an incoming message; instead, updateChatReplyMarkup with message_id == 0 will be sent
//@is_personal True, if the keyboard is removed only for the mentioned users or the target user of a reply
replyMarkupRemoveKeyboard is_personal:Bool = ReplyMarkup;

//@description Instructs application to force a reply to this message
//@is_personal True, if a forced reply must automatically be shown to the current user. For outgoing messages, specify true to show the forced reply only for the mentioned users and for the target user of a reply
//@input_field_placeholder If non-empty, the placeholder to be shown in the input field when the reply is active; 0-64 characters
replyMarkupForceReply is_personal:Bool input_field_placeholder:string = ReplyMarkup;

//@description Contains a custom keyboard layout to quickly reply to bots
//@rows A list of rows of bot keyboard buttons
//@is_persistent True, if the keyboard is supposed to always be shown when the ordinary keyboard is hidden
//@resize_keyboard True, if the application needs to resize the keyboard vertically
//@one_time True, if the application needs to hide the keyboard after use
//@is_personal True, if the keyboard must automatically be shown to the current user. For outgoing messages, specify true to show the keyboard only for the mentioned users and for the target user of a reply
//@input_field_placeholder If non-empty, the placeholder to be shown in the input field when the keyboard is active; 0-64 characters
replyMarkupShowKeyboard rows:vector<vector<keyboardButton>> is_persistent:Bool resize_keyboard:Bool one_time:Bool is_personal:Bool input_field_placeholder:string = ReplyMarkup;

//@description Contains an inline keyboard layout
//@rows A list of rows of inline keyboard buttons
replyMarkupInlineKeyboard rows:vector<vector<inlineKeyboardButton>> = ReplyMarkup;


//@class LoginUrlInfo @description Contains information about an inline button of type inlineKeyboardButtonTypeLoginUrl

//@description An HTTP URL needs to be open @url The URL to open @skip_confirmation True, if there is no need to show an ordinary open URL confirmation
loginUrlInfoOpen url:string skip_confirmation:Bool = LoginUrlInfo;

//@description An authorization confirmation dialog needs to be shown to the user
//@url An HTTP URL to be opened
//@domain A domain of the URL
//@bot_user_id User identifier of a bot linked with the website
//@request_write_access True, if the user must be asked for the permission to the bot to send them messages
loginUrlInfoRequestConfirmation url:string domain:string bot_user_id:int53 request_write_access:Bool = LoginUrlInfo;


//@description Contains information about a Web App found by its short name
//@web_app The Web App
//@request_write_access True, if the user must be asked for the permission to the bot to send them messages
//@skip_confirmation True, if there is no need to show an ordinary open URL confirmation before opening the Web App. The field must be ignored and confirmation must be shown anyway if the Web App link was hidden
foundWebApp web_app:webApp request_write_access:Bool skip_confirmation:Bool = FoundWebApp;

//@description Contains information about a Web App @launch_id Unique identifier for the Web App launch @url A Web App URL to open in a web view
webAppInfo launch_id:int64 url:string = WebAppInfo;


//@description Contains information about a message thread
//@chat_id Identifier of the chat to which the message thread belongs
//@message_thread_id Message thread identifier, unique within the chat
//@reply_info Information about the message thread; may be null for forum topic threads
//@unread_message_count Approximate number of unread messages in the message thread
//@messages The messages from which the thread starts. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id)
//@draft_message A draft of a message in the message thread; may be null
messageThreadInfo chat_id:int53 message_thread_id:int53 reply_info:messageReplyInfo unread_message_count:int32 messages:vector<message> draft_message:draftMessage = MessageThreadInfo;


//@description Describes a forum topic icon @color Color of the topic icon in RGB format @custom_emoji_id Unique identifier of the custom emoji shown on the topic icon; 0 if none
forumTopicIcon color:int32 custom_emoji_id:int64 = ForumTopicIcon;

//@description Contains basic information about a forum topic
//@message_thread_id Message thread identifier of the topic
//@name Name of the topic
//@icon Icon of the topic
//@creation_date Date the topic was created
//@creator_id Identifier of the creator of the topic
//@is_general True, if the topic is the General topic list
//@is_outgoing True, if the topic was created by the current user
//@is_closed True, if the topic is closed
//@is_hidden True, if the topic is hidden above the topic list and closed; for General topic only
forumTopicInfo message_thread_id:int53 name:string icon:forumTopicIcon creation_date:int32 creator_id:MessageSender is_general:Bool is_outgoing:Bool is_closed:Bool is_hidden:Bool = ForumTopicInfo;

//@description Describes a forum topic
//@info Basic information about the topic
//@last_message Last message in the topic; may be null if unknown
//@is_pinned True, if the topic is pinned in the topic list
//@unread_count Number of unread messages in the topic
//@last_read_inbox_message_id Identifier of the last read incoming message
//@last_read_outbox_message_id Identifier of the last read outgoing message
//@unread_mention_count Number of unread messages with a mention/reply in the topic
//@unread_reaction_count Number of messages with unread reactions in the topic
//@notification_settings Notification settings for the topic
//@draft_message A draft of a message in the topic; may be null
forumTopic info:forumTopicInfo last_message:message is_pinned:Bool unread_count:int32 last_read_inbox_message_id:int53 last_read_outbox_message_id:int53 unread_mention_count:int32 unread_reaction_count:int32 notification_settings:chatNotificationSettings draft_message:draftMessage = ForumTopic;

//@description Describes a list of forum topics
//@total_count Approximate total number of forum topics found
//@topics List of forum topics
//@next_offset_date Offset date for the next getForumTopics request
//@next_offset_message_id Offset message identifier for the next getForumTopics request
//@next_offset_message_thread_id Offset message thread identifier for the next getForumTopics request
forumTopics total_count:int32 topics:vector<forumTopic> next_offset_date:int32 next_offset_message_id:int53 next_offset_message_thread_id:int53 = ForumTopics;


//@class RichText @description Describes a text object inside an instant-view web page

//@description A plain text @text Text
richTextPlain text:string = RichText;

//@description A bold rich text @text Text
richTextBold text:RichText = RichText;

//@description An italicized rich text @text Text
richTextItalic text:RichText = RichText;

//@description An underlined rich text @text Text
richTextUnderline text:RichText = RichText;

//@description A strikethrough rich text @text Text
richTextStrikethrough text:RichText = RichText;

//@description A fixed-width rich text @text Text
richTextFixed text:RichText = RichText;

//@description A rich text URL link @text Text @url URL @is_cached True, if the URL has cached instant view server-side
richTextUrl text:RichText url:string is_cached:Bool = RichText;

//@description A rich text email link @text Text @email_address Email address
richTextEmailAddress text:RichText email_address:string = RichText;

//@description A subscript rich text @text Text
richTextSubscript text:RichText = RichText;

//@description A superscript rich text @text Text
richTextSuperscript text:RichText = RichText;

//@description A marked rich text @text Text
richTextMarked text:RichText = RichText;

//@description A rich text phone number @text Text @phone_number Phone number
richTextPhoneNumber text:RichText phone_number:string = RichText;

//@description A small image inside the text
//@document The image represented as a document. The image can be in GIF, JPEG or PNG format
//@width Width of a bounding box in which the image must be shown; 0 if unknown
//@height Height of a bounding box in which the image must be shown; 0 if unknown
richTextIcon document:document width:int32 height:int32 = RichText;

//@description A reference to a richTexts object on the same web page @text The text @anchor_name The name of a richTextAnchor object, which is the first element of the target richTexts object @url An HTTP URL, opening the reference
richTextReference text:RichText anchor_name:string url:string = RichText;

//@description An anchor @name Anchor name
richTextAnchor name:string = RichText;

//@description A link to an anchor on the same web page @text The link text @anchor_name The anchor name. If the name is empty, the link must bring back to top @url An HTTP URL, opening the anchor
richTextAnchorLink text:RichText anchor_name:string url:string = RichText;

//@description A concatenation of rich texts @texts Texts
richTexts texts:vector<RichText> = RichText;


//@description Contains a caption of an instant view web page block, consisting of a text and a trailing credit @text Content of the caption @credit Block credit (like HTML tag <cite>)
pageBlockCaption text:RichText credit:RichText = PageBlockCaption;

//@description Describes an item of a list page block @label Item label @page_blocks Item blocks
pageBlockListItem label:string page_blocks:vector<PageBlock> = PageBlockListItem;

//@class PageBlockHorizontalAlignment @description Describes a horizontal alignment of a table cell content

//@description The content must be left-aligned
pageBlockHorizontalAlignmentLeft = PageBlockHorizontalAlignment;

//@description The content must be center-aligned
pageBlockHorizontalAlignmentCenter = PageBlockHorizontalAlignment;

//@description The content must be right-aligned
pageBlockHorizontalAlignmentRight = PageBlockHorizontalAlignment;

//@class PageBlockVerticalAlignment @description Describes a Vertical alignment of a table cell content

//@description The content must be top-aligned
pageBlockVerticalAlignmentTop = PageBlockVerticalAlignment;

//@description The content must be middle-aligned
pageBlockVerticalAlignmentMiddle = PageBlockVerticalAlignment;

//@description The content must be bottom-aligned
pageBlockVerticalAlignmentBottom = PageBlockVerticalAlignment;

//@description Represents a cell of a table
//@text Cell text; may be null. If the text is null, then the cell must be invisible
//@is_header True, if it is a header cell
//@colspan The number of columns the cell spans
//@rowspan The number of rows the cell spans
//@align Horizontal cell content alignment
//@valign Vertical cell content alignment
pageBlockTableCell text:RichText is_header:Bool colspan:int32 rowspan:int32 align:PageBlockHorizontalAlignment valign:PageBlockVerticalAlignment = PageBlockTableCell;

//@description Contains information about a related article
//@url Related article URL
//@title Article title; may be empty
//@param_description Article description; may be empty
//@photo Article photo; may be null
//@author Article author; may be empty
//@publish_date Point in time (Unix timestamp) when the article was published; 0 if unknown
pageBlockRelatedArticle url:string title:string description:string photo:photo author:string publish_date:int32 = PageBlockRelatedArticle;


//@class PageBlock @description Describes a block of an instant view web page

//@description The title of a page @title Title
pageBlockTitle title:RichText = PageBlock;

//@description The subtitle of a page @subtitle Subtitle
pageBlockSubtitle subtitle:RichText = PageBlock;

//@description The author and publishing date of a page @author Author @publish_date Point in time (Unix timestamp) when the article was published; 0 if unknown
pageBlockAuthorDate author:RichText publish_date:int32 = PageBlock;

//@description A header @header Header
pageBlockHeader header:RichText = PageBlock;

//@description A subheader @subheader Subheader
pageBlockSubheader subheader:RichText = PageBlock;

//@description A kicker @kicker Kicker
pageBlockKicker kicker:RichText = PageBlock;

//@description A text paragraph @text Paragraph text
pageBlockParagraph text:RichText = PageBlock;

//@description A preformatted text paragraph @text Paragraph text @language Programming language for which the text needs to be formatted
pageBlockPreformatted text:RichText language:string = PageBlock;

//@description The footer of a page @footer Footer
pageBlockFooter footer:RichText = PageBlock;

//@description An empty block separating a page
pageBlockDivider = PageBlock;

//@description An invisible anchor on a page, which can be used in a URL to open the page from the specified anchor @name Name of the anchor
pageBlockAnchor name:string = PageBlock;

//@description A list of data blocks @items The items of the list
pageBlockList items:vector<pageBlockListItem> = PageBlock;

//@description A block quote
//@text Quote text
//@credit Quote credit
pageBlockBlockQuote text:RichText credit:RichText = PageBlock;

//@description A pull quote
//@text Quote text
//@credit Quote credit
pageBlockPullQuote text:RichText credit:RichText = PageBlock;

//@description An animation
//@animation Animation file; may be null
//@caption Animation caption
//@need_autoplay True, if the animation must be played automatically
pageBlockAnimation animation:animation caption:pageBlockCaption need_autoplay:Bool = PageBlock;

//@description An audio file
//@audio Audio file; may be null
//@caption Audio file caption
pageBlockAudio audio:audio caption:pageBlockCaption = PageBlock;

//@description A photo
//@photo Photo file; may be null
//@caption Photo caption
//@url URL that needs to be opened when the photo is clicked
pageBlockPhoto photo:photo caption:pageBlockCaption url:string = PageBlock;

//@description A video
//@video Video file; may be null
//@caption Video caption
//@need_autoplay True, if the video must be played automatically
//@is_looped True, if the video must be looped
pageBlockVideo video:video caption:pageBlockCaption need_autoplay:Bool is_looped:Bool = PageBlock;

//@description A voice note
//@voice_note Voice note; may be null
//@caption Voice note caption
pageBlockVoiceNote voice_note:voiceNote caption:pageBlockCaption = PageBlock;

//@description A page cover
//@cover Cover
pageBlockCover cover:PageBlock = PageBlock;

//@description An embedded web page
//@url Web page URL, if available
//@html HTML-markup of the embedded page
//@poster_photo Poster photo, if available; may be null
//@width Block width; 0 if unknown
//@height Block height; 0 if unknown
//@caption Block caption
//@is_full_width True, if the block must be full width
//@allow_scrolling True, if scrolling needs to be allowed
pageBlockEmbedded url:string html:string poster_photo:photo width:int32 height:int32 caption:pageBlockCaption is_full_width:Bool allow_scrolling:Bool = PageBlock;

//@description An embedded post
//@url Web page URL
//@author Post author
//@author_photo Post author photo; may be null
//@date Point in time (Unix timestamp) when the post was created; 0 if unknown
//@page_blocks Post content
//@caption Post caption
pageBlockEmbeddedPost url:string author:string author_photo:photo date:int32 page_blocks:vector<PageBlock> caption:pageBlockCaption = PageBlock;

//@description A collage
//@page_blocks Collage item contents
//@caption Block caption
pageBlockCollage page_blocks:vector<PageBlock> caption:pageBlockCaption = PageBlock;

//@description A slideshow
//@page_blocks Slideshow item contents
//@caption Block caption
pageBlockSlideshow page_blocks:vector<PageBlock> caption:pageBlockCaption = PageBlock;

//@description A link to a chat
//@title Chat title
//@photo Chat photo; may be null
//@username Chat username by which all other information about the chat can be resolved
pageBlockChatLink title:string photo:chatPhotoInfo username:string = PageBlock;

//@description A table
//@caption Table caption
//@cells Table cells
//@is_bordered True, if the table is bordered
//@is_striped True, if the table is striped
pageBlockTable caption:RichText cells:vector<vector<pageBlockTableCell>> is_bordered:Bool is_striped:Bool = PageBlock;

//@description A collapsible block
//@header Always visible heading for the block
//@page_blocks Block contents
//@is_open True, if the block is open by default
pageBlockDetails header:RichText page_blocks:vector<PageBlock> is_open:Bool = PageBlock;

//@description Related articles
//@header Block header
//@articles List of related articles
pageBlockRelatedArticles header:RichText articles:vector<pageBlockRelatedArticle> = PageBlock;

//@description A map
//@location Location of the map center
//@zoom Map zoom level
//@width Map width
//@height Map height
//@caption Block caption
pageBlockMap location:location zoom:int32 width:int32 height:int32 caption:pageBlockCaption = PageBlock;


//@description Describes an instant view page for a web page
//@page_blocks Content of the web page
//@view_count Number of the instant view views; 0 if unknown
//@version Version of the instant view; currently, can be 1 or 2
//@is_rtl True, if the instant view must be shown from right to left
//@is_full True, if the instant view contains the full page. A network request might be needed to get the full web page instant view
//@feedback_link An internal link to be opened to leave feedback about the instant view
webPageInstantView page_blocks:vector<PageBlock> view_count:int32 version:int32 is_rtl:Bool is_full:Bool feedback_link:InternalLinkType = WebPageInstantView;


//@description Describes a web page preview
//@url Original URL of the link
//@display_url URL to display
//@type Type of the web page. Can be: article, photo, audio, video, document, profile, app, or something else
//@site_name Short name of the site (e.g., Google Docs, App Store)
//@title Title of the content
//@param_description Description of the content
//@photo Image representing the content; may be null
//@embed_url URL to show in the embedded preview
//@embed_type MIME type of the embedded preview, (e.g., text/html or video/mp4)
//@embed_width Width of the embedded preview
//@embed_height Height of the embedded preview
//@duration Duration of the content, in seconds
//@author Author of the content
//@animation Preview of the content as an animation, if available; may be null
//@audio Preview of the content as an audio file, if available; may be null
//@document Preview of the content as a document, if available; may be null
//@sticker Preview of the content as a sticker for small WEBP files, if available; may be null
//@video Preview of the content as a video, if available; may be null
//@video_note Preview of the content as a video note, if available; may be null
//@voice_note Preview of the content as a voice note, if available; may be null
//@instant_view_version Version of web page instant view (currently, can be 1 or 2); 0 if none
webPage url:string display_url:string type:string site_name:string title:string description:formattedText photo:photo embed_url:string embed_type:string embed_width:int32 embed_height:int32 duration:int32 author:string animation:animation audio:audio document:document sticker:sticker video:video video_note:videoNote voice_note:voiceNote instant_view_version:int32 = WebPage;


//@description Contains information about a country
//@country_code A two-letter ISO 3166-1 alpha-2 country code
//@name Native name of the country
//@english_name English name of the country
//@is_hidden True, if the country must be hidden from the list of all countries
//@calling_codes List of country calling codes
countryInfo country_code:string name:string english_name:string is_hidden:Bool calling_codes:vector<string> = CountryInfo;

//@description Contains information about countries @countries The list of countries
countries countries:vector<countryInfo> = Countries;

//@description Contains information about a phone number
//@country Information about the country to which the phone number belongs; may be null
//@country_calling_code The part of the phone number denoting country calling code or its part
//@formatted_phone_number The phone number without country calling code formatted accordingly to local rules. Expected digits are returned as '-', but even more digits might be entered by the user
//@is_anonymous True, if the phone number was bought on Fragment and isn't tied to a SIM card
phoneNumberInfo country:countryInfo country_calling_code:string formatted_phone_number:string is_anonymous:Bool = PhoneNumberInfo;


//@description Describes an action associated with a bank card number @text Action text @url The URL to be opened
bankCardActionOpenUrl text:string url:string = BankCardActionOpenUrl;

//@description Information about a bank card @title Title of the bank card description @actions Actions that can be done with the bank card number
bankCardInfo title:string actions:vector<bankCardActionOpenUrl> = BankCardInfo;


//@description Describes an address
//@country_code A two-letter ISO 3166-1 alpha-2 country code
//@state State, if applicable
//@city City
//@street_line1 First line of the address
//@street_line2 Second line of the address
//@postal_code Address postal code
address country_code:string state:string city:string street_line1:string street_line2:string postal_code:string = Address;


//@description Contains parameters of the application theme
//@background_color A color of the background in the RGB24 format
//@secondary_background_color A secondary color for the background in the RGB24 format
//@text_color A color of text in the RGB24 format
//@hint_color A color of hints in the RGB24 format
//@link_color A color of links in the RGB24 format
//@button_color A color of the buttons in the RGB24 format
//@button_text_color A color of text on the buttons in the RGB24 format
themeParameters background_color:int32 secondary_background_color:int32 text_color:int32 hint_color:int32 link_color:int32 button_color:int32 button_text_color:int32 = ThemeParameters;


//@description Portion of the price of a product (e.g., "delivery cost", "tax amount") @label Label for this portion of the product price @amount Currency amount in the smallest units of the currency
labeledPricePart label:string amount:int53 = LabeledPricePart;

//@description Product invoice
//@currency ISO 4217 currency code
//@price_parts A list of objects used to calculate the total price of the product
//@max_tip_amount The maximum allowed amount of tip in the smallest units of the currency
//@suggested_tip_amounts Suggested amounts of tip in the smallest units of the currency
//@recurring_payment_terms_of_service_url An HTTP URL with terms of service for recurring payments. If non-empty, the invoice payment will result in recurring payments and the user must accept the terms of service before allowed to pay
//@is_test True, if the payment is a test payment
//@need_name True, if the user's name is needed for payment
//@need_phone_number True, if the user's phone number is needed for payment
//@need_email_address True, if the user's email address is needed for payment
//@need_shipping_address True, if the user's shipping address is needed for payment
//@send_phone_number_to_provider True, if the user's phone number will be sent to the provider
//@send_email_address_to_provider True, if the user's email address will be sent to the provider
//@is_flexible True, if the total price depends on the shipping method
invoice currency:string price_parts:vector<labeledPricePart> max_tip_amount:int53 suggested_tip_amounts:vector<int53> recurring_payment_terms_of_service_url:string is_test:Bool need_name:Bool need_phone_number:Bool need_email_address:Bool need_shipping_address:Bool send_phone_number_to_provider:Bool send_email_address_to_provider:Bool is_flexible:Bool = Invoice;

//@description Order information
//@name Name of the user
//@phone_number Phone number of the user
//@email_address Email address of the user
//@shipping_address Shipping address for this order; may be null
orderInfo name:string phone_number:string email_address:string shipping_address:address = OrderInfo;

//@description One shipping option
//@id Shipping option identifier
//@title Option title
//@price_parts A list of objects used to calculate the total shipping costs
shippingOption id:string title:string price_parts:vector<labeledPricePart> = ShippingOption;

//@description Contains information about saved payment credentials @id Unique identifier of the saved credentials @title Title of the saved credentials
savedCredentials id:string title:string = SavedCredentials;


//@class InputCredentials @description Contains information about the payment method chosen by the user

//@description Applies if a user chooses some previously saved payment credentials. To use their previously saved credentials, the user must have a valid temporary password @saved_credentials_id Identifier of the saved credentials
inputCredentialsSaved saved_credentials_id:string = InputCredentials;

//@description Applies if a user enters new credentials on a payment provider website @data JSON-encoded data with the credential identifier from the payment provider @allow_save True, if the credential identifier can be saved on the server side
inputCredentialsNew data:string allow_save:Bool = InputCredentials;

//@description Applies if a user enters new credentials using Apple Pay @data JSON-encoded data with the credential identifier
inputCredentialsApplePay data:string = InputCredentials;

//@description Applies if a user enters new credentials using Google Pay @data JSON-encoded data with the credential identifier
inputCredentialsGooglePay data:string = InputCredentials;


//@class PaymentProvider @description Contains information about a payment provider

//@description Smart Glocal payment provider @public_token Public payment token
paymentProviderSmartGlocal public_token:string = PaymentProvider;

//@description Stripe payment provider
//@publishable_key Stripe API publishable key
//@need_country True, if the user country must be provided
//@need_postal_code True, if the user ZIP/postal code must be provided
//@need_cardholder_name True, if the cardholder name must be provided
paymentProviderStripe publishable_key:string need_country:Bool need_postal_code:Bool need_cardholder_name:Bool = PaymentProvider;

//@description Some other payment provider, for which a web payment form must be shown @url Payment form URL
paymentProviderOther url:string = PaymentProvider;


//@description Describes an additional payment option @title Title for the payment option @url Payment form URL to be opened in a web view
paymentOption title:string url:string = PaymentOption;


//@description Contains information about an invoice payment form
//@id The payment form identifier
//@invoice Full information about the invoice
//@seller_bot_user_id User identifier of the seller bot
//@payment_provider_user_id User identifier of the payment provider bot
//@payment_provider Information about the payment provider
//@additional_payment_options The list of additional payment options
//@saved_order_info Saved server-side order information; may be null
//@saved_credentials The list of saved payment credentials
//@can_save_credentials True, if the user can choose to save credentials
//@need_password True, if the user will be able to save credentials, if sets up a 2-step verification password
//@product_title Product title
//@product_description Product description
//@product_photo Product photo; may be null
paymentForm id:int64 invoice:invoice seller_bot_user_id:int53 payment_provider_user_id:int53 payment_provider:PaymentProvider additional_payment_options:vector<paymentOption> saved_order_info:orderInfo saved_credentials:vector<savedCredentials> can_save_credentials:Bool need_password:Bool product_title:string product_description:formattedText product_photo:photo = PaymentForm;

//@description Contains a temporary identifier of validated order information, which is stored for one hour, and the available shipping options @order_info_id Temporary identifier of the order information @shipping_options Available shipping options
validatedOrderInfo order_info_id:string shipping_options:vector<shippingOption> = ValidatedOrderInfo;

//@description Contains the result of a payment request @success True, if the payment request was successful; otherwise, the verification_url will be non-empty @verification_url URL for additional payment credentials verification
paymentResult success:Bool verification_url:string = PaymentResult;

//@description Contains information about a successful payment
//@title Product title
//@param_description Product description
//@photo Product photo; may be null
//@date Point in time (Unix timestamp) when the payment was made
//@seller_bot_user_id User identifier of the seller bot
//@payment_provider_user_id User identifier of the payment provider bot
//@invoice Information about the invoice
//@order_info Order information; may be null
//@shipping_option Chosen shipping option; may be null
//@credentials_title Title of the saved credentials chosen by the buyer
//@tip_amount The amount of tip chosen by the buyer in the smallest units of the currency
paymentReceipt title:string description:formattedText photo:photo date:int32 seller_bot_user_id:int53 payment_provider_user_id:int53 invoice:invoice order_info:orderInfo shipping_option:shippingOption credentials_title:string tip_amount:int53 = PaymentReceipt;


//@class InputInvoice @description Describes an invoice to process

//@description An invoice from a message of the type messageInvoice @chat_id Chat identifier of the message @message_id Message identifier
inputInvoiceMessage chat_id:int53 message_id:int53 = InputInvoice;

//@description An invoice from a link of the type internalLinkTypeInvoice @name Name of the invoice
inputInvoiceName name:string = InputInvoice;


//@class MessageExtendedMedia @description Describes a media, which is attached to an invoice

//@description The media is hidden until the invoice is paid
//@width Media width; 0 if unknown
//@height Media height; 0 if unknown
//@duration Media duration; 0 if unknown
//@minithumbnail Media minithumbnail; may be null
//@caption Media caption
messageExtendedMediaPreview width:int32 height:int32 duration:int32 minithumbnail:minithumbnail caption:formattedText = MessageExtendedMedia;

//@description The media is a photo @photo The photo @caption Photo caption
messageExtendedMediaPhoto photo:photo caption:formattedText = MessageExtendedMedia;

//@description The media is a video @video The video @caption Photo caption
messageExtendedMediaVideo video:video caption:formattedText = MessageExtendedMedia;

//@description The media is unsupported @caption Media caption
messageExtendedMediaUnsupported caption:formattedText = MessageExtendedMedia;



//@description File with the date it was uploaded @file The file @date Point in time (Unix timestamp) when the file was uploaded
datedFile file:file date:int32 = DatedFile;


//@class PassportElementType @description Contains the type of a Telegram Passport element

//@description A Telegram Passport element containing the user's personal details
passportElementTypePersonalDetails = PassportElementType;

//@description A Telegram Passport element containing the user's passport
passportElementTypePassport = PassportElementType;

//@description A Telegram Passport element containing the user's driver license
passportElementTypeDriverLicense = PassportElementType;

//@description A Telegram Passport element containing the user's identity card
passportElementTypeIdentityCard = PassportElementType;

//@description A Telegram Passport element containing the user's internal passport
passportElementTypeInternalPassport = PassportElementType;

//@description A Telegram Passport element containing the user's address
passportElementTypeAddress = PassportElementType;

//@description A Telegram Passport element containing the user's utility bill
passportElementTypeUtilityBill = PassportElementType;

//@description A Telegram Passport element containing the user's bank statement
passportElementTypeBankStatement = PassportElementType;

//@description A Telegram Passport element containing the user's rental agreement
passportElementTypeRentalAgreement = PassportElementType;

//@description A Telegram Passport element containing the registration page of the user's passport
passportElementTypePassportRegistration = PassportElementType;

//@description A Telegram Passport element containing the user's temporary registration
passportElementTypeTemporaryRegistration = PassportElementType;

//@description A Telegram Passport element containing the user's phone number
passportElementTypePhoneNumber = PassportElementType;

//@description A Telegram Passport element containing the user's email address
passportElementTypeEmailAddress = PassportElementType;


//@description Represents a date according to the Gregorian calendar @day Day of the month; 1-31 @month Month; 1-12 @year Year; 1-9999
date day:int32 month:int32 year:int32 = Date;

//@description Contains the user's personal details
//@first_name First name of the user written in English; 1-255 characters
//@middle_name Middle name of the user written in English; 0-255 characters
//@last_name Last name of the user written in English; 1-255 characters
//@native_first_name Native first name of the user; 1-255 characters
//@native_middle_name Native middle name of the user; 0-255 characters
//@native_last_name Native last name of the user; 1-255 characters
//@birthdate Birthdate of the user
//@gender Gender of the user, "male" or "female"
//@country_code A two-letter ISO 3166-1 alpha-2 country code of the user's country
//@residence_country_code A two-letter ISO 3166-1 alpha-2 country code of the user's residence country
personalDetails first_name:string middle_name:string last_name:string native_first_name:string native_middle_name:string native_last_name:string birthdate:date gender:string country_code:string residence_country_code:string = PersonalDetails;

//@description An identity document
//@number Document number; 1-24 characters
//@expiry_date Document expiry date; may be null if not applicable
//@front_side Front side of the document
//@reverse_side Reverse side of the document; only for driver license and identity card; may be null
//@selfie Selfie with the document; may be null
//@translation List of files containing a certified English translation of the document
identityDocument number:string expiry_date:date front_side:datedFile reverse_side:datedFile selfie:datedFile translation:vector<datedFile> = IdentityDocument;

//@description An identity document to be saved to Telegram Passport
//@number Document number; 1-24 characters
//@expiry_date Document expiry date; pass null if not applicable
//@front_side Front side of the document
//@reverse_side Reverse side of the document; only for driver license and identity card; pass null otherwise
//@selfie Selfie with the document; pass null if unavailable
//@translation List of files containing a certified English translation of the document
inputIdentityDocument number:string expiry_date:date front_side:InputFile reverse_side:InputFile selfie:InputFile translation:vector<InputFile> = InputIdentityDocument;

//@description A personal document, containing some information about a user @files List of files containing the pages of the document @translation List of files containing a certified English translation of the document
personalDocument files:vector<datedFile> translation:vector<datedFile> = PersonalDocument;

//@description A personal document to be saved to Telegram Passport @files List of files containing the pages of the document @translation List of files containing a certified English translation of the document
inputPersonalDocument files:vector<InputFile> translation:vector<InputFile> = InputPersonalDocument;


//@class PassportElement @description Contains information about a Telegram Passport element

//@description A Telegram Passport element containing the user's personal details @personal_details Personal details of the user
passportElementPersonalDetails personal_details:personalDetails = PassportElement;

//@description A Telegram Passport element containing the user's passport @passport Passport
passportElementPassport passport:identityDocument = PassportElement;

//@description A Telegram Passport element containing the user's driver license @driver_license Driver license
passportElementDriverLicense driver_license:identityDocument = PassportElement;

//@description A Telegram Passport element containing the user's identity card @identity_card Identity card
passportElementIdentityCard identity_card:identityDocument = PassportElement;

//@description A Telegram Passport element containing the user's internal passport @internal_passport Internal passport
passportElementInternalPassport internal_passport:identityDocument = PassportElement;

//@description A Telegram Passport element containing the user's address @address Address
passportElementAddress address:address = PassportElement;

//@description A Telegram Passport element containing the user's utility bill @utility_bill Utility bill
passportElementUtilityBill utility_bill:personalDocument = PassportElement;

//@description A Telegram Passport element containing the user's bank statement @bank_statement Bank statement
passportElementBankStatement bank_statement:personalDocument = PassportElement;

//@description A Telegram Passport element containing the user's rental agreement @rental_agreement Rental agreement
passportElementRentalAgreement rental_agreement:personalDocument = PassportElement;

//@description A Telegram Passport element containing the user's passport registration pages @passport_registration Passport registration pages
passportElementPassportRegistration passport_registration:personalDocument = PassportElement;

//@description A Telegram Passport element containing the user's temporary registration @temporary_registration Temporary registration
passportElementTemporaryRegistration temporary_registration:personalDocument = PassportElement;

//@description A Telegram Passport element containing the user's phone number @phone_number Phone number
passportElementPhoneNumber phone_number:string = PassportElement;

//@description A Telegram Passport element containing the user's email address @email_address Email address
passportElementEmailAddress email_address:string = PassportElement;


//@class InputPassportElement @description Contains information about a Telegram Passport element to be saved

//@description A Telegram Passport element to be saved containing the user's personal details @personal_details Personal details of the user
inputPassportElementPersonalDetails personal_details:personalDetails = InputPassportElement;

//@description A Telegram Passport element to be saved containing the user's passport @passport The passport to be saved
inputPassportElementPassport passport:inputIdentityDocument = InputPassportElement;

//@description A Telegram Passport element to be saved containing the user's driver license @driver_license The driver license to be saved
inputPassportElementDriverLicense driver_license:inputIdentityDocument = InputPassportElement;

//@description A Telegram Passport element to be saved containing the user's identity card @identity_card The identity card to be saved
inputPassportElementIdentityCard identity_card:inputIdentityDocument = InputPassportElement;

//@description A Telegram Passport element to be saved containing the user's internal passport @internal_passport The internal passport to be saved
inputPassportElementInternalPassport internal_passport:inputIdentityDocument = InputPassportElement;

//@description A Telegram Passport element to be saved containing the user's address @address The address to be saved
inputPassportElementAddress address:address = InputPassportElement;

//@description A Telegram Passport element to be saved containing the user's utility bill @utility_bill The utility bill to be saved
inputPassportElementUtilityBill utility_bill:inputPersonalDocument = InputPassportElement;

//@description A Telegram Passport element to be saved containing the user's bank statement @bank_statement The bank statement to be saved
inputPassportElementBankStatement bank_statement:inputPersonalDocument = InputPassportElement;

//@description A Telegram Passport element to be saved containing the user's rental agreement @rental_agreement The rental agreement to be saved
inputPassportElementRentalAgreement rental_agreement:inputPersonalDocument = InputPassportElement;

//@description A Telegram Passport element to be saved containing the user's passport registration @passport_registration The passport registration page to be saved
inputPassportElementPassportRegistration passport_registration:inputPersonalDocument = InputPassportElement;

//@description A Telegram Passport element to be saved containing the user's temporary registration @temporary_registration The temporary registration document to be saved
inputPassportElementTemporaryRegistration temporary_registration:inputPersonalDocument = InputPassportElement;

//@description A Telegram Passport element to be saved containing the user's phone number @phone_number The phone number to be saved
inputPassportElementPhoneNumber phone_number:string = InputPassportElement;

//@description A Telegram Passport element to be saved containing the user's email address @email_address The email address to be saved
inputPassportElementEmailAddress email_address:string = InputPassportElement;


//@description Contains information about saved Telegram Passport elements @elements Telegram Passport elements
passportElements elements:vector<PassportElement> = PassportElements;


//@class PassportElementErrorSource @description Contains the description of an error in a Telegram Passport element

//@description The element contains an error in an unspecified place. The error will be considered resolved when new data is added
passportElementErrorSourceUnspecified = PassportElementErrorSource;

//@description One of the data fields contains an error. The error will be considered resolved when the value of the field changes @field_name Field name
passportElementErrorSourceDataField field_name:string = PassportElementErrorSource;

//@description The front side of the document contains an error. The error will be considered resolved when the file with the front side changes
passportElementErrorSourceFrontSide = PassportElementErrorSource;

//@description The reverse side of the document contains an error. The error will be considered resolved when the file with the reverse side changes
passportElementErrorSourceReverseSide = PassportElementErrorSource;

//@description The selfie with the document contains an error. The error will be considered resolved when the file with the selfie changes
passportElementErrorSourceSelfie = PassportElementErrorSource;

//@description One of files with the translation of the document contains an error. The error will be considered resolved when the file changes @file_index Index of a file with the error
passportElementErrorSourceTranslationFile file_index:int32 = PassportElementErrorSource;

//@description The translation of the document contains an error. The error will be considered resolved when the list of translation files changes
passportElementErrorSourceTranslationFiles = PassportElementErrorSource;

//@description The file contains an error. The error will be considered resolved when the file changes @file_index Index of a file with the error
passportElementErrorSourceFile file_index:int32 = PassportElementErrorSource;

//@description The list of attached files contains an error. The error will be considered resolved when the list of files changes
passportElementErrorSourceFiles = PassportElementErrorSource;


//@description Contains the description of an error in a Telegram Passport element @type Type of the Telegram Passport element which has the error @message Error message @source Error source
passportElementError type:PassportElementType message:string source:PassportElementErrorSource = PassportElementError;


//@description Contains information about a Telegram Passport element that was requested by a service
//@type Type of the element
//@is_selfie_required True, if a selfie is required with the identity document
//@is_translation_required True, if a certified English translation is required with the document
//@is_native_name_required True, if personal details must include the user's name in the language of their country of residence
passportSuitableElement type:PassportElementType is_selfie_required:Bool is_translation_required:Bool is_native_name_required:Bool = PassportSuitableElement;

//@description Contains a description of the required Telegram Passport element that was requested by a service @suitable_elements List of Telegram Passport elements any of which is enough to provide
passportRequiredElement suitable_elements:vector<passportSuitableElement> = PassportRequiredElement;

//@description Contains information about a Telegram Passport authorization form that was requested
//@id Unique identifier of the authorization form
//@required_elements Telegram Passport elements that must be provided to complete the form
//@privacy_policy_url URL for the privacy policy of the service; may be empty
passportAuthorizationForm id:int32 required_elements:vector<passportRequiredElement> privacy_policy_url:string = PassportAuthorizationForm;

//@description Contains information about a Telegram Passport elements and corresponding errors @elements Telegram Passport elements @errors Errors in the elements that are already available
passportElementsWithErrors elements:vector<PassportElement> errors:vector<passportElementError> = PassportElementsWithErrors;


//@description Contains encrypted Telegram Passport data credentials @data The encrypted credentials @hash The decrypted data hash @secret Secret for data decryption, encrypted with the service's public key
encryptedCredentials data:bytes hash:bytes secret:bytes = EncryptedCredentials;


//@description Contains information about an encrypted Telegram Passport element; for bots only
//@type Type of Telegram Passport element
//@data Encrypted JSON-encoded data about the user
//@front_side The front side of an identity document
//@reverse_side The reverse side of an identity document; may be null
//@selfie Selfie with the document; may be null
//@translation List of files containing a certified English translation of the document
//@files List of attached files
//@value Unencrypted data, phone number or email address
//@hash Hash of the entire element
encryptedPassportElement type:PassportElementType data:bytes front_side:datedFile reverse_side:datedFile selfie:datedFile translation:vector<datedFile> files:vector<datedFile> value:string hash:string = EncryptedPassportElement;


//@class InputPassportElementErrorSource @description Contains the description of an error in a Telegram Passport element; for bots only

//@description The element contains an error in an unspecified place. The error will be considered resolved when new data is added @element_hash Current hash of the entire element
inputPassportElementErrorSourceUnspecified element_hash:bytes = InputPassportElementErrorSource;

//@description A data field contains an error. The error is considered resolved when the field's value changes @field_name Field name @data_hash Current data hash
inputPassportElementErrorSourceDataField field_name:string data_hash:bytes = InputPassportElementErrorSource;

//@description The front side of the document contains an error. The error is considered resolved when the file with the front side of the document changes @file_hash Current hash of the file containing the front side
inputPassportElementErrorSourceFrontSide file_hash:bytes = InputPassportElementErrorSource;

//@description The reverse side of the document contains an error. The error is considered resolved when the file with the reverse side of the document changes @file_hash Current hash of the file containing the reverse side
inputPassportElementErrorSourceReverseSide file_hash:bytes = InputPassportElementErrorSource;

//@description The selfie contains an error. The error is considered resolved when the file with the selfie changes @file_hash Current hash of the file containing the selfie
inputPassportElementErrorSourceSelfie file_hash:bytes = InputPassportElementErrorSource;

//@description One of the files containing the translation of the document contains an error. The error is considered resolved when the file with the translation changes @file_hash Current hash of the file containing the translation
inputPassportElementErrorSourceTranslationFile file_hash:bytes = InputPassportElementErrorSource;

//@description The translation of the document contains an error. The error is considered resolved when the list of files changes @file_hashes Current hashes of all files with the translation
inputPassportElementErrorSourceTranslationFiles file_hashes:vector<bytes> = InputPassportElementErrorSource;

//@description The file contains an error. The error is considered resolved when the file changes @file_hash Current hash of the file which has the error
inputPassportElementErrorSourceFile file_hash:bytes = InputPassportElementErrorSource;

//@description The list of attached files contains an error. The error is considered resolved when the file list changes @file_hashes Current hashes of all attached files
inputPassportElementErrorSourceFiles file_hashes:vector<bytes> = InputPassportElementErrorSource;


//@description Contains the description of an error in a Telegram Passport element; for bots only @type Type of Telegram Passport element that has the error @message Error message @source Error source
inputPassportElementError type:PassportElementType message:string source:InputPassportElementErrorSource = InputPassportElementError;


//@class MessageContent @description Contains the content of a message

//@description A text message @text Text of the message @web_page A preview of the web page that's mentioned in the text; may be null
messageText text:formattedText web_page:webPage = MessageContent;

//@description An animation message (GIF-style).
//@animation The animation description
//@caption Animation caption
//@has_spoiler True, if the animation preview must be covered by a spoiler animation
//@is_secret True, if the animation thumbnail must be blurred and the animation must be shown only while tapped
messageAnimation animation:animation caption:formattedText has_spoiler:Bool is_secret:Bool = MessageContent;

//@description An audio message @audio The audio description @caption Audio caption
messageAudio audio:audio caption:formattedText = MessageContent;

//@description A document message (general file) @document The document description @caption Document caption
messageDocument document:document caption:formattedText = MessageContent;

//@description A photo message
//@photo The photo
//@caption Photo caption
//@has_spoiler True, if the photo preview must be covered by a spoiler animation
//@is_secret True, if the photo must be blurred and must be shown only while tapped
messagePhoto photo:photo caption:formattedText has_spoiler:Bool is_secret:Bool = MessageContent;

//@description A self-destructed photo message
messageExpiredPhoto = MessageContent;

//@description A sticker message @sticker The sticker description @is_premium True, if premium animation of the sticker must be played
messageSticker sticker:sticker is_premium:Bool = MessageContent;

//@description A video message
//@video The video description
//@caption Video caption
//@has_spoiler True, if the video preview must be covered by a spoiler animation
//@is_secret True, if the video thumbnail must be blurred and the video must be shown only while tapped
messageVideo video:video caption:formattedText has_spoiler:Bool is_secret:Bool = MessageContent;

//@description A self-destructed video message
messageExpiredVideo = MessageContent;

//@description A video note message @video_note The video note description @is_viewed True, if at least one of the recipients has viewed the video note @is_secret True, if the video note thumbnail must be blurred and the video note must be shown only while tapped
messageVideoNote video_note:videoNote is_viewed:Bool is_secret:Bool = MessageContent;

//@description A voice note message @voice_note The voice note description @caption Voice note caption @is_listened True, if at least one of the recipients has listened to the voice note
messageVoiceNote voice_note:voiceNote caption:formattedText is_listened:Bool = MessageContent;

//@description A message with a location
//@location The location description
//@live_period Time relative to the message send date, for which the location can be updated, in seconds
//@expires_in Left time for which the location can be updated, in seconds. updateMessageContent is not sent when this field changes
//@heading For live locations, a direction in which the location moves, in degrees; 1-360. If 0 the direction is unknown
//@proximity_alert_radius For live locations, a maximum distance to another chat member for proximity alerts, in meters (0-100000). 0 if the notification is disabled. Available only to the message sender
messageLocation location:location live_period:int32 expires_in:int32 heading:int32 proximity_alert_radius:int32 = MessageContent;

//@description A message with information about a venue @venue The venue description
messageVenue venue:venue = MessageContent;

//@description A message with a user contact @contact The contact description
messageContact contact:contact = MessageContent;

//@description A message with an animated emoji @animated_emoji The animated emoji @emoji The corresponding emoji
messageAnimatedEmoji animated_emoji:animatedEmoji emoji:string = MessageContent;

//@description A dice message. The dice value is randomly generated by the server
//@initial_state The animated stickers with the initial dice animation; may be null if unknown. updateMessageContent will be sent when the sticker became known
//@final_state The animated stickers with the final dice animation; may be null if unknown. updateMessageContent will be sent when the sticker became known
//@emoji Emoji on which the dice throw animation is based
//@value The dice value. If the value is 0, the dice don't have final state yet
//@success_animation_frame_number Number of frame after which a success animation like a shower of confetti needs to be shown on updateMessageSendSucceeded
messageDice initial_state:DiceStickers final_state:DiceStickers emoji:string value:int32 success_animation_frame_number:int32 = MessageContent;

//@description A message with a game @game The game description
messageGame game:game = MessageContent;

//@description A message with a poll @poll The poll description
messagePoll poll:poll = MessageContent;

//@description A message with an invoice from a bot. Use getInternalLink with internalLinkTypeBotStart to share the invoice
//@title Product title
//@param_description Product description
//@photo Product photo; may be null
//@currency Currency for the product price
//@total_amount Product total price in the smallest units of the currency
//@start_parameter Unique invoice bot start_parameter to be passed to getInternalLink
//@is_test True, if the invoice is a test invoice
//@need_shipping_address True, if the shipping address must be specified
//@receipt_message_id The identifier of the message with the receipt, after the product has been purchased
//@extended_media Extended media attached to the invoice; may be null
messageInvoice title:string description:formattedText photo:photo currency:string total_amount:int53 start_parameter:string is_test:Bool need_shipping_address:Bool receipt_message_id:int53 extended_media:MessageExtendedMedia = MessageContent;

//@description A message with information about an ended call @is_video True, if the call was a video call @discard_reason Reason why the call was discarded @duration Call duration, in seconds
messageCall is_video:Bool discard_reason:CallDiscardReason duration:int32 = MessageContent;

//@description A new video chat was scheduled @group_call_id Identifier of the video chat. The video chat can be received through the method getGroupCall @start_date Point in time (Unix timestamp) when the group call is supposed to be started by an administrator
messageVideoChatScheduled group_call_id:int32 start_date:int32 = MessageContent;

//@description A newly created video chat @group_call_id Identifier of the video chat. The video chat can be received through the method getGroupCall
messageVideoChatStarted group_call_id:int32 = MessageContent;

//@description A message with information about an ended video chat @duration Call duration, in seconds
messageVideoChatEnded duration:int32 = MessageContent;

//@description A message with information about an invite to a video chat @group_call_id Identifier of the video chat. The video chat can be received through the method getGroupCall @user_ids Invited user identifiers
messageInviteVideoChatParticipants group_call_id:int32 user_ids:vector<int53> = MessageContent;

//@description A newly created basic group @title Title of the basic group @member_user_ids User identifiers of members in the basic group
messageBasicGroupChatCreate title:string member_user_ids:vector<int53> = MessageContent;

//@description A newly created supergroup or channel @title Title of the supergroup or channel
messageSupergroupChatCreate title:string = MessageContent;

//@description An updated chat title @title New chat title
messageChatChangeTitle title:string = MessageContent;

//@description An updated chat photo @photo New chat photo
messageChatChangePhoto photo:chatPhoto = MessageContent;

//@description A deleted chat photo
messageChatDeletePhoto = MessageContent;

//@description New chat members were added @member_user_ids User identifiers of the new members
messageChatAddMembers member_user_ids:vector<int53> = MessageContent;

//@description A new member joined the chat via an invite link
messageChatJoinByLink = MessageContent;

//@description A new member was accepted to the chat by an administrator
messageChatJoinByRequest = MessageContent;

//@description A chat member was deleted @user_id User identifier of the deleted chat member
messageChatDeleteMember user_id:int53 = MessageContent;

//@description A basic group was upgraded to a supergroup and was deactivated as the result @supergroup_id Identifier of the supergroup to which the basic group was upgraded
messageChatUpgradeTo supergroup_id:int53 = MessageContent;

//@description A supergroup has been created from a basic group @title Title of the newly created supergroup @basic_group_id The identifier of the original basic group
messageChatUpgradeFrom title:string basic_group_id:int53 = MessageContent;

//@description A message has been pinned @message_id Identifier of the pinned message, can be an identifier of a deleted message or 0
messagePinMessage message_id:int53 = MessageContent;

//@description A screenshot of a message in the chat has been taken
messageScreenshotTaken = MessageContent;

//@description A theme in the chat has been changed @theme_name If non-empty, name of a new theme, set for the chat. Otherwise, chat theme was reset to the default one
messageChatSetTheme theme_name:string = MessageContent;

//@description The auto-delete or self-destruct timer for messages in the chat has been changed @message_auto_delete_time New value auto-delete or self-destruct time, in seconds; 0 if disabled @from_user_id If not 0, a user identifier, which default setting was automatically applied
messageChatSetMessageAutoDeleteTime message_auto_delete_time:int32 from_user_id:int53 = MessageContent;

//@description A forum topic has been created @name Name of the topic @icon Icon of the topic
messageForumTopicCreated name:string icon:forumTopicIcon = MessageContent;

//@description A forum topic has been edited
//@name If non-empty, the new name of the topic
//@edit_icon_custom_emoji_id True, if icon's custom_emoji_id is changed
//@icon_custom_emoji_id New unique identifier of the custom emoji shown on the topic icon; 0 if none. Must be ignored if edit_icon_custom_emoji_id is false
messageForumTopicEdited name:string edit_icon_custom_emoji_id:Bool icon_custom_emoji_id:int64 = MessageContent;

//@description A forum topic has been closed or opened @is_closed True, if the topic was closed; otherwise, the topic was reopened
messageForumTopicIsClosedToggled is_closed:Bool = MessageContent;

//@description A General forum topic has been hidden or unhidden @is_hidden True, if the topic was hidden; otherwise, the topic was unhidden
messageForumTopicIsHiddenToggled is_hidden:Bool = MessageContent;

//@description A profile photo was suggested to a user in a private chat @photo The suggested chat photo. Use the method setProfilePhoto with inputChatPhotoPrevious to apply the photo
messageSuggestProfilePhoto photo:chatPhoto = MessageContent;

//@description A non-standard action has happened in the chat @text Message text to be shown in the chat
messageCustomServiceAction text:string = MessageContent;

//@description A new high score was achieved in a game @game_message_id Identifier of the message with the game, can be an identifier of a deleted message @game_id Identifier of the game; may be different from the games presented in the message with the game @score New score
messageGameScore game_message_id:int53 game_id:int64 score:int32 = MessageContent;

//@description A payment has been completed
//@invoice_chat_id Identifier of the chat, containing the corresponding invoice message
//@invoice_message_id Identifier of the message with the corresponding invoice; can be 0 or an identifier of a deleted message
//@currency Currency for the price of the product
//@total_amount Total price for the product, in the smallest units of the currency
//@is_recurring True, if this is a recurring payment
//@is_first_recurring True, if this is the first recurring payment
//@invoice_name Name of the invoice; may be empty if unknown
messagePaymentSuccessful invoice_chat_id:int53 invoice_message_id:int53 currency:string total_amount:int53 is_recurring:Bool is_first_recurring:Bool invoice_name:string = MessageContent;

//@description A payment has been completed; for bots only
//@currency Currency for price of the product
//@total_amount Total price for the product, in the smallest units of the currency
//@is_recurring True, if this is a recurring payment
//@is_first_recurring True, if this is the first recurring payment
//@invoice_payload Invoice payload
//@shipping_option_id Identifier of the shipping option chosen by the user; may be empty if not applicable
//@order_info Information about the order; may be null
//@telegram_payment_charge_id Telegram payment identifier
//@provider_payment_charge_id Provider payment identifier
messagePaymentSuccessfulBot currency:string total_amount:int53 is_recurring:Bool is_first_recurring:Bool invoice_payload:bytes shipping_option_id:string order_info:orderInfo telegram_payment_charge_id:string provider_payment_charge_id:string = MessageContent;

//@description Telegram Premium was gifted to the user
//@currency Currency for the paid amount
//@amount The paid amount, in the smallest units of the currency
//@month_count Number of month the Telegram Premium subscription will be active
//@sticker A sticker to be shown in the message; may be null if unknown
messageGiftedPremium currency:string amount:int53 month_count:int32 sticker:sticker = MessageContent;

//@description A contact has registered with Telegram
messageContactRegistered = MessageContent;

//@description The current user shared a user, which was requested by the bot @user_id Identifier of the shared user @button_id Identifier of the keyboard button with the request
messageUserShared user_id:int53 button_id:int32 = MessageContent;

//@description The current user shared a chat, which was requested by the bot @chat_id Identifier of the shared chat @button_id Identifier of the keyboard button with the request
messageChatShared chat_id:int53 button_id:int32 = MessageContent;

//@description The current user has connected a website by logging in using Telegram Login Widget on it @domain_name Domain name of the connected website
messageWebsiteConnected domain_name:string = MessageContent;

//@description The user allowed the bot to send messages @web_app Information about the Web App, which requested the access; may be null if none or the Web App was opened from the attachment menu
messageBotWriteAccessAllowed web_app:webApp = MessageContent;

//@description Data from a Web App has been sent to a bot @button_text Text of the keyboardButtonTypeWebApp button, which opened the Web App
messageWebAppDataSent button_text:string = MessageContent;

//@description Data from a Web App has been received; for bots only @button_text Text of the keyboardButtonTypeWebApp button, which opened the Web App @data Received data
messageWebAppDataReceived button_text:string data:string = MessageContent;

//@description Telegram Passport data has been sent to a bot @types List of Telegram Passport element types sent
messagePassportDataSent types:vector<PassportElementType> = MessageContent;

//@description Telegram Passport data has been received; for bots only @elements List of received Telegram Passport elements @credentials Encrypted data credentials
messagePassportDataReceived elements:vector<encryptedPassportElement> credentials:encryptedCredentials = MessageContent;

//@description A user in the chat came within proximity alert range @traveler_id The identifier of a user or chat that triggered the proximity alert @watcher_id The identifier of a user or chat that subscribed for the proximity alert @distance The distance between the users
messageProximityAlertTriggered traveler_id:MessageSender watcher_id:MessageSender distance:int32 = MessageContent;

//@description Message content that is not supported in the current TDLib version
messageUnsupported = MessageContent;


//@class TextEntityType @description Represents a part of the text which must be formatted differently

//@description A mention of a user, a supergroup, or a channel by their username
textEntityTypeMention = TextEntityType;

//@description A hashtag text, beginning with "#"
textEntityTypeHashtag = TextEntityType;

//@description A cashtag text, beginning with "$" and consisting of capital English letters (e.g., "$USD")
textEntityTypeCashtag = TextEntityType;

//@description A bot command, beginning with "/"
textEntityTypeBotCommand = TextEntityType;

//@description An HTTP URL
textEntityTypeUrl = TextEntityType;

//@description An email address
textEntityTypeEmailAddress = TextEntityType;

//@description A phone number
textEntityTypePhoneNumber = TextEntityType;

//@description A bank card number. The getBankCardInfo method can be used to get information about the bank card
textEntityTypeBankCardNumber = TextEntityType;

//@description A bold text
textEntityTypeBold = TextEntityType;

//@description An italic text
textEntityTypeItalic = TextEntityType;

//@description An underlined text
textEntityTypeUnderline = TextEntityType;

//@description A strikethrough text
textEntityTypeStrikethrough = TextEntityType;

//@description A spoiler text
textEntityTypeSpoiler = TextEntityType;

//@description Text that must be formatted as if inside a code HTML tag
textEntityTypeCode = TextEntityType;

//@description Text that must be formatted as if inside a pre HTML tag
textEntityTypePre = TextEntityType;

//@description Text that must be formatted as if inside pre, and code HTML tags @language Programming language of the code; as defined by the sender
textEntityTypePreCode language:string = TextEntityType;

//@description A text description shown instead of a raw URL @url HTTP or tg:// URL to be opened when the link is clicked
textEntityTypeTextUrl url:string = TextEntityType;

//@description A text shows instead of a raw mention of the user (e.g., when the user has no username) @user_id Identifier of the mentioned user
textEntityTypeMentionName user_id:int53 = TextEntityType;

//@description A custom emoji. The text behind a custom emoji must be an emoji. Only premium users can use premium custom emoji @custom_emoji_id Unique identifier of the custom emoji
textEntityTypeCustomEmoji custom_emoji_id:int64 = TextEntityType;

//@description A media timestamp @media_timestamp Timestamp from which a video/audio/video note/voice note playing must start, in seconds. The media can be in the content or the web page preview of the current message, or in the same places in the replied message
textEntityTypeMediaTimestamp media_timestamp:int32 = TextEntityType;


//@description A thumbnail to be sent along with a file; must be in JPEG or WEBP format for stickers, and less than 200 KB in size
//@thumbnail Thumbnail file to send. Sending thumbnails by file_id is currently not supported
//@width Thumbnail width, usually shouldn't exceed 320. Use 0 if unknown
//@height Thumbnail height, usually shouldn't exceed 320. Use 0 if unknown
inputThumbnail thumbnail:InputFile width:int32 height:int32 = InputThumbnail;


//@class MessageSchedulingState @description Contains information about the time when a scheduled message will be sent

//@description The message will be sent at the specified date @send_date Date the message will be sent. The date must be within 367 days in the future
messageSchedulingStateSendAtDate send_date:int32 = MessageSchedulingState;

//@description The message will be sent when the peer will be online. Applicable to private chats only and when the exact online status of the peer is known
messageSchedulingStateSendWhenOnline = MessageSchedulingState;


//@description Options to be used when a message is sent
//@disable_notification Pass true to disable notification for the message
//@from_background Pass true if the message is sent from the background
//@protect_content Pass true if the content of the message must be protected from forwarding and saving; for bots only
//@update_order_of_installed_sticker_sets Pass true if the user explicitly chosen a sticker or a custom emoji from an installed sticker set; applicable only to sendMessage and sendMessageAlbum
//@scheduling_state Message scheduling state; pass null to send message immediately. Messages sent to a secret chat, live location messages and self-destructing messages can't be scheduled
//@sending_id Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates
messageSendOptions disable_notification:Bool from_background:Bool protect_content:Bool update_order_of_installed_sticker_sets:Bool scheduling_state:MessageSchedulingState sending_id:int32 = MessageSendOptions;

//@description Options to be used when a message content is copied without reference to the original sender. Service messages and messageInvoice can't be copied
//@send_copy True, if content of the message needs to be copied without reference to the original sender. Always true if the message is forwarded to a secret chat or is local
//@replace_caption True, if media caption of the message copy needs to be replaced. Ignored if send_copy is false
//@new_caption New message caption; pass null to copy message without caption. Ignored if replace_caption is false
messageCopyOptions send_copy:Bool replace_caption:Bool new_caption:formattedText = MessageCopyOptions;


//@class InputMessageContent @description The content of a message to send

//@description A text message
//@text Formatted text to be sent; 1-getOption("message_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, Code, Pre, PreCode, TextUrl and MentionName entities are allowed to be specified manually
//@disable_web_page_preview True, if rich web page previews for URLs in the message text must be disabled
//@clear_draft True, if a chat message draft must be deleted
inputMessageText text:formattedText disable_web_page_preview:Bool clear_draft:Bool = InputMessageContent;

//@description An animation message (GIF-style).
//@animation Animation file to be sent
//@thumbnail Animation thumbnail; pass null to skip thumbnail uploading
//@added_sticker_file_ids File identifiers of the stickers added to the animation, if applicable
//@duration Duration of the animation, in seconds
//@width Width of the animation; may be replaced by the server
//@height Height of the animation; may be replaced by the server
//@caption Animation caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
//@has_spoiler True, if the animation preview must be covered by a spoiler animation; not supported in secret chats
inputMessageAnimation animation:InputFile thumbnail:inputThumbnail added_sticker_file_ids:vector<int32> duration:int32 width:int32 height:int32 caption:formattedText has_spoiler:Bool = InputMessageContent;

//@description An audio message
//@audio Audio file to be sent
//@album_cover_thumbnail Thumbnail of the cover for the album; pass null to skip thumbnail uploading
//@duration Duration of the audio, in seconds; may be replaced by the server
//@title Title of the audio; 0-64 characters; may be replaced by the server
//@performer Performer of the audio; 0-64 characters, may be replaced by the server
//@caption Audio caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
inputMessageAudio audio:InputFile album_cover_thumbnail:inputThumbnail duration:int32 title:string performer:string caption:formattedText = InputMessageContent;

//@description A document message (general file)
//@document Document to be sent
//@thumbnail Document thumbnail; pass null to skip thumbnail uploading
//@disable_content_type_detection If true, automatic file type detection will be disabled and the document will always be sent as file. Always true for files sent to secret chats
//@caption Document caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
inputMessageDocument document:InputFile thumbnail:inputThumbnail disable_content_type_detection:Bool caption:formattedText = InputMessageContent;

//@description A photo message
//@photo Photo to send. The photo must be at most 10 MB in size. The photo's width and height must not exceed 10000 in total. Width and height ratio must be at most 20
//@thumbnail Photo thumbnail to be sent; pass null to skip thumbnail uploading. The thumbnail is sent to the other party only in secret chats
//@added_sticker_file_ids File identifiers of the stickers added to the photo, if applicable
//@width Photo width
//@height Photo height
//@caption Photo caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
//@self_destruct_time Photo self-destruct time, in seconds (0-60). A non-zero self-destruct time can be specified only in private chats
//@has_spoiler True, if the photo preview must be covered by a spoiler animation; not supported in secret chats
inputMessagePhoto photo:InputFile thumbnail:inputThumbnail added_sticker_file_ids:vector<int32> width:int32 height:int32 caption:formattedText self_destruct_time:int32 has_spoiler:Bool = InputMessageContent;

//@description A sticker message
//@sticker Sticker to be sent
//@thumbnail Sticker thumbnail; pass null to skip thumbnail uploading
//@width Sticker width
//@height Sticker height
//@emoji Emoji used to choose the sticker
inputMessageSticker sticker:InputFile thumbnail:inputThumbnail width:int32 height:int32 emoji:string = InputMessageContent;

//@description A video message
//@video Video to be sent
//@thumbnail Video thumbnail; pass null to skip thumbnail uploading
//@added_sticker_file_ids File identifiers of the stickers added to the video, if applicable
//@duration Duration of the video, in seconds
//@width Video width
//@height Video height
//@supports_streaming True, if the video is supposed to be streamed
//@caption Video caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
//@self_destruct_time Video self-destruct time, in seconds (0-60). A non-zero self-destruct time can be specified only in private chats
//@has_spoiler True, if the video preview must be covered by a spoiler animation; not supported in secret chats
inputMessageVideo video:InputFile thumbnail:inputThumbnail added_sticker_file_ids:vector<int32> duration:int32 width:int32 height:int32 supports_streaming:Bool caption:formattedText self_destruct_time:int32 has_spoiler:Bool = InputMessageContent;

//@description A video note message
//@video_note Video note to be sent
//@thumbnail Video thumbnail; pass null to skip thumbnail uploading
//@duration Duration of the video, in seconds
//@length Video width and height; must be positive and not greater than 640
inputMessageVideoNote video_note:InputFile thumbnail:inputThumbnail duration:int32 length:int32 = InputMessageContent;

//@description A voice note message
//@voice_note Voice note to be sent
//@duration Duration of the voice note, in seconds
//@waveform Waveform representation of the voice note in 5-bit format
//@caption Voice note caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
inputMessageVoiceNote voice_note:InputFile duration:int32 waveform:bytes caption:formattedText = InputMessageContent;

//@description A message with a location
//@location Location to be sent
//@live_period Period for which the location can be updated, in seconds; must be between 60 and 86400 for a live location and 0 otherwise
//@heading For live locations, a direction in which the location moves, in degrees; 1-360. Pass 0 if unknown
//@proximity_alert_radius For live locations, a maximum distance to another chat member for proximity alerts, in meters (0-100000). Pass 0 if the notification is disabled. Can't be enabled in channels and Saved Messages
inputMessageLocation location:location live_period:int32 heading:int32 proximity_alert_radius:int32 = InputMessageContent;

//@description A message with information about a venue @venue Venue to send
inputMessageVenue venue:venue = InputMessageContent;

//@description A message containing a user contact @contact Contact to send
inputMessageContact contact:contact = InputMessageContent;

//@description A dice message @emoji Emoji on which the dice throw animation is based @clear_draft True, if the chat message draft must be deleted
inputMessageDice emoji:string clear_draft:Bool = InputMessageContent;

//@description A message with a game; not supported for channels or secret chats @bot_user_id User identifier of the bot that owns the game @game_short_name Short name of the game
inputMessageGame bot_user_id:int53 game_short_name:string = InputMessageContent;

//@description A message with an invoice; can be used only by bots
//@invoice Invoice
//@title Product title; 1-32 characters
//@param_description Product description; 0-255 characters
//@photo_url Product photo URL; optional
//@photo_size Product photo size
//@photo_width Product photo width
//@photo_height Product photo height
//@payload The invoice payload
//@provider_token Payment provider token
//@provider_data JSON-encoded data about the invoice, which will be shared with the payment provider
//@start_parameter Unique invoice bot deep link parameter for the generation of this invoice. If empty, it would be possible to pay directly from forwards of the invoice message
//@extended_media_content The content of extended media attached to the invoice. The content of the message to be sent. Must be one of the following types: inputMessagePhoto, inputMessageVideo
inputMessageInvoice invoice:invoice title:string description:string photo_url:string photo_size:int32 photo_width:int32 photo_height:int32 payload:bytes provider_token:string provider_data:string start_parameter:string extended_media_content:InputMessageContent = InputMessageContent;

//@description A message with a poll. Polls can't be sent to secret chats. Polls can be sent only to a private chat with a bot
//@question Poll question; 1-255 characters (up to 300 characters for bots)
//@options List of poll answer options, 2-10 strings 1-100 characters each
//@is_anonymous True, if the poll voters are anonymous. Non-anonymous polls can't be sent or forwarded to channels
//@type Type of the poll
//@open_period Amount of time the poll will be active after creation, in seconds; for bots only
//@close_date Point in time (Unix timestamp) when the poll will automatically be closed; for bots only
//@is_closed True, if the poll needs to be sent already closed; for bots only
inputMessagePoll question:string options:vector<string> is_anonymous:Bool type:PollType open_period:int32 close_date:int32 is_closed:Bool = InputMessageContent;

//@description A forwarded message
//@from_chat_id Identifier for the chat this forwarded message came from
//@message_id Identifier of the message to forward
//@in_game_share True, if a game message is being shared from a launched game; applies only to game messages
//@copy_options Options to be used to copy content of the message without reference to the original sender; pass null to forward the message as usual
inputMessageForwarded from_chat_id:int53 message_id:int53 in_game_share:Bool copy_options:messageCopyOptions = InputMessageContent;


//@class SearchMessagesFilter @description Represents a filter for message search results

//@description Returns all found messages, no filter is applied
searchMessagesFilterEmpty = SearchMessagesFilter;

//@description Returns only animation messages
searchMessagesFilterAnimation = SearchMessagesFilter;

//@description Returns only audio messages
searchMessagesFilterAudio = SearchMessagesFilter;

//@description Returns only document messages
searchMessagesFilterDocument = SearchMessagesFilter;

//@description Returns only photo messages
searchMessagesFilterPhoto = SearchMessagesFilter;

//@description Returns only video messages
searchMessagesFilterVideo = SearchMessagesFilter;

//@description Returns only voice note messages
searchMessagesFilterVoiceNote = SearchMessagesFilter;

//@description Returns only photo and video messages
searchMessagesFilterPhotoAndVideo = SearchMessagesFilter;

//@description Returns only messages containing URLs
searchMessagesFilterUrl = SearchMessagesFilter;

//@description Returns only messages containing chat photos
searchMessagesFilterChatPhoto = SearchMessagesFilter;

//@description Returns only video note messages
searchMessagesFilterVideoNote = SearchMessagesFilter;

//@description Returns only voice and video note messages
searchMessagesFilterVoiceAndVideoNote = SearchMessagesFilter;

//@description Returns only messages with mentions of the current user, or messages that are replies to their messages
searchMessagesFilterMention = SearchMessagesFilter;

//@description Returns only messages with unread mentions of the current user, or messages that are replies to their messages. When using this filter the results can't be additionally filtered by a query, a message thread or by the sending user
searchMessagesFilterUnreadMention = SearchMessagesFilter;

//@description Returns only messages with unread reactions for the current user. When using this filter the results can't be additionally filtered by a query, a message thread or by the sending user
searchMessagesFilterUnreadReaction = SearchMessagesFilter;

//@description Returns only failed to send messages. This filter can be used only if the message database is used
searchMessagesFilterFailedToSend = SearchMessagesFilter;

//@description Returns only pinned messages
searchMessagesFilterPinned = SearchMessagesFilter;


//@class ChatAction @description Describes the different types of activity in a chat

//@description The user is typing a message
chatActionTyping = ChatAction;

//@description The user is recording a video
chatActionRecordingVideo = ChatAction;

//@description The user is uploading a video @progress Upload progress, as a percentage
chatActionUploadingVideo progress:int32 = ChatAction;

//@description The user is recording a voice note
chatActionRecordingVoiceNote = ChatAction;

//@description The user is uploading a voice note @progress Upload progress, as a percentage
chatActionUploadingVoiceNote progress:int32 = ChatAction;

//@description The user is uploading a photo @progress Upload progress, as a percentage
chatActionUploadingPhoto progress:int32 = ChatAction;

//@description The user is uploading a document @progress Upload progress, as a percentage
chatActionUploadingDocument progress:int32 = ChatAction;

//@description The user is picking a sticker to send
chatActionChoosingSticker = ChatAction;

//@description The user is picking a location or venue to send
chatActionChoosingLocation = ChatAction;

//@description The user is picking a contact to send
chatActionChoosingContact = ChatAction;

//@description The user has started to play a game
chatActionStartPlayingGame = ChatAction;

//@description The user is recording a video note
chatActionRecordingVideoNote = ChatAction;

//@description The user is uploading a video note @progress Upload progress, as a percentage
chatActionUploadingVideoNote progress:int32 = ChatAction;

//@description The user is watching animations sent by the other party by clicking on an animated emoji @emoji The animated emoji
chatActionWatchingAnimations emoji:string = ChatAction;

//@description The user has canceled the previous action
chatActionCancel = ChatAction;


//@class UserStatus @description Describes the last time the user was online

//@description The user status was never changed
userStatusEmpty = UserStatus;

//@description The user is online @expires Point in time (Unix timestamp) when the user's online status will expire
userStatusOnline expires:int32 = UserStatus;

//@description The user is offline @was_online Point in time (Unix timestamp) when the user was last online
userStatusOffline was_online:int32 = UserStatus;

//@description The user was online recently
userStatusRecently = UserStatus;

//@description The user is offline, but was online last week
userStatusLastWeek = UserStatus;

//@description The user is offline, but was online last month
userStatusLastMonth = UserStatus;


//@description Represents a list of stickers @stickers List of stickers
stickers stickers:vector<sticker> = Stickers;

//@description Represents a list of emoji @emojis List of emojis
emojis emojis:vector<string> = Emojis;

//@description Represents a sticker set
//@id Identifier of the sticker set
//@title Title of the sticker set
//@name Name of the sticker set
//@thumbnail Sticker set thumbnail in WEBP, TGS, or WEBM format with width and height 100; may be null. The file can be downloaded only before the thumbnail is changed
//@thumbnail_outline Sticker set thumbnail's outline represented as a list of closed vector paths; may be empty. The coordinate system origin is in the upper-left corner
//@is_installed True, if the sticker set has been installed by the current user
//@is_archived True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously
//@is_official True, if the sticker set is official
//@sticker_format Format of the stickers in the set
//@sticker_type Type of the stickers in the set
//@is_viewed True for already viewed trending sticker sets
//@stickers List of stickers in this set
//@emojis A list of emoji corresponding to the stickers in the same order. The list is only for informational purposes, because a sticker is always sent with a fixed emoji from the corresponding Sticker object
stickerSet id:int64 title:string name:string thumbnail:thumbnail thumbnail_outline:vector<closedVectorPath> is_installed:Bool is_archived:Bool is_official:Bool sticker_format:StickerFormat sticker_type:StickerType is_viewed:Bool stickers:vector<sticker> emojis:vector<emojis> = StickerSet;

//@description Represents short information about a sticker set
//@id Identifier of the sticker set
//@title Title of the sticker set
//@name Name of the sticker set
//@thumbnail Sticker set thumbnail in WEBP, TGS, or WEBM format with width and height 100; may be null
//@thumbnail_outline Sticker set thumbnail's outline represented as a list of closed vector paths; may be empty. The coordinate system origin is in the upper-left corner
//@is_installed True, if the sticker set has been installed by the current user
//@is_archived True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously
//@is_official True, if the sticker set is official
//@sticker_format Format of the stickers in the set
//@sticker_type Type of the stickers in the set
//@is_viewed True for already viewed trending sticker sets
//@size Total number of stickers in the set
//@covers Up to the first 5 stickers from the set, depending on the context. If the application needs more stickers the full sticker set needs to be requested
stickerSetInfo id:int64 title:string name:string thumbnail:thumbnail thumbnail_outline:vector<closedVectorPath> is_installed:Bool is_archived:Bool is_official:Bool sticker_format:StickerFormat sticker_type:StickerType is_viewed:Bool size:int32 covers:vector<sticker> = StickerSetInfo;

//@description Represents a list of sticker sets @total_count Approximate total number of sticker sets found @sets List of sticker sets
stickerSets total_count:int32 sets:vector<stickerSetInfo> = StickerSets;

//@description Represents a list of trending sticker sets @total_count Approximate total number of trending sticker sets @sets List of trending sticker sets @is_premium True, if the list contains sticker sets with premium stickers
trendingStickerSets total_count:int32 sets:vector<stickerSetInfo> is_premium:Bool = TrendingStickerSets;


//@description Contains a list of similar emoji to search for in getStickers and searchStickers
//@name Name of the category
//@icon Custom emoji sticker, which represents icon of the category
//@emojis List of emojis in the category
emojiCategory name:string icon:sticker emojis:vector<string> = EmojiCategory;

//@description Represents a list of emoji categories @categories List of categories
emojiCategories categories:vector<emojiCategory> = EmojiCategories;


//@class EmojiCategoryType @description Describes type of an emoji category

//@description The category must be used by default
emojiCategoryTypeDefault = EmojiCategoryType;

//@description The category must be used for emoji status selection
emojiCategoryTypeEmojiStatus = EmojiCategoryType;

//@description The category must be used for chat photo emoji selection
emojiCategoryTypeChatPhoto = EmojiCategoryType;


//@class CallDiscardReason @description Describes the reason why a call was discarded

//@description The call wasn't discarded, or the reason is unknown
callDiscardReasonEmpty = CallDiscardReason;

//@description The call was ended before the conversation started. It was canceled by the caller or missed by the other party
callDiscardReasonMissed = CallDiscardReason;

//@description The call was ended before the conversation started. It was declined by the other party
callDiscardReasonDeclined = CallDiscardReason;

//@description The call was ended during the conversation because the users were disconnected
callDiscardReasonDisconnected = CallDiscardReason;

//@description The call was ended because one of the parties hung up
callDiscardReasonHungUp = CallDiscardReason;


//@description Specifies the supported call protocols
//@udp_p2p True, if UDP peer-to-peer connections are supported
//@udp_reflector True, if connection through UDP reflectors is supported
//@min_layer The minimum supported API layer; use 65
//@max_layer The maximum supported API layer; use 65
//@library_versions List of supported tgcalls versions
callProtocol udp_p2p:Bool udp_reflector:Bool min_layer:int32 max_layer:int32 library_versions:vector<string> = CallProtocol;


//@class CallServerType @description Describes the type of a call server

//@description A Telegram call reflector @peer_tag A peer tag to be used with the reflector @is_tcp True, if the server uses TCP instead of UDP
callServerTypeTelegramReflector peer_tag:bytes is_tcp:Bool = CallServerType;

//@description A WebRTC server
//@username Username to be used for authentication
//@password Authentication password
//@supports_turn True, if the server supports TURN
//@supports_stun True, if the server supports STUN
callServerTypeWebrtc username:string password:string supports_turn:Bool supports_stun:Bool = CallServerType;


//@description Describes a server for relaying call data
//@id Server identifier
//@ip_address Server IPv4 address
//@ipv6_address Server IPv6 address
//@port Server port number
//@type Server type
callServer id:int64 ip_address:string ipv6_address:string port:int32 type:CallServerType = CallServer;


//@description Contains the call identifier @id Call identifier
callId id:int32 = CallId;

//@description Contains the group call identifier @id Group call identifier
groupCallId id:int32 = GroupCallId;


//@class CallState @description Describes the current call state

//@description The call is pending, waiting to be accepted by a user @is_created True, if the call has already been created by the server @is_received True, if the call has already been received by the other party
callStatePending is_created:Bool is_received:Bool = CallState;

//@description The call has been answered and encryption keys are being exchanged
callStateExchangingKeys = CallState;

//@description The call is ready to use
//@protocol Call protocols supported by the peer
//@servers List of available call servers
//@config A JSON-encoded call config
//@encryption_key Call encryption key
//@emojis Encryption key emojis fingerprint
//@allow_p2p True, if peer-to-peer connection is allowed by users privacy settings
callStateReady protocol:callProtocol servers:vector<callServer> config:string encryption_key:bytes emojis:vector<string> allow_p2p:Bool = CallState;

//@description The call is hanging up after discardCall has been called
callStateHangingUp = CallState;

//@description The call has ended successfully
//@reason The reason, why the call has ended
//@need_rating True, if the call rating must be sent to the server
//@need_debug_information True, if the call debug information must be sent to the server
//@need_log True, if the call log must be sent to the server
callStateDiscarded reason:CallDiscardReason need_rating:Bool need_debug_information:Bool need_log:Bool = CallState;

//@description The call has ended with an error @error Error. An error with the code 4005000 will be returned if an outgoing call is missed because of an expired timeout
callStateError error:error = CallState;


//@class GroupCallVideoQuality @description Describes the quality of a group call video

//@description The worst available video quality
groupCallVideoQualityThumbnail = GroupCallVideoQuality;

//@description The medium video quality
groupCallVideoQualityMedium = GroupCallVideoQuality;

//@description The best available video quality
groupCallVideoQualityFull = GroupCallVideoQuality;


//@description Describes an available stream in a group call
//@channel_id Identifier of an audio/video channel
//@scale Scale of segment durations in the stream. The duration is 1000/(2**scale) milliseconds
//@time_offset Point in time when the stream currently ends; Unix timestamp in milliseconds
groupCallStream channel_id:int32 scale:int32 time_offset:int53 = GroupCallStream;

//@description Represents a list of group call streams @streams A list of group call streams
groupCallStreams streams:vector<groupCallStream> = GroupCallStreams;

//@description Represents an RTMP URL @url The URL @stream_key Stream key
rtmpUrl url:string stream_key:string = RtmpUrl;


//@description Describes a recently speaking participant in a group call @participant_id Group call participant identifier @is_speaking True, is the user has spoken recently
groupCallRecentSpeaker participant_id:MessageSender is_speaking:Bool = GroupCallRecentSpeaker;

//@description Describes a group call
//@id Group call identifier
//@title Group call title
//@scheduled_start_date Point in time (Unix timestamp) when the group call is supposed to be started by an administrator; 0 if it is already active or was ended
//@enabled_start_notification True, if the group call is scheduled and the current user will receive a notification when the group call will start
//@is_active True, if the call is active
//@is_rtmp_stream True, if the chat is an RTMP stream instead of an ordinary video chat
//@is_joined True, if the call is joined
//@need_rejoin True, if user was kicked from the call because of network loss and the call needs to be rejoined
//@can_be_managed True, if the current user can manage the group call
//@participant_count Number of participants in the group call
//@has_hidden_listeners True, if group call participants, which are muted, aren't returned in participant list
//@loaded_all_participants True, if all group call participants are loaded
//@recent_speakers At most 3 recently speaking users in the group call
//@is_my_video_enabled True, if the current user's video is enabled
//@is_my_video_paused True, if the current user's video is paused
//@can_enable_video True, if the current user can broadcast video or share screen
//@mute_new_participants True, if only group call administrators can unmute new participants
//@can_toggle_mute_new_participants True, if the current user can enable or disable mute_new_participants setting
//@record_duration Duration of the ongoing group call recording, in seconds; 0 if none. An updateGroupCall update is not triggered when value of this field changes, but the same recording goes on
//@is_video_recorded True, if a video file is being recorded for the call
//@duration Call duration, in seconds; for ended calls only
groupCall id:int32 title:string scheduled_start_date:int32 enabled_start_notification:Bool is_active:Bool is_rtmp_stream:Bool is_joined:Bool need_rejoin:Bool can_be_managed:Bool participant_count:int32 has_hidden_listeners:Bool loaded_all_participants:Bool recent_speakers:vector<groupCallRecentSpeaker> is_my_video_enabled:Bool is_my_video_paused:Bool can_enable_video:Bool mute_new_participants:Bool can_toggle_mute_new_participants:Bool record_duration:int32 is_video_recorded:Bool duration:int32 = GroupCall;

//@description Describes a group of video synchronization source identifiers @semantics The semantics of sources, one of "SIM" or "FID" @source_ids The list of synchronization source identifiers
groupCallVideoSourceGroup semantics:string source_ids:vector<int32> = GroupCallVideoSourceGroup;

//@description Contains information about a group call participant's video channel
//@source_groups List of synchronization source groups of the video
//@endpoint_id Video channel endpoint identifier
//@is_paused True, if the video is paused. This flag needs to be ignored, if new video frames are received
groupCallParticipantVideoInfo source_groups:vector<groupCallVideoSourceGroup> endpoint_id:string is_paused:Bool = GroupCallParticipantVideoInfo;

//@description Represents a group call participant
//@participant_id Identifier of the group call participant
//@audio_source_id User's audio channel synchronization source identifier
//@screen_sharing_audio_source_id User's screen sharing audio channel synchronization source identifier
//@video_info Information about user's video channel; may be null if there is no active video
//@screen_sharing_video_info Information about user's screen sharing video channel; may be null if there is no active screen sharing video
//@bio The participant user's bio or the participant chat's description
//@is_current_user True, if the participant is the current user
//@is_speaking True, if the participant is speaking as set by setGroupCallParticipantIsSpeaking
//@is_hand_raised True, if the participant hand is raised
//@can_be_muted_for_all_users True, if the current user can mute the participant for all other group call participants
//@can_be_unmuted_for_all_users True, if the current user can allow the participant to unmute themselves or unmute the participant (if the participant is the current user)
//@can_be_muted_for_current_user True, if the current user can mute the participant only for self
//@can_be_unmuted_for_current_user True, if the current user can unmute the participant for self
//@is_muted_for_all_users True, if the participant is muted for all users
//@is_muted_for_current_user True, if the participant is muted for the current user
//@can_unmute_self True, if the participant is muted for all users, but can unmute themselves
//@volume_level Participant's volume level; 1-20000 in hundreds of percents
//@order User's order in the group call participant list. Orders must be compared lexicographically. The bigger is order, the higher is user in the list. If order is empty, the user must be removed from the participant list
groupCallParticipant participant_id:MessageSender audio_source_id:int32 screen_sharing_audio_source_id:int32 video_info:groupCallParticipantVideoInfo screen_sharing_video_info:groupCallParticipantVideoInfo bio:string is_current_user:Bool is_speaking:Bool is_hand_raised:Bool can_be_muted_for_all_users:Bool can_be_unmuted_for_all_users:Bool can_be_muted_for_current_user:Bool can_be_unmuted_for_current_user:Bool is_muted_for_all_users:Bool is_muted_for_current_user:Bool can_unmute_self:Bool volume_level:int32 order:string = GroupCallParticipant;


//@class CallProblem @description Describes the exact type of a problem with a call

//@description The user heard their own voice
callProblemEcho = CallProblem;

//@description The user heard background noise
callProblemNoise = CallProblem;

//@description The other side kept disappearing
callProblemInterruptions = CallProblem;

//@description The speech was distorted
callProblemDistortedSpeech = CallProblem;

//@description The user couldn't hear the other side
callProblemSilentLocal = CallProblem;

//@description The other side couldn't hear the user
callProblemSilentRemote = CallProblem;

//@description The call ended unexpectedly
callProblemDropped = CallProblem;

//@description The video was distorted
callProblemDistortedVideo = CallProblem;

//@description The video was pixelated
callProblemPixelatedVideo = CallProblem;


//@description Describes a call
//@id Call identifier, not persistent
//@user_id Peer user identifier
//@is_outgoing True, if the call is outgoing
//@is_video True, if the call is a video call
//@state Call state
call id:int32 user_id:int53 is_outgoing:Bool is_video:Bool state:CallState = Call;


//@class FirebaseAuthenticationSettings @description Contains settings for Firebase Authentication in the official applications

//@description Settings for Firebase Authentication in the official Android application
firebaseAuthenticationSettingsAndroid = FirebaseAuthenticationSettings;

//@description Settings for Firebase Authentication in the official iOS application @device_token Device token from Apple Push Notification service @is_app_sandbox True, if App Sandbox is enabled
firebaseAuthenticationSettingsIos device_token:string is_app_sandbox:Bool = FirebaseAuthenticationSettings;


//@description Contains settings for the authentication of the user's phone number
//@allow_flash_call Pass true if the authentication code may be sent via a flash call to the specified phone number
//@allow_missed_call Pass true if the authentication code may be sent via a missed call to the specified phone number
//@is_current_phone_number Pass true if the authenticated phone number is used on the current device
//@allow_sms_retriever_api For official applications only. True, if the application can use Android SMS Retriever API (requires Google Play Services >= 10.2) to automatically receive the authentication code from the SMS. See https://developers.google.com/identity/sms-retriever/ for more details
//@firebase_authentication_settings For official Android and iOS applications only; pass null otherwise. Settings for Firebase Authentication
//@authentication_tokens List of up to 20 authentication tokens, recently received in updateOption("authentication_token") in previously logged out sessions
phoneNumberAuthenticationSettings allow_flash_call:Bool allow_missed_call:Bool is_current_phone_number:Bool allow_sms_retriever_api:Bool firebase_authentication_settings:FirebaseAuthenticationSettings authentication_tokens:vector<string> = PhoneNumberAuthenticationSettings;


//@description Represents a reaction applied to a message @type Type of the reaction @sender_id Identifier of the chat member, applied the reaction @date Point in time (Unix timestamp) when the reaction was added
addedReaction type:ReactionType sender_id:MessageSender date:int32 = AddedReaction;

//@description Represents a list of reactions added to a message @total_count The total number of found reactions @reactions The list of added reactions @next_offset The offset for the next request. If empty, there are no more results
addedReactions total_count:int32 reactions:vector<addedReaction> next_offset:string = AddedReactions;

//@description Represents an available reaction @type Type of the reaction @needs_premium True, if Telegram Premium is needed to send the reaction
availableReaction type:ReactionType needs_premium:Bool = AvailableReaction;

//@description Represents a list of reactions that can be added to a message
//@top_reactions List of reactions to be shown at the top
//@recent_reactions List of recently used reactions
//@popular_reactions List of popular reactions
//@allow_custom_emoji True, if custom emoji reactions could be added by Telegram Premium subscribers
availableReactions top_reactions:vector<availableReaction> recent_reactions:vector<availableReaction> popular_reactions:vector<availableReaction> allow_custom_emoji:Bool = AvailableReactions;

//@description Contains information about a emoji reaction
//@emoji Text representation of the reaction
//@title Reaction title
//@is_active True, if the reaction can be added to new messages and enabled in chats
//@static_icon Static icon for the reaction
//@appear_animation Appear animation for the reaction
//@select_animation Select animation for the reaction
//@activate_animation Activate animation for the reaction
//@effect_animation Effect animation for the reaction
//@around_animation Around animation for the reaction; may be null
//@center_animation Center animation for the reaction; may be null
emojiReaction emoji:string title:string is_active:Bool static_icon:sticker appear_animation:sticker select_animation:sticker activate_animation:sticker effect_animation:sticker around_animation:sticker center_animation:sticker = EmojiReaction;


//@description Represents a list of animations @animations List of animations
animations animations:vector<animation> = Animations;


//@class DiceStickers @description Contains animated stickers which must be used for dice animation rendering

//@description A regular animated sticker @sticker The animated sticker with the dice animation
diceStickersRegular sticker:sticker = DiceStickers;

//@description Animated stickers to be combined into a slot machine
//@background The animated sticker with the slot machine background. The background animation must start playing after all reel animations finish
//@lever The animated sticker with the lever animation. The lever animation must play once in the initial dice state
//@left_reel The animated sticker with the left reel
//@center_reel The animated sticker with the center reel
//@right_reel The animated sticker with the right reel
diceStickersSlotMachine background:sticker lever:sticker left_reel:sticker center_reel:sticker right_reel:sticker = DiceStickers;


//@description Represents the result of an importContacts request
//@user_ids User identifiers of the imported contacts in the same order as they were specified in the request; 0 if the contact is not yet a registered user
//@importer_count The number of users that imported the corresponding contact; 0 for already registered users or if unavailable
importedContacts user_ids:vector<int53> importer_count:vector<int32> = ImportedContacts;


//@class SpeechRecognitionResult @description Describes result of speech recognition in a voice note

//@description The speech recognition is ongoing @partial_text Partially recognized text
speechRecognitionResultPending partial_text:string = SpeechRecognitionResult;

//@description The speech recognition successfully finished @text Recognized text
speechRecognitionResultText text:string = SpeechRecognitionResult;

//@description The speech recognition failed @error Received error
speechRecognitionResultError error:error = SpeechRecognitionResult;


//@description Describes a color to highlight a bot added to attachment menu @light_color Color in the RGB24 format for light themes @dark_color Color in the RGB24 format for dark themes
attachmentMenuBotColor light_color:int32 dark_color:int32 = AttachmentMenuBotColor;

//@description Represents a bot, which can be added to attachment menu
//@bot_user_id User identifier of the bot added to attachment menu
//@supports_self_chat True, if the bot supports opening from attachment menu in the chat with the bot
//@supports_user_chats True, if the bot supports opening from attachment menu in private chats with ordinary users
//@supports_bot_chats True, if the bot supports opening from attachment menu in private chats with other bots
//@supports_group_chats True, if the bot supports opening from attachment menu in basic group and supergroup chats
//@supports_channel_chats True, if the bot supports opening from attachment menu in channel chats
//@supports_settings True, if the bot supports "settings_button_pressed" event
//@request_write_access True, if the user must be asked for the permission to the bot to send them messages
//@name Name for the bot in attachment menu
//@name_color Color to highlight selected name of the bot if appropriate; may be null
//@default_icon Default attachment menu icon for the bot in SVG format; may be null
//@ios_static_icon Attachment menu icon for the bot in SVG format for the official iOS app; may be null
//@ios_animated_icon Attachment menu icon for the bot in TGS format for the official iOS app; may be null
//@android_icon Attachment menu icon for the bot in TGS format for the official Android app; may be null
//@macos_icon Attachment menu icon for the bot in TGS format for the official native macOS app; may be null
//@icon_color Color to highlight selected icon of the bot if appropriate; may be null
//@web_app_placeholder Default placeholder for opened Web Apps in SVG format; may be null
attachmentMenuBot bot_user_id:int53 supports_self_chat:Bool supports_user_chats:Bool supports_bot_chats:Bool supports_group_chats:Bool supports_channel_chats:Bool supports_settings:Bool request_write_access:Bool name:string name_color:attachmentMenuBotColor default_icon:file ios_static_icon:file ios_animated_icon:file android_icon:file macos_icon:file icon_color:attachmentMenuBotColor web_app_placeholder:file = AttachmentMenuBot;

//@description Information about the message sent by answerWebAppQuery @inline_message_id Identifier of the sent inline message, if known
sentWebAppMessage inline_message_id:string = SentWebAppMessage;


//@description Contains an HTTP URL @url The URL
httpUrl url:string = HttpUrl;


//@description Contains an HTTPS URL, which can be used to get information about a user @url The URL @expires_in Left time for which the link is valid, in seconds; 0 if the link is a public username link
userLink url:string expires_in:int32 = UserLink;


//@class InputInlineQueryResult @description Represents a single result of an inline query; for bots only

//@description Represents a link to an animated GIF or an animated (i.e., without sound) H.264/MPEG-4 AVC video
//@id Unique identifier of the query result
//@title Title of the query result
//@thumbnail_url URL of the result thumbnail (JPEG, GIF, or MPEG4), if it exists
//@thumbnail_mime_type MIME type of the video thumbnail. If non-empty, must be one of "image/jpeg", "image/gif" and "video/mp4"
//@video_url The URL of the video file (file size must not exceed 1MB)
//@video_mime_type MIME type of the video file. Must be one of "image/gif" and "video/mp4"
//@video_duration Duration of the video, in seconds
//@video_width Width of the video
//@video_height Height of the video
//@reply_markup The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
//@input_message_content The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageAnimation, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
inputInlineQueryResultAnimation id:string title:string thumbnail_url:string thumbnail_mime_type:string video_url:string video_mime_type:string video_duration:int32 video_width:int32 video_height:int32 reply_markup:ReplyMarkup input_message_content:InputMessageContent = InputInlineQueryResult;

//@description Represents a link to an article or web page
//@id Unique identifier of the query result
//@url URL of the result, if it exists
//@hide_url True, if the URL must be not shown
//@title Title of the result
//@param_description A short description of the result
//@thumbnail_url URL of the result thumbnail, if it exists
//@thumbnail_width Thumbnail width, if known
//@thumbnail_height Thumbnail height, if known
//@reply_markup The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
//@input_message_content The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
inputInlineQueryResultArticle id:string url:string hide_url:Bool title:string description:string thumbnail_url:string thumbnail_width:int32 thumbnail_height:int32 reply_markup:ReplyMarkup input_message_content:InputMessageContent = InputInlineQueryResult;

//@description Represents a link to an MP3 audio file
//@id Unique identifier of the query result
//@title Title of the audio file
//@performer Performer of the audio file
//@audio_url The URL of the audio file
//@audio_duration Audio file duration, in seconds
//@reply_markup The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
//@input_message_content The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageAudio, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
inputInlineQueryResultAudio id:string title:string performer:string audio_url:string audio_duration:int32 reply_markup:ReplyMarkup input_message_content:InputMessageContent = InputInlineQueryResult;

//@description Represents a user contact
//@id Unique identifier of the query result
//@contact User contact
//@thumbnail_url URL of the result thumbnail, if it exists
//@thumbnail_width Thumbnail width, if known
//@thumbnail_height Thumbnail height, if known
//@reply_markup The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
//@input_message_content The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
inputInlineQueryResultContact id:string contact:contact thumbnail_url:string thumbnail_width:int32 thumbnail_height:int32 reply_markup:ReplyMarkup input_message_content:InputMessageContent = InputInlineQueryResult;

//@description Represents a link to a file
//@id Unique identifier of the query result
//@title Title of the resulting file
//@param_description Short description of the result, if known
//@document_url URL of the file
//@mime_type MIME type of the file content; only "application/pdf" and "application/zip" are currently allowed
//@thumbnail_url The URL of the file thumbnail, if it exists
//@thumbnail_width Width of the thumbnail
//@thumbnail_height Height of the thumbnail
//@reply_markup The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
//@input_message_content The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageDocument, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
inputInlineQueryResultDocument id:string title:string description:string document_url:string mime_type:string thumbnail_url:string thumbnail_width:int32 thumbnail_height:int32 reply_markup:ReplyMarkup input_message_content:InputMessageContent = InputInlineQueryResult;

//@description Represents a game
//@id Unique identifier of the query result
//@game_short_name Short name of the game
//@reply_markup The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
inputInlineQueryResultGame id:string game_short_name:string reply_markup:ReplyMarkup = InputInlineQueryResult;

//@description Represents a point on the map
//@id Unique identifier of the query result
//@location Location result
//@live_period Amount of time relative to the message sent time until the location can be updated, in seconds
//@title Title of the result
//@thumbnail_url URL of the result thumbnail, if it exists
//@thumbnail_width Thumbnail width, if known
//@thumbnail_height Thumbnail height, if known
//@reply_markup The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
//@input_message_content The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
inputInlineQueryResultLocation id:string location:location live_period:int32 title:string thumbnail_url:string thumbnail_width:int32 thumbnail_height:int32 reply_markup:ReplyMarkup input_message_content:InputMessageContent = InputInlineQueryResult;

//@description Represents link to a JPEG image
//@id Unique identifier of the query result
//@title Title of the result, if known
//@param_description A short description of the result, if known
//@thumbnail_url URL of the photo thumbnail, if it exists
//@photo_url The URL of the JPEG photo (photo size must not exceed 5MB)
//@photo_width Width of the photo
//@photo_height Height of the photo
//@reply_markup The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
//@input_message_content The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessagePhoto, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
inputInlineQueryResultPhoto id:string title:string description:string thumbnail_url:string photo_url:string photo_width:int32 photo_height:int32 reply_markup:ReplyMarkup input_message_content:InputMessageContent = InputInlineQueryResult;

//@description Represents a link to a WEBP, TGS, or WEBM sticker
//@id Unique identifier of the query result
//@thumbnail_url URL of the sticker thumbnail, if it exists
//@sticker_url The URL of the WEBP, TGS, or WEBM sticker (sticker file size must not exceed 5MB)
//@sticker_width Width of the sticker
//@sticker_height Height of the sticker
//@reply_markup The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
//@input_message_content The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageSticker, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
inputInlineQueryResultSticker id:string thumbnail_url:string sticker_url:string sticker_width:int32 sticker_height:int32 reply_markup:ReplyMarkup input_message_content:InputMessageContent = InputInlineQueryResult;

//@description Represents information about a venue
//@id Unique identifier of the query result
//@venue Venue result
//@thumbnail_url URL of the result thumbnail, if it exists
//@thumbnail_width Thumbnail width, if known
//@thumbnail_height Thumbnail height, if known
//@reply_markup The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
//@input_message_content The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
inputInlineQueryResultVenue id:string venue:venue thumbnail_url:string thumbnail_width:int32 thumbnail_height:int32 reply_markup:ReplyMarkup input_message_content:InputMessageContent = InputInlineQueryResult;

//@description Represents a link to a page containing an embedded video player or a video file
//@id Unique identifier of the query result
//@title Title of the result
//@param_description A short description of the result, if known
//@thumbnail_url The URL of the video thumbnail (JPEG), if it exists
//@video_url URL of the embedded video player or video file
//@mime_type MIME type of the content of the video URL, only "text/html" or "video/mp4" are currently supported
//@video_width Width of the video
//@video_height Height of the video
//@video_duration Video duration, in seconds
//@reply_markup The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
//@input_message_content The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageVideo, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
inputInlineQueryResultVideo id:string title:string description:string thumbnail_url:string video_url:string mime_type:string video_width:int32 video_height:int32 video_duration:int32 reply_markup:ReplyMarkup input_message_content:InputMessageContent = InputInlineQueryResult;

//@description Represents a link to an opus-encoded audio file within an OGG container, single channel audio
//@id Unique identifier of the query result
//@title Title of the voice note
//@voice_note_url The URL of the voice note file
//@voice_note_duration Duration of the voice note, in seconds
//@reply_markup The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
//@input_message_content The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageVoiceNote, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
inputInlineQueryResultVoiceNote id:string title:string voice_note_url:string voice_note_duration:int32 reply_markup:ReplyMarkup input_message_content:InputMessageContent = InputInlineQueryResult;


//@class InlineQueryResult @description Represents a single result of an inline query

//@description Represents a link to an article or web page
//@id Unique identifier of the query result
//@url URL of the result, if it exists
//@hide_url True, if the URL must be not shown
//@title Title of the result
//@param_description A short description of the result
//@thumbnail Result thumbnail in JPEG format; may be null
inlineQueryResultArticle id:string url:string hide_url:Bool title:string description:string thumbnail:thumbnail = InlineQueryResult;

//@description Represents a user contact
//@id Unique identifier of the query result
//@contact A user contact
//@thumbnail Result thumbnail in JPEG format; may be null
inlineQueryResultContact id:string contact:contact thumbnail:thumbnail = InlineQueryResult;

//@description Represents a point on the map
//@id Unique identifier of the query result
//@location Location result
//@title Title of the result
//@thumbnail Result thumbnail in JPEG format; may be null
inlineQueryResultLocation id:string location:location title:string thumbnail:thumbnail = InlineQueryResult;

//@description Represents information about a venue
//@id Unique identifier of the query result
//@venue Venue result
//@thumbnail Result thumbnail in JPEG format; may be null
inlineQueryResultVenue id:string venue:venue thumbnail:thumbnail = InlineQueryResult;

//@description Represents information about a game
//@id Unique identifier of the query result
//@game Game result
inlineQueryResultGame id:string game:game = InlineQueryResult;

//@description Represents an animation file
//@id Unique identifier of the query result
//@animation Animation file
//@title Animation title
inlineQueryResultAnimation id:string animation:animation title:string = InlineQueryResult;

//@description Represents an audio file
//@id Unique identifier of the query result
//@audio Audio file
inlineQueryResultAudio id:string audio:audio = InlineQueryResult;

//@description Represents a document
//@id Unique identifier of the query result
//@document Document
//@title Document title
//@param_description Document description
inlineQueryResultDocument id:string document:document title:string description:string = InlineQueryResult;

//@description Represents a photo
//@id Unique identifier of the query result
//@photo Photo
//@title Title of the result, if known
//@param_description A short description of the result, if known
inlineQueryResultPhoto id:string photo:photo title:string description:string = InlineQueryResult;

//@description Represents a sticker
//@id Unique identifier of the query result
//@sticker Sticker
inlineQueryResultSticker id:string sticker:sticker = InlineQueryResult;

//@description Represents a video
//@id Unique identifier of the query result
//@video Video
//@title Title of the video
//@param_description Description of the video
inlineQueryResultVideo id:string video:video title:string description:string = InlineQueryResult;

//@description Represents a voice note
//@id Unique identifier of the query result
//@voice_note Voice note
//@title Title of the voice note
inlineQueryResultVoiceNote id:string voice_note:voiceNote title:string = InlineQueryResult;


//@class InlineQueryResultsButtonType @description Represents a type of a button in results of inline query

//@description Describes the button that opens a private chat with the bot and sends a start message to the bot with the given parameter @parameter The parameter for the bot start message
inlineQueryResultsButtonTypeStartBot parameter:string = InlineQueryResultsButtonType;

//@description Describes the button that opens a Web App by calling getWebAppUrl @url An HTTP URL to pass to getWebAppUrl
inlineQueryResultsButtonTypeWebApp url:string = InlineQueryResultsButtonType;


//@description Represents a button to be shown above inline query results @text The text of the button @type Type of the button
inlineQueryResultsButton text:string type:InlineQueryResultsButtonType = InlineQueryResultsButton;


//@description Represents the results of the inline query. Use sendInlineQueryResultMessage to send the result of the query
//@inline_query_id Unique identifier of the inline query
//@button Button to be shown above inline query results; may be null
//@results Results of the query
//@next_offset The offset for the next request. If empty, there are no more results
inlineQueryResults inline_query_id:int64 button:inlineQueryResultsButton results:vector<InlineQueryResult> next_offset:string = InlineQueryResults;


//@class CallbackQueryPayload @description Represents a payload of a callback query

//@description The payload for a general callback button @data Data that was attached to the callback button
callbackQueryPayloadData data:bytes = CallbackQueryPayload;

//@description The payload for a callback button requiring password @password The 2-step verification password for the current user @data Data that was attached to the callback button
callbackQueryPayloadDataWithPassword password:string data:bytes = CallbackQueryPayload;

//@description The payload for a game callback button @game_short_name A short name of the game that was attached to the callback button
callbackQueryPayloadGame game_short_name:string = CallbackQueryPayload;


//@description Contains a bot's answer to a callback query @text Text of the answer @show_alert True, if an alert must be shown to the user instead of a toast notification @url URL to be opened
callbackQueryAnswer text:string show_alert:Bool url:string = CallbackQueryAnswer;


//@description Contains the result of a custom request @result A JSON-serialized result
customRequestResult result:string = CustomRequestResult;


//@description Contains one row of the game high score table @position Position in the high score table @user_id User identifier @score User score
gameHighScore position:int32 user_id:int53 score:int32 = GameHighScore;

//@description Contains a list of game high scores @scores A list of game high scores
gameHighScores scores:vector<gameHighScore> = GameHighScores;


//@class ChatEventAction @description Represents a chat event

//@description A message was edited @old_message The original message before the edit @new_message The message after it was edited
chatEventMessageEdited old_message:message new_message:message = ChatEventAction;

//@description A message was deleted @message Deleted message @can_report_anti_spam_false_positive True, if the message deletion can be reported via reportSupergroupAntiSpamFalsePositive
chatEventMessageDeleted message:message can_report_anti_spam_false_positive:Bool = ChatEventAction;

//@description A message was pinned @message Pinned message
chatEventMessagePinned message:message = ChatEventAction;

//@description A message was unpinned @message Unpinned message
chatEventMessageUnpinned message:message = ChatEventAction;

//@description A poll in a message was stopped @message The message with the poll
chatEventPollStopped message:message = ChatEventAction;

//@description A new member joined the chat
chatEventMemberJoined = ChatEventAction;

//@description A new member joined the chat via an invite link @invite_link Invite link used to join the chat
chatEventMemberJoinedByInviteLink invite_link:chatInviteLink = ChatEventAction;

//@description A new member was accepted to the chat by an administrator @approver_user_id User identifier of the chat administrator, approved user join request @invite_link Invite link used to join the chat; may be null
chatEventMemberJoinedByRequest approver_user_id:int53 invite_link:chatInviteLink = ChatEventAction;

//@description A new chat member was invited @user_id New member user identifier @status New member status
chatEventMemberInvited user_id:int53 status:ChatMemberStatus = ChatEventAction;

//@description A member left the chat
chatEventMemberLeft = ChatEventAction;

//@description A chat member has gained/lost administrator status, or the list of their administrator privileges has changed @user_id Affected chat member user identifier @old_status Previous status of the chat member @new_status New status of the chat member
chatEventMemberPromoted user_id:int53 old_status:ChatMemberStatus new_status:ChatMemberStatus = ChatEventAction;

//@description A chat member was restricted/unrestricted or banned/unbanned, or the list of their restrictions has changed @member_id Affected chat member identifier @old_status Previous status of the chat member @new_status New status of the chat member
chatEventMemberRestricted member_id:MessageSender old_status:ChatMemberStatus new_status:ChatMemberStatus = ChatEventAction;

//@description The chat available reactions were changed @old_available_reactions Previous chat available reactions @new_available_reactions New chat available reactions
chatEventAvailableReactionsChanged old_available_reactions:ChatAvailableReactions new_available_reactions:ChatAvailableReactions = ChatEventAction;

//@description The chat description was changed @old_description Previous chat description @new_description New chat description
chatEventDescriptionChanged old_description:string new_description:string = ChatEventAction;

//@description The linked chat of a supergroup was changed @old_linked_chat_id Previous supergroup linked chat identifier @new_linked_chat_id New supergroup linked chat identifier
chatEventLinkedChatChanged old_linked_chat_id:int53 new_linked_chat_id:int53 = ChatEventAction;

//@description The supergroup location was changed @old_location Previous location; may be null @new_location New location; may be null
chatEventLocationChanged old_location:chatLocation new_location:chatLocation = ChatEventAction;

//@description The message auto-delete timer was changed @old_message_auto_delete_time Previous value of message_auto_delete_time @new_message_auto_delete_time New value of message_auto_delete_time
chatEventMessageAutoDeleteTimeChanged old_message_auto_delete_time:int32 new_message_auto_delete_time:int32 = ChatEventAction;

//@description The chat permissions was changed @old_permissions Previous chat permissions @new_permissions New chat permissions
chatEventPermissionsChanged old_permissions:chatPermissions new_permissions:chatPermissions = ChatEventAction;

//@description The chat photo was changed @old_photo Previous chat photo value; may be null @new_photo New chat photo value; may be null
chatEventPhotoChanged old_photo:chatPhoto new_photo:chatPhoto = ChatEventAction;

//@description The slow_mode_delay setting of a supergroup was changed @old_slow_mode_delay Previous value of slow_mode_delay, in seconds @new_slow_mode_delay New value of slow_mode_delay, in seconds
chatEventSlowModeDelayChanged old_slow_mode_delay:int32 new_slow_mode_delay:int32 = ChatEventAction;

//@description The supergroup sticker set was changed @old_sticker_set_id Previous identifier of the chat sticker set; 0 if none @new_sticker_set_id New identifier of the chat sticker set; 0 if none
chatEventStickerSetChanged old_sticker_set_id:int64 new_sticker_set_id:int64 = ChatEventAction;

//@description The chat title was changed @old_title Previous chat title @new_title New chat title
chatEventTitleChanged old_title:string new_title:string = ChatEventAction;

//@description The chat editable username was changed @old_username Previous chat username @new_username New chat username
chatEventUsernameChanged old_username:string new_username:string = ChatEventAction;

//@description The chat active usernames were changed @old_usernames Previous list of active usernames @new_usernames New list of active usernames
chatEventActiveUsernamesChanged old_usernames:vector<string> new_usernames:vector<string> = ChatEventAction;

//@description The has_protected_content setting of a channel was toggled @has_protected_content New value of has_protected_content
chatEventHasProtectedContentToggled has_protected_content:Bool = ChatEventAction;

//@description The can_invite_users permission of a supergroup chat was toggled @can_invite_users New value of can_invite_users permission
chatEventInvitesToggled can_invite_users:Bool = ChatEventAction;

//@description The is_all_history_available setting of a supergroup was toggled @is_all_history_available New value of is_all_history_available
chatEventIsAllHistoryAvailableToggled is_all_history_available:Bool = ChatEventAction;

//@description The has_aggressive_anti_spam_enabled setting of a supergroup was toggled @has_aggressive_anti_spam_enabled New value of has_aggressive_anti_spam_enabled
chatEventHasAggressiveAntiSpamEnabledToggled has_aggressive_anti_spam_enabled:Bool = ChatEventAction;

//@description The sign_messages setting of a channel was toggled @sign_messages New value of sign_messages
chatEventSignMessagesToggled sign_messages:Bool = ChatEventAction;

//@description A chat invite link was edited @old_invite_link Previous information about the invite link @new_invite_link New information about the invite link
chatEventInviteLinkEdited old_invite_link:chatInviteLink new_invite_link:chatInviteLink = ChatEventAction;

//@description A chat invite link was revoked @invite_link The invite link
chatEventInviteLinkRevoked invite_link:chatInviteLink = ChatEventAction;

//@description A revoked chat invite link was deleted @invite_link The invite link
chatEventInviteLinkDeleted invite_link:chatInviteLink = ChatEventAction;

//@description A video chat was created @group_call_id Identifier of the video chat. The video chat can be received through the method getGroupCall
chatEventVideoChatCreated group_call_id:int32 = ChatEventAction;

//@description A video chat was ended @group_call_id Identifier of the video chat. The video chat can be received through the method getGroupCall
chatEventVideoChatEnded group_call_id:int32 = ChatEventAction;

//@description The mute_new_participants setting of a video chat was toggled @mute_new_participants New value of the mute_new_participants setting
chatEventVideoChatMuteNewParticipantsToggled mute_new_participants:Bool = ChatEventAction;

//@description A video chat participant was muted or unmuted @participant_id Identifier of the affected group call participant @is_muted New value of is_muted
chatEventVideoChatParticipantIsMutedToggled participant_id:MessageSender is_muted:Bool = ChatEventAction;

//@description A video chat participant volume level was changed @participant_id Identifier of the affected group call participant @volume_level New value of volume_level; 1-20000 in hundreds of percents
chatEventVideoChatParticipantVolumeLevelChanged participant_id:MessageSender volume_level:int32 = ChatEventAction;

//@description The is_forum setting of a channel was toggled @is_forum New value of is_forum
chatEventIsForumToggled is_forum:Bool = ChatEventAction;

//@description A new forum topic was created @topic_info Information about the topic
chatEventForumTopicCreated topic_info:forumTopicInfo = ChatEventAction;

//@description A forum topic was edited @old_topic_info Old information about the topic @new_topic_info New information about the topic
chatEventForumTopicEdited old_topic_info:forumTopicInfo new_topic_info:forumTopicInfo = ChatEventAction;

//@description A forum topic was closed or reopened @topic_info New information about the topic
chatEventForumTopicToggleIsClosed topic_info:forumTopicInfo = ChatEventAction;

//@description The General forum topic was hidden or unhidden @topic_info New information about the topic
chatEventForumTopicToggleIsHidden topic_info:forumTopicInfo = ChatEventAction;

//@description A forum topic was deleted @topic_info Information about the topic
chatEventForumTopicDeleted topic_info:forumTopicInfo = ChatEventAction;

//@description A pinned forum topic was changed @old_topic_info Information about the old pinned topic; may be null @new_topic_info Information about the new pinned topic; may be null
chatEventForumTopicPinned old_topic_info:forumTopicInfo new_topic_info:forumTopicInfo = ChatEventAction;

//@description Represents a chat event
//@id Chat event identifier
//@date Point in time (Unix timestamp) when the event happened
//@member_id Identifier of the user or chat who performed the action
//@action The action
chatEvent id:int64 date:int32 member_id:MessageSender action:ChatEventAction = ChatEvent;

//@description Contains a list of chat events @events List of events
chatEvents events:vector<chatEvent> = ChatEvents;

//@description Represents a set of filters used to obtain a chat event log
//@message_edits True, if message edits need to be returned
//@message_deletions True, if message deletions need to be returned
//@message_pins True, if pin/unpin events need to be returned
//@member_joins True, if members joining events need to be returned
//@member_leaves True, if members leaving events need to be returned
//@member_invites True, if invited member events need to be returned
//@member_promotions True, if member promotion/demotion events need to be returned
//@member_restrictions True, if member restricted/unrestricted/banned/unbanned events need to be returned
//@info_changes True, if changes in chat information need to be returned
//@setting_changes True, if changes in chat settings need to be returned
//@invite_link_changes True, if changes to invite links need to be returned
//@video_chat_changes True, if video chat actions need to be returned
//@forum_changes True, if forum-related actions need to be returned
chatEventLogFilters message_edits:Bool message_deletions:Bool message_pins:Bool member_joins:Bool member_leaves:Bool member_invites:Bool member_promotions:Bool member_restrictions:Bool info_changes:Bool setting_changes:Bool invite_link_changes:Bool video_chat_changes:Bool forum_changes:Bool = ChatEventLogFilters;


//@class LanguagePackStringValue @description Represents the value of a string in a language pack

//@description An ordinary language pack string @value String value
languagePackStringValueOrdinary value:string = LanguagePackStringValue;

//@description A language pack string which has different forms based on the number of some object it mentions. See https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html for more information
//@zero_value Value for zero objects
//@one_value Value for one object
//@two_value Value for two objects
//@few_value Value for few objects
//@many_value Value for many objects
//@other_value Default value
languagePackStringValuePluralized zero_value:string one_value:string two_value:string few_value:string many_value:string other_value:string = LanguagePackStringValue;

//@description A deleted language pack string, the value must be taken from the built-in English language pack
languagePackStringValueDeleted = LanguagePackStringValue;


//@description Represents one language pack string @key String key @value String value; pass null if the string needs to be taken from the built-in English language pack
languagePackString key:string value:LanguagePackStringValue = LanguagePackString;

//@description Contains a list of language pack strings @strings A list of language pack strings
languagePackStrings strings:vector<languagePackString> = LanguagePackStrings;

//@description Contains information about a language pack
//@id Unique language pack identifier
//@base_language_pack_id Identifier of a base language pack; may be empty. If a string is missed in the language pack, then it must be fetched from base language pack. Unsupported in custom language packs
//@name Language name
//@native_name Name of the language in that language
//@plural_code A language code to be used to apply plural forms. See https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html for more information
//@is_official True, if the language pack is official
//@is_rtl True, if the language pack strings are RTL
//@is_beta True, if the language pack is a beta language pack
//@is_installed True, if the language pack is installed by the current user
//@total_string_count Total number of non-deleted strings from the language pack
//@translated_string_count Total number of translated strings from the language pack
//@local_string_count Total number of non-deleted strings from the language pack available locally
//@translation_url Link to language translation interface; empty for custom local language packs
languagePackInfo id:string base_language_pack_id:string name:string native_name:string plural_code:string is_official:Bool is_rtl:Bool is_beta:Bool is_installed:Bool total_string_count:int32 translated_string_count:int32 local_string_count:int32 translation_url:string = LanguagePackInfo;

//@description Contains information about the current localization target @language_packs List of available language packs for this application
localizationTargetInfo language_packs:vector<languagePackInfo> = LocalizationTargetInfo;


//@class PremiumLimitType @description Describes type of a limit, increased for Premium users

//@description The maximum number of joined supergroups and channels
premiumLimitTypeSupergroupCount = PremiumLimitType;

//@description The maximum number of pinned chats in the main chat list
premiumLimitTypePinnedChatCount = PremiumLimitType;

//@description The maximum number of created public chats
premiumLimitTypeCreatedPublicChatCount = PremiumLimitType;

//@description The maximum number of saved animations
premiumLimitTypeSavedAnimationCount = PremiumLimitType;

//@description The maximum number of favorite stickers
premiumLimitTypeFavoriteStickerCount = PremiumLimitType;

//@description The maximum number of chat filters
premiumLimitTypeChatFilterCount = PremiumLimitType;

//@description The maximum number of pinned and always included, or always excluded chats in a chat filter
premiumLimitTypeChatFilterChosenChatCount = PremiumLimitType;

//@description The maximum number of pinned chats in the archive chat list
premiumLimitTypePinnedArchivedChatCount = PremiumLimitType;

//@description The maximum length of sent media caption
premiumLimitTypeCaptionLength = PremiumLimitType;

//@description The maximum length of the user's bio
premiumLimitTypeBioLength = PremiumLimitType;


//@class PremiumFeature @description Describes a feature available to Premium users

//@description Increased limits
premiumFeatureIncreasedLimits = PremiumFeature;

//@description Increased maximum upload file size
premiumFeatureIncreasedUploadFileSize = PremiumFeature;

//@description Improved download speed
premiumFeatureImprovedDownloadSpeed = PremiumFeature;

//@description The ability to convert voice notes to text
premiumFeatureVoiceRecognition = PremiumFeature;

//@description Disabled ads
premiumFeatureDisabledAds = PremiumFeature;

//@description Allowed to use more reactions
premiumFeatureUniqueReactions = PremiumFeature;

//@description Allowed to use premium stickers with unique effects
premiumFeatureUniqueStickers = PremiumFeature;

//@description Allowed to use custom emoji stickers in message texts and captions
premiumFeatureCustomEmoji = PremiumFeature;

//@description Ability to change position of the main chat list, archive and mute all new chats from non-contacts, and completely disable notifications about the user's contacts joined Telegram
premiumFeatureAdvancedChatManagement = PremiumFeature;

//@description A badge in the user's profile
premiumFeatureProfileBadge = PremiumFeature;

//@description A emoji status shown along with the user's name
premiumFeatureEmojiStatus = PremiumFeature;

//@description Profile photo animation on message and chat screens
premiumFeatureAnimatedProfilePhoto = PremiumFeature;

//@description The ability to set a custom emoji as a forum topic icon
premiumFeatureForumTopicIcon = PremiumFeature;

//@description Allowed to set a premium application icons
premiumFeatureAppIcons = PremiumFeature;

//@description Allowed to translate chat messages real-time
premiumFeatureRealTimeChatTranslation = PremiumFeature;


//@description Contains information about a limit, increased for Premium users @type The type of the limit @default_value Default value of the limit @premium_value Value of the limit for Premium users
premiumLimit type:PremiumLimitType default_value:int32 premium_value:int32 = PremiumLimit;

//@description Contains information about features, available to Premium users
//@features The list of available features
//@limits The list of limits, increased for Premium users
//@payment_link An internal link to be opened to pay for Telegram Premium if store payment isn't possible; may be null if direct payment isn't available
premiumFeatures features:vector<PremiumFeature> limits:vector<premiumLimit> payment_link:InternalLinkType = PremiumFeatures;


//@class PremiumSource @description Describes a source from which the Premium features screen is opened

//@description A limit was exceeded @limit_type Type of the exceeded limit
premiumSourceLimitExceeded limit_type:PremiumLimitType = PremiumSource;

//@description A user tried to use a Premium feature @feature The used feature
premiumSourceFeature feature:PremiumFeature = PremiumSource;

//@description A user opened an internal link of the type internalLinkTypePremiumFeatures @referrer The referrer from the link
premiumSourceLink referrer:string = PremiumSource;

//@description A user opened the Premium features screen from settings
premiumSourceSettings = PremiumSource;


//@description Describes a promotion animation for a Premium feature @feature Premium feature @animation Promotion animation for the feature
premiumFeaturePromotionAnimation feature:PremiumFeature animation:animation = PremiumFeaturePromotionAnimation;

//@description Contains state of Telegram Premium subscription and promotion videos for Premium features
//@state Text description of the state of the current Premium subscription; may be empty if the current user has no Telegram Premium subscription
//@payment_options The list of available options for buying Telegram Premium
//@animations The list of available promotion animations for Premium features
premiumState state:formattedText payment_options:vector<premiumStatePaymentOption> animations:vector<premiumFeaturePromotionAnimation> = PremiumState;


//@class StorePaymentPurpose @description Describes a purpose of an in-store payment

//@description The user subscribed to Telegram Premium @is_restore Pass true if this is a restore of a Telegram Premium purchase; only for App Store @is_upgrade Pass true if this is an upgrade from a monthly subscription to early subscription; only for App Store
storePaymentPurposePremiumSubscription is_restore:Bool is_upgrade:Bool = StorePaymentPurpose;

//@description The user gifted Telegram Premium to another user @user_id Identifier of the user for which Premium was gifted @currency ISO 4217 currency code of the payment currency @amount Paid amount, in the smallest units of the currency
storePaymentPurposeGiftedPremium user_id:int53 currency:string amount:int53 = StorePaymentPurpose;


//@class DeviceToken @description Represents a data needed to subscribe for push notifications through registerDevice method.
//-To use specific push notification service, the correct application platform must be specified and a valid server authentication data must be uploaded at https://my.telegram.org

//@description A token for Firebase Cloud Messaging @token Device registration token; may be empty to deregister a device @encrypt True, if push notifications must be additionally encrypted
deviceTokenFirebaseCloudMessaging token:string encrypt:Bool = DeviceToken;

//@description A token for Apple Push Notification service @device_token Device token; may be empty to deregister a device @is_app_sandbox True, if App Sandbox is enabled
deviceTokenApplePush device_token:string is_app_sandbox:Bool = DeviceToken;

//@description A token for Apple Push Notification service VoIP notifications @device_token Device token; may be empty to deregister a device @is_app_sandbox True, if App Sandbox is enabled @encrypt True, if push notifications must be additionally encrypted
deviceTokenApplePushVoIP device_token:string is_app_sandbox:Bool encrypt:Bool = DeviceToken;

//@description A token for Windows Push Notification Services @access_token The access token that will be used to send notifications; may be empty to deregister a device
deviceTokenWindowsPush access_token:string = DeviceToken;

//@description A token for Microsoft Push Notification Service @channel_uri Push notification channel URI; may be empty to deregister a device
deviceTokenMicrosoftPush channel_uri:string = DeviceToken;

//@description A token for Microsoft Push Notification Service VoIP channel @channel_uri Push notification channel URI; may be empty to deregister a device
deviceTokenMicrosoftPushVoIP channel_uri:string = DeviceToken;

//@description A token for web Push API
//@endpoint Absolute URL exposed by the push service where the application server can send push messages; may be empty to deregister a device
//@p256dh_base64url Base64url-encoded P-256 elliptic curve Diffie-Hellman public key
//@auth_base64url Base64url-encoded authentication secret
deviceTokenWebPush endpoint:string p256dh_base64url:string auth_base64url:string = DeviceToken;

//@description A token for Simple Push API for Firefox OS @endpoint Absolute URL exposed by the push service where the application server can send push messages; may be empty to deregister a device
deviceTokenSimplePush endpoint:string = DeviceToken;

//@description A token for Ubuntu Push Client service @token Token; may be empty to deregister a device
deviceTokenUbuntuPush token:string = DeviceToken;

//@description A token for BlackBerry Push Service @token Token; may be empty to deregister a device
deviceTokenBlackBerryPush token:string = DeviceToken;

//@description A token for Tizen Push Service @reg_id Push service registration identifier; may be empty to deregister a device
deviceTokenTizenPush reg_id:string = DeviceToken;

//@description A token for HUAWEI Push Service @token Device registration token; may be empty to deregister a device @encrypt True, if push notifications must be additionally encrypted
deviceTokenHuaweiPush token:string encrypt:Bool = DeviceToken;


//@description Contains a globally unique push receiver identifier, which can be used to identify which account has received a push notification @id The globally unique identifier of push notification subscription
pushReceiverId id:int64 = PushReceiverId;


//@class BackgroundFill @description Describes a fill of a background

//@description Describes a solid fill of a background @color A color of the background in the RGB24 format
backgroundFillSolid color:int32 = BackgroundFill;

//@description Describes a gradient fill of a background
//@top_color A top color of the background in the RGB24 format
//@bottom_color A bottom color of the background in the RGB24 format
//@rotation_angle Clockwise rotation angle of the gradient, in degrees; 0-359. Must always be divisible by 45
backgroundFillGradient top_color:int32 bottom_color:int32 rotation_angle:int32 = BackgroundFill;

//@description Describes a freeform gradient fill of a background @colors A list of 3 or 4 colors of the freeform gradients in the RGB24 format
backgroundFillFreeformGradient colors:vector<int32> = BackgroundFill;


//@class BackgroundType @description Describes the type of a background

//@description A wallpaper in JPEG format
//@is_blurred True, if the wallpaper must be downscaled to fit in 450x450 square and then box-blurred with radius 12
//@is_moving True, if the background needs to be slightly moved when device is tilted
backgroundTypeWallpaper is_blurred:Bool is_moving:Bool = BackgroundType;

//@description A PNG or TGV (gzipped subset of SVG with MIME type "application/x-tgwallpattern") pattern to be combined with the background fill chosen by the user
//@fill Fill of the background
//@intensity Intensity of the pattern when it is shown above the filled background; 0-100.
//@is_inverted True, if the background fill must be applied only to the pattern itself. All other pixels are black in this case. For dark themes only
//@is_moving True, if the background needs to be slightly moved when device is tilted
backgroundTypePattern fill:BackgroundFill intensity:int32 is_inverted:Bool is_moving:Bool = BackgroundType;

//@description A filled background @fill The background fill
backgroundTypeFill fill:BackgroundFill = BackgroundType;


//@description Describes a chat background
//@id Unique background identifier
//@is_default True, if this is one of default backgrounds
//@is_dark True, if the background is dark and is recommended to be used with dark theme
//@name Unique background name
//@document Document with the background; may be null. Null only for filled backgrounds
//@type Type of the background
background id:int64 is_default:Bool is_dark:Bool name:string document:document type:BackgroundType = Background;

//@description Contains a list of backgrounds @backgrounds A list of backgrounds
backgrounds backgrounds:vector<background> = Backgrounds;


//@class InputBackground @description Contains information about background to set

//@description A background from a local file
//@background Background file to use. Only inputFileLocal and inputFileGenerated are supported. The file must be in JPEG format for wallpapers and in PNG format for patterns
inputBackgroundLocal background:InputFile = InputBackground;

//@description A background from the server @background_id The background identifier
inputBackgroundRemote background_id:int64 = InputBackground;


//@description Describes theme settings
//@accent_color Theme accent color in ARGB format
//@background The background to be used in chats; may be null
//@outgoing_message_fill The fill to be used as a background for outgoing messages
//@animate_outgoing_message_fill If true, the freeform gradient fill needs to be animated on every sent message
//@outgoing_message_accent_color Accent color of outgoing messages in ARGB format
themeSettings accent_color:int32 background:background outgoing_message_fill:BackgroundFill animate_outgoing_message_fill:Bool outgoing_message_accent_color:int32 = ThemeSettings;


//@description Describes a chat theme
//@name Theme name
//@light_settings Theme settings for a light chat theme
//@dark_settings Theme settings for a dark chat theme
chatTheme name:string light_settings:themeSettings dark_settings:themeSettings = ChatTheme;


//@description Contains a list of hashtags @hashtags A list of hashtags
hashtags hashtags:vector<string> = Hashtags;


//@class CanTransferOwnershipResult @description Represents result of checking whether the current session can be used to transfer a chat ownership to another user

//@description The session can be used
canTransferOwnershipResultOk = CanTransferOwnershipResult;

//@description The 2-step verification needs to be enabled first
canTransferOwnershipResultPasswordNeeded = CanTransferOwnershipResult;

//@description The 2-step verification was enabled recently, user needs to wait @retry_after Time left before the session can be used to transfer ownership of a chat, in seconds
canTransferOwnershipResultPasswordTooFresh retry_after:int32 = CanTransferOwnershipResult;

//@description The session was created recently, user needs to wait @retry_after Time left before the session can be used to transfer ownership of a chat, in seconds
canTransferOwnershipResultSessionTooFresh retry_after:int32 = CanTransferOwnershipResult;


//@class CheckChatUsernameResult @description Represents result of checking whether a username can be set for a chat

//@description The username can be set
checkChatUsernameResultOk = CheckChatUsernameResult;

//@description The username is invalid
checkChatUsernameResultUsernameInvalid = CheckChatUsernameResult;

//@description The username is occupied
checkChatUsernameResultUsernameOccupied = CheckChatUsernameResult;

//@description The username can be purchased at fragment.com
checkChatUsernameResultUsernamePurchasable = CheckChatUsernameResult;

//@description The user has too many chats with username, one of them must be made private first
checkChatUsernameResultPublicChatsTooMany = CheckChatUsernameResult;

//@description The user can't be a member of a public supergroup
checkChatUsernameResultPublicGroupsUnavailable = CheckChatUsernameResult;


//@class CheckStickerSetNameResult @description Represents result of checking whether a name can be used for a new sticker set

//@description The name can be set
checkStickerSetNameResultOk = CheckStickerSetNameResult;

//@description The name is invalid
checkStickerSetNameResultNameInvalid = CheckStickerSetNameResult;

//@description The name is occupied
checkStickerSetNameResultNameOccupied = CheckStickerSetNameResult;


//@class ResetPasswordResult @description Represents result of 2-step verification password reset

//@description The password was reset
resetPasswordResultOk = ResetPasswordResult;

//@description The password reset request is pending @pending_reset_date Point in time (Unix timestamp) after which the password can be reset immediately using resetPassword
resetPasswordResultPending pending_reset_date:int32 = ResetPasswordResult;

//@description The password reset request was declined @retry_date Point in time (Unix timestamp) when the password reset can be retried
resetPasswordResultDeclined retry_date:int32 = ResetPasswordResult;


//@class MessageFileType @description Contains information about a file with messages exported from another app

//@description The messages was exported from a private chat @name Name of the other party; may be empty if unrecognized
messageFileTypePrivate name:string = MessageFileType;

//@description The messages was exported from a group chat @title Title of the group chat; may be empty if unrecognized
messageFileTypeGroup title:string = MessageFileType;

//@description The messages was exported from a chat of unknown type
messageFileTypeUnknown = MessageFileType;


//@class PushMessageContent @description Contains content of a push message notification

//@description A general message with hidden content @is_pinned True, if the message is a pinned message with the specified content
pushMessageContentHidden is_pinned:Bool = PushMessageContent;

//@description An animation message (GIF-style). @animation Message content; may be null @caption Animation caption @is_pinned True, if the message is a pinned message with the specified content
pushMessageContentAnimation animation:animation caption:string is_pinned:Bool = PushMessageContent;

//@description An audio message @audio Message content; may be null @is_pinned True, if the message is a pinned message with the specified content
pushMessageContentAudio audio:audio is_pinned:Bool = PushMessageContent;

//@description A message with a user contact @name Contact's name @is_pinned True, if the message is a pinned message with the specified content
pushMessageContentContact name:string is_pinned:Bool = PushMessageContent;

//@description A contact has registered with Telegram
pushMessageContentContactRegistered = PushMessageContent;

//@description A document message (a general file) @document Message content; may be null @is_pinned True, if the message is a pinned message with the specified content
pushMessageContentDocument document:document is_pinned:Bool = PushMessageContent;

//@description A message with a game @title Game title, empty for pinned game message @is_pinned True, if the message is a pinned message with the specified content
pushMessageContentGame title:string is_pinned:Bool = PushMessageContent;

//@description A new high score was achieved in a game @title Game title, empty for pinned message @score New score, 0 for pinned message @is_pinned True, if the message is a pinned message with the specified content
pushMessageContentGameScore title:string score:int32 is_pinned:Bool = PushMessageContent;

//@description A message with an invoice from a bot @price Product price @is_pinned True, if the message is a pinned message with the specified content
pushMessageContentInvoice price:string is_pinned:Bool = PushMessageContent;

//@description A message with a location @is_live True, if the location is live @is_pinned True, if the message is a pinned message with the specified content
pushMessageContentLocation is_live:Bool is_pinned:Bool = PushMessageContent;

//@description A photo message
//@photo Message content; may be null
//@caption Photo caption
//@is_secret True, if the photo is secret
//@is_pinned True, if the message is a pinned message with the specified content
pushMessageContentPhoto photo:photo caption:string is_secret:Bool is_pinned:Bool = PushMessageContent;

//@description A message with a poll
//@question Poll question
//@is_regular True, if the poll is regular and not in quiz mode
//@is_pinned True, if the message is a pinned message with the specified content
pushMessageContentPoll question:string is_regular:Bool is_pinned:Bool = PushMessageContent;

//@description A screenshot of a message in the chat has been taken
pushMessageContentScreenshotTaken = PushMessageContent;

//@description A message with a sticker
//@sticker Message content; may be null
//@emoji Emoji corresponding to the sticker; may be empty
//@is_pinned True, if the message is a pinned message with the specified content
pushMessageContentSticker sticker:sticker emoji:string is_pinned:Bool = PushMessageContent;

//@description A text message @text Message text @is_pinned True, if the message is a pinned message with the specified content
pushMessageContentText text:string is_pinned:Bool = PushMessageContent;

//@description A video message
//@video Message content; may be null
//@caption Video caption
//@is_secret True, if the video is secret
//@is_pinned True, if the message is a pinned message with the specified content
pushMessageContentVideo video:video caption:string is_secret:Bool is_pinned:Bool = PushMessageContent;

//@description A video note message @video_note Message content; may be null @is_pinned True, if the message is a pinned message with the specified content
pushMessageContentVideoNote video_note:videoNote is_pinned:Bool = PushMessageContent;

//@description A voice note message @voice_note Message content; may be null @is_pinned True, if the message is a pinned message with the specified content
pushMessageContentVoiceNote voice_note:voiceNote is_pinned:Bool = PushMessageContent;

//@description A newly created basic group
pushMessageContentBasicGroupChatCreate = PushMessageContent;

//@description New chat members were invited to a group
//@member_name Name of the added member
//@is_current_user True, if the current user was added to the group
//@is_returned True, if the user has returned to the group themselves
pushMessageContentChatAddMembers member_name:string is_current_user:Bool is_returned:Bool = PushMessageContent;

//@description A chat photo was edited
pushMessageContentChatChangePhoto = PushMessageContent;

//@description A chat title was edited @title New chat title
pushMessageContentChatChangeTitle title:string = PushMessageContent;

//@description A chat theme was edited @theme_name If non-empty, name of a new theme, set for the chat. Otherwise, the chat theme was reset to the default one
pushMessageContentChatSetTheme theme_name:string = PushMessageContent;

//@description A chat member was deleted
//@member_name Name of the deleted member
//@is_current_user True, if the current user was deleted from the group
//@is_left True, if the user has left the group themselves
pushMessageContentChatDeleteMember member_name:string is_current_user:Bool is_left:Bool = PushMessageContent;

//@description A new member joined the chat via an invite link
pushMessageContentChatJoinByLink = PushMessageContent;

//@description A new member was accepted to the chat by an administrator
pushMessageContentChatJoinByRequest = PushMessageContent;

//@description A new recurrent payment was made by the current user @amount The paid amount
pushMessageContentRecurringPayment amount:string = PushMessageContent;

//@description A profile photo was suggested to the user
pushMessageContentSuggestProfilePhoto = PushMessageContent;

//@description A forwarded messages @total_count Number of forwarded messages
pushMessageContentMessageForwards total_count:int32 = PushMessageContent;

//@description A media album
//@total_count Number of messages in the album
//@has_photos True, if the album has at least one photo
//@has_videos True, if the album has at least one video file
//@has_audios True, if the album has at least one audio file
//@has_documents True, if the album has at least one document
pushMessageContentMediaAlbum total_count:int32 has_photos:Bool has_videos:Bool has_audios:Bool has_documents:Bool = PushMessageContent;


//@class NotificationType @description Contains detailed information about a notification

//@description New message was received @message The message @show_preview True, if message content must be displayed in notifications
notificationTypeNewMessage message:message show_preview:Bool = NotificationType;

//@description New secret chat was created
notificationTypeNewSecretChat = NotificationType;

//@description New call was received @call_id Call identifier
notificationTypeNewCall call_id:int32 = NotificationType;

//@description New message was received through a push notification
//@message_id The message identifier. The message will not be available in the chat history, but the ID can be used in viewMessages, or as reply_to_message_id
//@sender_id Identifier of the sender of the message. Corresponding user or chat may be inaccessible
//@sender_name Name of the sender
//@is_outgoing True, if the message is outgoing
//@content Push message content
notificationTypeNewPushMessage message_id:int53 sender_id:MessageSender sender_name:string is_outgoing:Bool content:PushMessageContent = NotificationType;


//@class NotificationGroupType @description Describes the type of notifications in a notification group

//@description A group containing notifications of type notificationTypeNewMessage and notificationTypeNewPushMessage with ordinary unread messages
notificationGroupTypeMessages = NotificationGroupType;

//@description A group containing notifications of type notificationTypeNewMessage and notificationTypeNewPushMessage with unread mentions of the current user, replies to their messages, or a pinned message
notificationGroupTypeMentions = NotificationGroupType;

//@description A group containing a notification of type notificationTypeNewSecretChat
notificationGroupTypeSecretChat = NotificationGroupType;

//@description A group containing notifications of type notificationTypeNewCall
notificationGroupTypeCalls = NotificationGroupType;


//@description Describes a notification sound in MP3 format
//@id Unique identifier of the notification sound
//@duration Duration of the sound, in seconds
//@date Point in time (Unix timestamp) when the sound was created
//@title Title of the notification sound
//@data Arbitrary data, defined while the sound was uploaded
//@sound File containing the sound
notificationSound id:int64 duration:int32 date:int32 title:string data:string sound:file = NotificationSound;

//@description Contains a list of notification sounds @notification_sounds A list of notification sounds
notificationSounds notification_sounds:vector<notificationSound> = NotificationSounds;


//@description Contains information about a notification
//@id Unique persistent identifier of this notification
//@date Notification date
//@is_silent True, if the notification was explicitly sent without sound
//@type Notification type
notification id:int32 date:int32 is_silent:Bool type:NotificationType = Notification;

//@description Describes a group of notifications
//@id Unique persistent auto-incremented from 1 identifier of the notification group
//@type Type of the group
//@chat_id Identifier of a chat to which all notifications in the group belong
//@total_count Total number of active notifications in the group
//@notifications The list of active notifications
notificationGroup id:int32 type:NotificationGroupType chat_id:int53 total_count:int32 notifications:vector<notification> = NotificationGroup;


//@class OptionValue @description Represents the value of an option

//@description Represents a boolean option @value The value of the option
optionValueBoolean value:Bool = OptionValue;

//@description Represents an unknown option or an option which has a default value
optionValueEmpty = OptionValue;

//@description Represents an integer option @value The value of the option
optionValueInteger value:int64 = OptionValue;

//@description Represents a string option @value The value of the option
optionValueString value:string = OptionValue;


//@description Represents one member of a JSON object @key Member's key @value Member's value
jsonObjectMember key:string value:JsonValue = JsonObjectMember;

//@class JsonValue @description Represents a JSON value

//@description Represents a null JSON value
jsonValueNull = JsonValue;

//@description Represents a boolean JSON value @value The value
jsonValueBoolean value:Bool = JsonValue;

//@description Represents a numeric JSON value @value The value
jsonValueNumber value:double = JsonValue;

//@description Represents a string JSON value @value The value
jsonValueString value:string = JsonValue;

//@description Represents a JSON array @values The list of array elements
jsonValueArray values:vector<JsonValue> = JsonValue;

//@description Represents a JSON object @members The list of object members
jsonValueObject members:vector<jsonObjectMember> = JsonValue;


//@class UserPrivacySettingRule @description Represents a single rule for managing privacy settings

//@description A rule to allow all users to do something
userPrivacySettingRuleAllowAll = UserPrivacySettingRule;

//@description A rule to allow all of a user's contacts to do something
userPrivacySettingRuleAllowContacts = UserPrivacySettingRule;

//@description A rule to allow certain specified users to do something @user_ids The user identifiers, total number of users in all rules must not exceed 1000
userPrivacySettingRuleAllowUsers user_ids:vector<int53> = UserPrivacySettingRule;

//@description A rule to allow all members of certain specified basic groups and supergroups to doing something @chat_ids The chat identifiers, total number of chats in all rules must not exceed 20
userPrivacySettingRuleAllowChatMembers chat_ids:vector<int53> = UserPrivacySettingRule;

//@description A rule to restrict all users from doing something
userPrivacySettingRuleRestrictAll = UserPrivacySettingRule;

//@description A rule to restrict all contacts of a user from doing something
userPrivacySettingRuleRestrictContacts = UserPrivacySettingRule;

//@description A rule to restrict all specified users from doing something @user_ids The user identifiers, total number of users in all rules must not exceed 1000
userPrivacySettingRuleRestrictUsers user_ids:vector<int53> = UserPrivacySettingRule;

//@description A rule to restrict all members of specified basic groups and supergroups from doing something @chat_ids The chat identifiers, total number of chats in all rules must not exceed 20
userPrivacySettingRuleRestrictChatMembers chat_ids:vector<int53> = UserPrivacySettingRule;

//@description A list of privacy rules. Rules are matched in the specified order. The first matched rule defines the privacy setting for a given user. If no rule matches, the action is not allowed @rules A list of rules
userPrivacySettingRules rules:vector<UserPrivacySettingRule> = UserPrivacySettingRules;

//@class UserPrivacySetting @description Describes available user privacy settings

//@description A privacy setting for managing whether the user's online status is visible
userPrivacySettingShowStatus = UserPrivacySetting;

//@description A privacy setting for managing whether the user's profile photo is visible
userPrivacySettingShowProfilePhoto = UserPrivacySetting;

//@description A privacy setting for managing whether a link to the user's account is included in forwarded messages
userPrivacySettingShowLinkInForwardedMessages = UserPrivacySetting;

//@description A privacy setting for managing whether the user's phone number is visible
userPrivacySettingShowPhoneNumber = UserPrivacySetting;

//@description A privacy setting for managing whether the user can be invited to chats
userPrivacySettingAllowChatInvites = UserPrivacySetting;

//@description A privacy setting for managing whether the user can be called
userPrivacySettingAllowCalls = UserPrivacySetting;

//@description A privacy setting for managing whether peer-to-peer connections can be used for calls
userPrivacySettingAllowPeerToPeerCalls = UserPrivacySetting;

//@description A privacy setting for managing whether the user can be found by their phone number. Checked only if the phone number is not known to the other user. Can be set only to "Allow contacts" or "Allow all"
userPrivacySettingAllowFindingByPhoneNumber = UserPrivacySetting;

//@description A privacy setting for managing whether the user can receive voice and video messages in private chats
userPrivacySettingAllowPrivateVoiceAndVideoNoteMessages = UserPrivacySetting;


//@description Contains information about the period of inactivity after which the current user's account will automatically be deleted @days Number of days of inactivity before the account will be flagged for deletion; 30-366 days
accountTtl days:int32 = AccountTtl;


//@description Contains default auto-delete timer setting for new chats @time Message auto-delete time, in seconds. If 0, then messages aren't deleted automatically
messageAutoDeleteTime time:int32 = MessageAutoDeleteTime;


//@class SessionType @description Represents the type of a session

//@description The session is running on an Android device
sessionTypeAndroid = SessionType;

//@description The session is running on a generic Apple device
sessionTypeApple = SessionType;

//@description The session is running on the Brave browser
sessionTypeBrave = SessionType;

//@description The session is running on the Chrome browser
sessionTypeChrome = SessionType;

//@description The session is running on the Edge browser
sessionTypeEdge = SessionType;

//@description The session is running on the Firefox browser
sessionTypeFirefox = SessionType;

//@description The session is running on an iPad device
sessionTypeIpad = SessionType;

//@description The session is running on an iPhone device
sessionTypeIphone = SessionType;

//@description The session is running on a Linux device
sessionTypeLinux = SessionType;

//@description The session is running on a Mac device
sessionTypeMac = SessionType;

//@description The session is running on the Opera browser
sessionTypeOpera = SessionType;

//@description The session is running on the Safari browser
sessionTypeSafari = SessionType;

//@description The session is running on an Ubuntu device
sessionTypeUbuntu = SessionType;

//@description The session is running on an unknown type of device
sessionTypeUnknown = SessionType;

//@description The session is running on the Vivaldi browser
sessionTypeVivaldi = SessionType;

//@description The session is running on a Windows device
sessionTypeWindows = SessionType;

//@description The session is running on an Xbox console
sessionTypeXbox = SessionType;


//@description Contains information about one session in a Telegram application used by the current user. Sessions must be shown to the user in the returned order
//@id Session identifier
//@is_current True, if this session is the current session
//@is_password_pending True, if a 2-step verification password is needed to complete authorization of the session
//@can_accept_secret_chats True, if incoming secret chats can be accepted by the session
//@can_accept_calls True, if incoming calls can be accepted by the session
//@type Session type based on the system and application version, which can be used to display a corresponding icon
//@api_id Telegram API identifier, as provided by the application
//@application_name Name of the application, as provided by the application
//@application_version The version of the application, as provided by the application
//@is_official_application True, if the application is an official application or uses the api_id of an official application
//@device_model Model of the device the application has been run or is running on, as provided by the application
//@platform Operating system the application has been run or is running on, as provided by the application
//@system_version Version of the operating system the application has been run or is running on, as provided by the application
//@log_in_date Point in time (Unix timestamp) when the user has logged in
//@last_active_date Point in time (Unix timestamp) when the session was last used
//@ip IP address from which the session was created, in human-readable format
//@country A two-letter country code for the country from which the session was created, based on the IP address
//@region Region code from which the session was created, based on the IP address
session id:int64 is_current:Bool is_password_pending:Bool can_accept_secret_chats:Bool can_accept_calls:Bool type:SessionType api_id:int32 application_name:string application_version:string is_official_application:Bool device_model:string platform:string system_version:string log_in_date:int32 last_active_date:int32 ip:string country:string region:string = Session;

//@description Contains a list of sessions @sessions List of sessions @inactive_session_ttl_days Number of days of inactivity before sessions will automatically be terminated; 1-366 days
sessions sessions:vector<session> inactive_session_ttl_days:int32 = Sessions;


//@description Contains information about one website the current user is logged in with Telegram
//@id Website identifier
//@domain_name The domain name of the website
//@bot_user_id User identifier of a bot linked with the website
//@browser The version of a browser used to log in
//@platform Operating system the browser is running on
//@log_in_date Point in time (Unix timestamp) when the user was logged in
//@last_active_date Point in time (Unix timestamp) when obtained authorization was last used
//@ip IP address from which the user was logged in, in human-readable format
//@location Human-readable description of a country and a region from which the user was logged in, based on the IP address
connectedWebsite id:int64 domain_name:string bot_user_id:int53 browser:string platform:string log_in_date:int32 last_active_date:int32 ip:string location:string = ConnectedWebsite;

//@description Contains a list of websites the current user is logged in with Telegram @websites List of connected websites
connectedWebsites websites:vector<connectedWebsite> = ConnectedWebsites;


//@class ChatReportReason @description Describes the reason why a chat is reported

//@description The chat contains spam messages
chatReportReasonSpam = ChatReportReason;

//@description The chat promotes violence
chatReportReasonViolence = ChatReportReason;

//@description The chat contains pornographic messages
chatReportReasonPornography = ChatReportReason;

//@description The chat has child abuse related content
chatReportReasonChildAbuse = ChatReportReason;

//@description The chat contains copyrighted content
chatReportReasonCopyright = ChatReportReason;

//@description The location-based chat is unrelated to its stated location
chatReportReasonUnrelatedLocation = ChatReportReason;

//@description The chat represents a fake account
chatReportReasonFake = ChatReportReason;

//@description The chat has illegal drugs related content
chatReportReasonIllegalDrugs = ChatReportReason;

//@description The chat contains messages with personal details
chatReportReasonPersonalDetails = ChatReportReason;

//@description A custom reason provided by the user
chatReportReasonCustom = ChatReportReason;


//@class TargetChat @description Describes the target chat to be opened

//@description The currently opened chat needs to be kept
targetChatCurrent = TargetChat;

//@description The chat needs to be chosen by the user among chats of the specified types
//@allow_user_chats True, if private chats with ordinary users are allowed
//@allow_bot_chats True, if private chats with other bots are allowed
//@allow_group_chats True, if basic group and supergroup chats are allowed
//@allow_channel_chats True, if channel chats are allowed
targetChatChosen allow_user_chats:Bool allow_bot_chats:Bool allow_group_chats:Bool allow_channel_chats:Bool = TargetChat;

//@description The chat needs to be open with the provided internal link @link An internal link pointing to the chat
targetChatInternalLink link:InternalLinkType = TargetChat;


//@class InternalLinkType @description Describes an internal https://t.me or tg: link, which must be processed by the application in a special way

//@description The link is a link to the active sessions section of the application. Use getActiveSessions to handle the link
internalLinkTypeActiveSessions = InternalLinkType;

//@description The link is a link to an attachment menu bot to be opened in the specified or a chosen chat. Process given target_chat to open the chat.
//-Then, call searchPublicChat with the given bot username, check that the user is a bot and can be added to attachment menu. Then, use getAttachmentMenuBot to receive information about the bot.
//-If the bot isn't added to attachment menu, then user needs to confirm adding the bot to attachment menu. If user confirms adding, then use toggleBotIsAddedToAttachmentMenu to add it.
//-If the attachment menu bot can't be used in the opened chat, show an error to the user. If the bot is added to attachment menu and can be used in the chat, then use openWebApp with the given URL
//@target_chat Target chat to be opened
//@bot_username Username of the bot
//@url URL to be passed to openWebApp
internalLinkTypeAttachmentMenuBot target_chat:TargetChat bot_username:string url:string = InternalLinkType;

//@description The link contains an authentication code. Call checkAuthenticationCode with the code if the current authorization state is authorizationStateWaitCode @code The authentication code
internalLinkTypeAuthenticationCode code:string = InternalLinkType;

//@description The link is a link to a background. Call searchBackground with the given background name to process the link @background_name Name of the background
internalLinkTypeBackground background_name:string = InternalLinkType;

//@description The link is a link to a Telegram bot, which is supposed to be added to a channel chat as an administrator. Call searchPublicChat with the given bot username and check that the user is a bot,
//-ask the current user to select a channel chat to add the bot to as an administrator. Then, call getChatMember to receive the current bot rights in the chat and if the bot already is an administrator,
//-check that the current user can edit its administrator rights and combine received rights with the requested administrator rights. Then, show confirmation box to the user, and call setChatMemberStatus with the chosen chat and confirmed rights
//@bot_username Username of the bot
//@administrator_rights Expected administrator rights for the bot
internalLinkTypeBotAddToChannel bot_username:string administrator_rights:chatAdministratorRights = InternalLinkType;

//@description The link is a link to a chat with a Telegram bot. Call searchPublicChat with the given bot username, check that the user is a bot, show START button in the chat with the bot,
//-and then call sendBotStartMessage with the given start parameter after the button is pressed
//@bot_username Username of the bot
//@start_parameter The parameter to be passed to sendBotStartMessage
//@autostart True, if sendBotStartMessage must be called automatically without showing the START button
internalLinkTypeBotStart bot_username:string start_parameter:string autostart:Bool = InternalLinkType;

//@description The link is a link to a Telegram bot, which is supposed to be added to a group chat. Call searchPublicChat with the given bot username, check that the user is a bot and can be added to groups,
//-ask the current user to select a basic group or a supergroup chat to add the bot to, taking into account that bots can be added to a public supergroup only by administrators of the supergroup.
//-If administrator rights are provided by the link, call getChatMember to receive the current bot rights in the chat and if the bot already is an administrator,
//-check that the current user can edit its administrator rights, combine received rights with the requested administrator rights, show confirmation box to the user,
//-and call setChatMemberStatus with the chosen chat and confirmed administrator rights. Before call to setChatMemberStatus it may be required to upgrade the chosen basic group chat to a supergroup chat.
//-Then, if start_parameter isn't empty, call sendBotStartMessage with the given start parameter and the chosen chat; otherwise, just send /start message with bot's username added to the chat.
//@bot_username Username of the bot
//@start_parameter The parameter to be passed to sendBotStartMessage
//@administrator_rights Expected administrator rights for the bot; may be null
internalLinkTypeBotStartInGroup bot_username:string start_parameter:string administrator_rights:chatAdministratorRights = InternalLinkType;

//@description The link is a link to the change phone number section of the app
internalLinkTypeChangePhoneNumber = InternalLinkType;

//@description The link is a chat invite link. Call checkChatInviteLink with the given invite link to process the link @invite_link Internal representation of the invite link
internalLinkTypeChatInvite invite_link:string = InternalLinkType;

//@description The link is a link to the default message auto-delete timer settings section of the app settings
internalLinkTypeDefaultMessageAutoDeleteTimerSettings = InternalLinkType;

//@description The link is a link to the edit profile section of the app settings
internalLinkTypeEditProfileSettings = InternalLinkType;

//@description The link is a link to the filter section of the app settings
internalLinkTypeFilterSettings = InternalLinkType;

//@description The link is a link to a game. Call searchPublicChat with the given bot username, check that the user is a bot, ask the current user to select a chat to send the game, and then call sendMessage with inputMessageGame
//@bot_username Username of the bot that owns the game
//@game_short_name Short name of the game
internalLinkTypeGame bot_username:string game_short_name:string = InternalLinkType;

//@description The link must be opened in an Instant View. Call getWebPageInstantView with the given URL to process the link @url URL to be passed to getWebPageInstantView @fallback_url An URL to open if getWebPageInstantView fails
internalLinkTypeInstantView url:string fallback_url:string = InternalLinkType;

//@description The link is a link to an invoice. Call getPaymentForm with the given invoice name to process the link @invoice_name Name of the invoice
internalLinkTypeInvoice invoice_name:string = InternalLinkType;

//@description The link is a link to a language pack. Call getLanguagePackInfo with the given language pack identifier to process the link @language_pack_id Language pack identifier
internalLinkTypeLanguagePack language_pack_id:string = InternalLinkType;

//@description The link is a link to the language section of the app settings
internalLinkTypeLanguageSettings = InternalLinkType;

//@description The link is a link to a Telegram message or a forum topic. Call getMessageLinkInfo with the given URL to process the link @url URL to be passed to getMessageLinkInfo
internalLinkTypeMessage url:string = InternalLinkType;

//@description The link contains a message draft text. A share screen needs to be shown to the user, then the chosen chat must be opened and the text is added to the input field
//@text Message draft text
//@contains_link True, if the first line of the text contains a link. If true, the input field needs to be focused and the text after the link must be selected
internalLinkTypeMessageDraft text:formattedText contains_link:Bool = InternalLinkType;

//@description The link contains a request of Telegram passport data. Call getPassportAuthorizationForm with the given parameters to process the link if the link was received from outside of the application; otherwise, ignore it
//@bot_user_id User identifier of the service's bot
//@scope Telegram Passport element types requested by the service
//@public_key Service's public key
//@nonce Unique request identifier provided by the service
//@callback_url An HTTP URL to open once the request is finished, canceled, or failed with the parameters tg_passport=success, tg_passport=cancel, or tg_passport=error&error=... respectively.
//-If empty, then onActivityResult method must be used to return response on Android, or the link tgbot{bot_user_id}://passport/success or tgbot{bot_user_id}://passport/cancel must be opened otherwise
internalLinkTypePassportDataRequest bot_user_id:int53 scope:string public_key:string nonce:string callback_url:string = InternalLinkType;

//@description The link can be used to confirm ownership of a phone number to prevent account deletion. Call sendPhoneNumberConfirmationCode with the given hash and phone number to process the link
//@hash Hash value from the link
//@phone_number Phone number value from the link
internalLinkTypePhoneNumberConfirmation hash:string phone_number:string = InternalLinkType;

//@description The link is a link to the Premium features screen of the application from which the user can subscribe to Telegram Premium. Call getPremiumFeatures with the given referrer to process the link @referrer Referrer specified in the link
internalLinkTypePremiumFeatures referrer:string = InternalLinkType;

//@description The link is a link to the privacy and security section of the app settings
internalLinkTypePrivacyAndSecuritySettings = InternalLinkType;

//@description The link is a link to a proxy. Call addProxy with the given parameters to process the link and add the proxy
//@server Proxy server IP address
//@port Proxy server port
//@type Type of the proxy
internalLinkTypeProxy server:string port:int32 type:ProxyType = InternalLinkType;

//@description The link is a link to a chat by its username. Call searchPublicChat with the given chat username to process the link @chat_username Username of the chat
internalLinkTypePublicChat chat_username:string = InternalLinkType;

//@description The link can be used to login the current user on another device, but it must be scanned from QR-code using in-app camera. An alert similar to
//-"This code can be used to allow someone to log in to your Telegram account. To confirm Telegram login, please go to Settings > Devices > Scan QR and scan the code" needs to be shown
internalLinkTypeQrCodeAuthentication = InternalLinkType;

//@description The link forces restore of App Store purchases when opened. For official iOS application only
internalLinkTypeRestorePurchases = InternalLinkType;

//@description The link is a link to application settings
internalLinkTypeSettings = InternalLinkType;

//@description The link is a link to a sticker set. Call searchStickerSet with the given sticker set name to process the link and show the sticker set
//@sticker_set_name Name of the sticker set
//@expect_custom_emoji True, if the sticker set is expected to contain custom emoji
internalLinkTypeStickerSet sticker_set_name:string expect_custom_emoji:Bool = InternalLinkType;

//@description The link is a link to a theme. TDLib has no theme support yet @theme_name Name of the theme
internalLinkTypeTheme theme_name:string = InternalLinkType;

//@description The link is a link to the theme section of the app settings
internalLinkTypeThemeSettings = InternalLinkType;

//@description The link is an unknown tg: link. Call getDeepLinkInfo to process the link @link Link to be passed to getDeepLinkInfo
internalLinkTypeUnknownDeepLink link:string = InternalLinkType;

//@description The link is a link to an unsupported proxy. An alert can be shown to the user
internalLinkTypeUnsupportedProxy = InternalLinkType;

//@description The link is a link to a user by its phone number. Call searchUserByPhoneNumber with the given phone number to process the link @phone_number Phone number of the user
internalLinkTypeUserPhoneNumber phone_number:string = InternalLinkType;

//@description The link is a link to a user by a temporary token. Call searchUserByToken with the given token to process the link @token The token
internalLinkTypeUserToken token:string = InternalLinkType;

//@description The link is a link to a video chat. Call searchPublicChat with the given chat username, and then joinGroupCall with the given invite hash to process the link
//@chat_username Username of the chat with the video chat
//@invite_hash If non-empty, invite hash to be used to join the video chat without being muted by administrators
//@is_live_stream True, if the video chat is expected to be a live stream in a channel or a broadcast group
internalLinkTypeVideoChat chat_username:string invite_hash:string is_live_stream:Bool = InternalLinkType;

//@description The link is a link to a Web App. Call searchPublicChat with the given bot username, check that the user is a bot, then call searchWebApp with the received bot and the given web_app_short_name.
//-Process received foundWebApp by showing a confirmation dialog if needed, then calling getWebAppLinkUrl and opening the returned URL
//@bot_username Username of the bot that owns the Web App
//@web_app_short_name Short name of the Web App
//@start_parameter Start parameter to be passed to getWebAppLinkUrl
internalLinkTypeWebApp bot_username:string web_app_short_name:string start_parameter:string = InternalLinkType;


//@description Contains an HTTPS link to a message in a supergroup or channel, or a forum topic @link The link @is_public True, if the link will work for non-members of the chat
messageLink link:string is_public:Bool = MessageLink;

//@description Contains information about a link to a message or a forum topic in a chat
//@is_public True, if the link is a public link for a message or a forum topic in a chat
//@chat_id If found, identifier of the chat to which the link points, 0 otherwise
//@message_thread_id If found, identifier of the message thread in which to open the message, or a forum topic to open if the message is missing
//@message If found, the linked message; may be null
//@media_timestamp Timestamp from which the video/audio/video note/voice note playing must start, in seconds; 0 if not specified. The media can be in the message content or in its web page preview
//@for_album True, if the whole media album to which the message belongs is linked
messageLinkInfo is_public:Bool chat_id:int53 message_thread_id:int53 message:message media_timestamp:int32 for_album:Bool = MessageLinkInfo;


//@description Contains a part of a file @data File bytes
filePart data:bytes = FilePart;


//@class FileType @description Represents the type of a file

//@description The data is not a file
fileTypeNone = FileType;

//@description The file is an animation
fileTypeAnimation = FileType;

//@description The file is an audio file
fileTypeAudio = FileType;

//@description The file is a document
fileTypeDocument = FileType;

//@description The file is a notification sound
fileTypeNotificationSound = FileType;

//@description The file is a photo
fileTypePhoto = FileType;

//@description The file is a profile photo
fileTypeProfilePhoto = FileType;

//@description The file was sent to a secret chat (the file type is not known to the server)
fileTypeSecret = FileType;

//@description The file is a thumbnail of a file from a secret chat
fileTypeSecretThumbnail = FileType;

//@description The file is a file from Secure storage used for storing Telegram Passport files
fileTypeSecure = FileType;

//@description The file is a sticker
fileTypeSticker = FileType;

//@description The file is a thumbnail of another file
fileTypeThumbnail = FileType;

//@description The file type is not yet known
fileTypeUnknown = FileType;

//@description The file is a video
fileTypeVideo = FileType;

//@description The file is a video note
fileTypeVideoNote = FileType;

//@description The file is a voice note
fileTypeVoiceNote = FileType;

//@description The file is a wallpaper or a background pattern
fileTypeWallpaper = FileType;


//@description Contains the storage usage statistics for a specific file type
//@file_type File type
//@size Total size of the files, in bytes
//@count Total number of files
storageStatisticsByFileType file_type:FileType size:int53 count:int32 = StorageStatisticsByFileType;

//@description Contains the storage usage statistics for a specific chat
//@chat_id Chat identifier; 0 if none
//@size Total size of the files in the chat, in bytes
//@count Total number of files in the chat
//@by_file_type Statistics split by file types
storageStatisticsByChat chat_id:int53 size:int53 count:int32 by_file_type:vector<storageStatisticsByFileType> = StorageStatisticsByChat;

//@description Contains the exact storage usage statistics split by chats and file type
//@size Total size of files, in bytes
//@count Total number of files
//@by_chat Statistics split by chats
storageStatistics size:int53 count:int32 by_chat:vector<storageStatisticsByChat> = StorageStatistics;

//@description Contains approximate storage usage statistics, excluding files of unknown file type
//@files_size Approximate total size of files, in bytes
//@file_count Approximate number of files
//@database_size Size of the database
//@language_pack_database_size Size of the language pack database
//@log_size Size of the TDLib internal log
storageStatisticsFast files_size:int53 file_count:int32 database_size:int53 language_pack_database_size:int53 log_size:int53 = StorageStatisticsFast;

//@description Contains database statistics
//@statistics Database statistics in an unspecified human-readable format
databaseStatistics statistics:string = DatabaseStatistics;


//@class NetworkType @description Represents the type of a network

//@description The network is not available
networkTypeNone = NetworkType;

//@description A mobile network
networkTypeMobile = NetworkType;

//@description A mobile roaming network
networkTypeMobileRoaming = NetworkType;

//@description A Wi-Fi network
networkTypeWiFi = NetworkType;

//@description A different network type (e.g., Ethernet network)
networkTypeOther = NetworkType;


//@class NetworkStatisticsEntry @description Contains statistics about network usage

//@description Contains information about the total amount of data that was used to send and receive files
//@file_type Type of the file the data is part of; pass null if the data isn't related to files
//@network_type Type of the network the data was sent through. Call setNetworkType to maintain the actual network type
//@sent_bytes Total number of bytes sent
//@received_bytes Total number of bytes received
networkStatisticsEntryFile file_type:FileType network_type:NetworkType sent_bytes:int53 received_bytes:int53 = NetworkStatisticsEntry;

//@description Contains information about the total amount of data that was used for calls
//@network_type Type of the network the data was sent through. Call setNetworkType to maintain the actual network type
//@sent_bytes Total number of bytes sent
//@received_bytes Total number of bytes received
//@duration Total call duration, in seconds
networkStatisticsEntryCall network_type:NetworkType sent_bytes:int53 received_bytes:int53 duration:double = NetworkStatisticsEntry;

//@description A full list of available network statistic entries @since_date Point in time (Unix timestamp) from which the statistics are collected @entries Network statistics entries
networkStatistics since_date:int32 entries:vector<NetworkStatisticsEntry> = NetworkStatistics;


//@description Contains auto-download settings
//@is_auto_download_enabled True, if the auto-download is enabled
//@max_photo_file_size The maximum size of a photo file to be auto-downloaded, in bytes
//@max_video_file_size The maximum size of a video file to be auto-downloaded, in bytes
//@max_other_file_size The maximum size of other file types to be auto-downloaded, in bytes
//@video_upload_bitrate The maximum suggested bitrate for uploaded videos, in kbit/s
//@preload_large_videos True, if the beginning of video files needs to be preloaded for instant playback
//@preload_next_audio True, if the next audio track needs to be preloaded while the user is listening to an audio file
//@use_less_data_for_calls True, if "use less data for calls" option needs to be enabled
autoDownloadSettings is_auto_download_enabled:Bool max_photo_file_size:int32 max_video_file_size:int53 max_other_file_size:int53 video_upload_bitrate:int32 preload_large_videos:Bool preload_next_audio:Bool use_less_data_for_calls:Bool = AutoDownloadSettings;

//@description Contains auto-download settings presets for the current user
//@low Preset with lowest settings; supposed to be used by default when roaming
//@medium Preset with medium settings; supposed to be used by default when using mobile data
//@high Preset with highest settings; supposed to be used by default when connected on Wi-Fi
autoDownloadSettingsPresets low:autoDownloadSettings medium:autoDownloadSettings high:autoDownloadSettings = AutoDownloadSettingsPresets;


//@class AutosaveSettingsScope @description Describes scope of autosave settings

//@description Autosave settings applied to all private chats without chat-specific settings
autosaveSettingsScopePrivateChats = AutosaveSettingsScope;

//@description Autosave settings applied to all basic group and supergroup chats without chat-specific settings
autosaveSettingsScopeGroupChats = AutosaveSettingsScope;

//@description Autosave settings applied to all channel chats without chat-specific settings
autosaveSettingsScopeChannelChats = AutosaveSettingsScope;

//@description Autosave settings applied to a chat @chat_id Chat identifier
autosaveSettingsScopeChat chat_id:int53 = AutosaveSettingsScope;


//@description Contains autosave settings for an autosave settings scope
//@autosave_photos True, if photo autosave is enabled
//@autosave_videos True, if video autosave is enabled
//@max_video_file_size The maximum size of a video file to be autosaved, in bytes; 512 KB - 4000 MB
scopeAutosaveSettings autosave_photos:Bool autosave_videos:Bool max_video_file_size:int53 = ScopeAutosaveSettings;

//@description Contains autosave settings for a chat, which overrides default settings for the corresponding scope
//@chat_id Chat identifier
//@settings Autosave settings for the chat
autosaveSettingsException chat_id:int53 settings:scopeAutosaveSettings = AutosaveSettingsException;

//@description Describes autosave settings
//@private_chat_settings Default autosave settings for private chats
//@group_settings Default autosave settings for basic group and supergroup chats
//@channel_settings Default autosave settings for channel chats
//@exceptions Autosave settings for specific chats
autosaveSettings private_chat_settings:scopeAutosaveSettings group_settings:scopeAutosaveSettings channel_settings:scopeAutosaveSettings exceptions:vector<autosaveSettingsException> = AutosaveSettings;


//@class ConnectionState @description Describes the current state of the connection to Telegram servers

//@description Currently waiting for the network to become available. Use setNetworkType to change the available network type
connectionStateWaitingForNetwork = ConnectionState;

//@description Currently establishing a connection with a proxy server
connectionStateConnectingToProxy = ConnectionState;

//@description Currently establishing a connection to the Telegram servers
connectionStateConnecting = ConnectionState;

//@description Downloading data received while the application was offline
connectionStateUpdating = ConnectionState;

//@description There is a working connection to the Telegram servers
connectionStateReady = ConnectionState;


//@class TopChatCategory @description Represents the categories of chats for which a list of frequently used chats can be retrieved

//@description A category containing frequently used private chats with non-bot users
topChatCategoryUsers = TopChatCategory;

//@description A category containing frequently used private chats with bot users
topChatCategoryBots = TopChatCategory;

//@description A category containing frequently used basic groups and supergroups
topChatCategoryGroups = TopChatCategory;

//@description A category containing frequently used channels
topChatCategoryChannels = TopChatCategory;

//@description A category containing frequently used chats with inline bots sorted by their usage in inline mode
topChatCategoryInlineBots = TopChatCategory;

//@description A category containing frequently used chats used for calls
topChatCategoryCalls = TopChatCategory;

//@description A category containing frequently used chats used to forward messages
topChatCategoryForwardChats = TopChatCategory;


//@class TMeUrlType @description Describes the type of a URL linking to an internal Telegram entity

//@description A URL linking to a user @user_id Identifier of the user
tMeUrlTypeUser user_id:int53 = TMeUrlType;

//@description A URL linking to a public supergroup or channel @supergroup_id Identifier of the supergroup or channel
tMeUrlTypeSupergroup supergroup_id:int53 = TMeUrlType;

//@description A chat invite link @info Information about the chat invite link
tMeUrlTypeChatInvite info:chatInviteLinkInfo = TMeUrlType;

//@description A URL linking to a sticker set @sticker_set_id Identifier of the sticker set
tMeUrlTypeStickerSet sticker_set_id:int64 = TMeUrlType;

//@description Represents a URL linking to an internal Telegram entity @url URL @type Type of the URL
tMeUrl url:string type:TMeUrlType = TMeUrl;

//@description Contains a list of t.me URLs @urls List of URLs
tMeUrls urls:vector<tMeUrl> = TMeUrls;


//@class SuggestedAction @description Describes an action suggested to the current user

//@description Suggests the user to enable "archive_and_mute_new_chats_from_unknown_users" option
suggestedActionEnableArchiveAndMuteNewChats = SuggestedAction;

//@description Suggests the user to check whether they still remember their 2-step verification password
suggestedActionCheckPassword = SuggestedAction;

//@description Suggests the user to check whether authorization phone number is correct and change the phone number if it is inaccessible
suggestedActionCheckPhoneNumber = SuggestedAction;

//@description Suggests the user to view a hint about the meaning of one and two check marks on sent messages
suggestedActionViewChecksHint = SuggestedAction;

//@description Suggests the user to convert specified supergroup to a broadcast group @supergroup_id Supergroup identifier
suggestedActionConvertToBroadcastGroup supergroup_id:int53 = SuggestedAction;

//@description Suggests the user to set a 2-step verification password to be able to log in again
//@authorization_delay The number of days to pass between consecutive authorizations if the user declines to set password; if 0, then the user is advised to set the password for security reasons
suggestedActionSetPassword authorization_delay:int32 = SuggestedAction;

//@description Suggests the user to upgrade the Premium subscription from monthly payments to annual payments
suggestedActionUpgradePremium = SuggestedAction;

//@description Suggests the user to subscribe to the Premium subscription with annual payments
suggestedActionSubscribeToAnnualPremium = SuggestedAction;


//@description Contains a counter @count Count
count count:int32 = Count;

//@description Contains some text @text Text
text text:string = Text;

//@description Contains a value representing a number of seconds @seconds Number of seconds
seconds seconds:double = Seconds;

//@description Contains size of downloaded prefix of a file @size The prefix size, in bytes
fileDownloadedPrefixSize size:int53 = FileDownloadedPrefixSize;


//@description Contains information about a tg: deep link @text Text to be shown to the user @need_update_application True, if the user must be asked to update the application
deepLinkInfo text:formattedText need_update_application:Bool = DeepLinkInfo;


//@class TextParseMode @description Describes the way the text needs to be parsed for text entities

//@description The text uses Markdown-style formatting
//@version Version of the parser: 0 or 1 - Telegram Bot API "Markdown" parse mode, 2 - Telegram Bot API "MarkdownV2" parse mode
textParseModeMarkdown version:int32 = TextParseMode;

//@description The text uses HTML-style formatting. The same as Telegram Bot API "HTML" parse mode
textParseModeHTML = TextParseMode;


//@class ProxyType @description Describes the type of a proxy server

//@description A SOCKS5 proxy server @username Username for logging in; may be empty @password Password for logging in; may be empty
proxyTypeSocks5 username:string password:string = ProxyType;

//@description A HTTP transparent proxy server @username Username for logging in; may be empty @password Password for logging in; may be empty @http_only Pass true if the proxy supports only HTTP requests and doesn't support transparent TCP connections via HTTP CONNECT method
proxyTypeHttp username:string password:string http_only:Bool = ProxyType;

//@description An MTProto proxy server @secret The proxy's secret in hexadecimal encoding
proxyTypeMtproto secret:string = ProxyType;


//@description Contains information about a proxy server
//@id Unique identifier of the proxy
//@server Proxy server IP address
//@port Proxy server port
//@last_used_date Point in time (Unix timestamp) when the proxy was last used; 0 if never
//@is_enabled True, if the proxy is enabled now
//@type Type of the proxy
proxy id:int32 server:string port:int32 last_used_date:int32 is_enabled:Bool type:ProxyType = Proxy;

//@description Represents a list of proxy servers @proxies List of proxy servers
proxies proxies:vector<proxy> = Proxies;


//@description A sticker to be added to a sticker set
//@sticker File with the sticker; must fit in a 512x512 square. For WEBP stickers the file must be in WEBP or PNG format, which will be converted to WEBP server-side.
//-See https://core.telegram.org/animated_stickers#technical-requirements for technical requirements
//@emojis String with 1-20 emoji corresponding to the sticker
//@mask_position Position where the mask is placed; pass null if not specified
//@keywords List of up to 20 keywords with total length up to 64 characters, which can be used to find the sticker
inputSticker sticker:InputFile emojis:string mask_position:maskPosition keywords:vector<string> = InputSticker;


//@description Represents a date range @start_date Point in time (Unix timestamp) at which the date range begins @end_date Point in time (Unix timestamp) at which the date range ends
dateRange start_date:int32 end_date:int32 = DateRange;


//@description A value with information about its recent changes @value The current value @previous_value The value for the previous day @growth_rate_percentage The growth rate of the value, as a percentage
statisticalValue value:double previous_value:double growth_rate_percentage:double = StatisticalValue;


//@class StatisticalGraph @description Describes a statistical graph

//@description A graph data @json_data Graph data in JSON format @zoom_token If non-empty, a token which can be used to receive a zoomed in graph
statisticalGraphData json_data:string zoom_token:string = StatisticalGraph;

//@description The graph data to be asynchronously loaded through getStatisticalGraph @token The token to use for data loading
statisticalGraphAsync token:string = StatisticalGraph;

//@description An error message to be shown to the user instead of the graph @error_message The error message
statisticalGraphError error_message:string = StatisticalGraph;


//@description Contains statistics about interactions with a message
//@message_id Message identifier
//@view_count Number of times the message was viewed
//@forward_count Number of times the message was forwarded
chatStatisticsMessageInteractionInfo message_id:int53 view_count:int32 forward_count:int32 = ChatStatisticsMessageInteractionInfo;

//@description Contains statistics about messages sent by a user
//@user_id User identifier
//@sent_message_count Number of sent messages
//@average_character_count Average number of characters in sent messages; 0 if unknown
chatStatisticsMessageSenderInfo user_id:int53 sent_message_count:int32 average_character_count:int32 = ChatStatisticsMessageSenderInfo;

//@description Contains statistics about administrator actions done by a user
//@user_id Administrator user identifier
//@deleted_message_count Number of messages deleted by the administrator
//@banned_user_count Number of users banned by the administrator
//@restricted_user_count Number of users restricted by the administrator
chatStatisticsAdministratorActionsInfo user_id:int53 deleted_message_count:int32 banned_user_count:int32 restricted_user_count:int32 = ChatStatisticsAdministratorActionsInfo;

//@description Contains statistics about number of new members invited by a user
//@user_id User identifier
//@added_member_count Number of new members invited by the user
chatStatisticsInviterInfo user_id:int53 added_member_count:int32 = ChatStatisticsInviterInfo;


//@class ChatStatistics @description Contains a detailed statistics about a chat

//@description A detailed statistics about a supergroup chat
//@period A period to which the statistics applies
//@member_count Number of members in the chat
//@message_count Number of messages sent to the chat
//@viewer_count Number of users who viewed messages in the chat
//@sender_count Number of users who sent messages to the chat
//@member_count_graph A graph containing number of members in the chat
//@join_graph A graph containing number of members joined and left the chat
//@join_by_source_graph A graph containing number of new member joins per source
//@language_graph A graph containing distribution of active users per language
//@message_content_graph A graph containing distribution of sent messages by content type
//@action_graph A graph containing number of different actions in the chat
//@day_graph A graph containing distribution of message views per hour
//@week_graph A graph containing distribution of message views per day of week
//@top_senders List of users sent most messages in the last week
//@top_administrators List of most active administrators in the last week
//@top_inviters List of most active inviters of new members in the last week
chatStatisticsSupergroup period:dateRange member_count:statisticalValue message_count:statisticalValue viewer_count:statisticalValue sender_count:statisticalValue member_count_graph:StatisticalGraph join_graph:StatisticalGraph join_by_source_graph:StatisticalGraph language_graph:StatisticalGraph message_content_graph:StatisticalGraph action_graph:StatisticalGraph day_graph:StatisticalGraph week_graph:StatisticalGraph top_senders:vector<chatStatisticsMessageSenderInfo> top_administrators:vector<chatStatisticsAdministratorActionsInfo> top_inviters:vector<chatStatisticsInviterInfo> = ChatStatistics;

//@description A detailed statistics about a channel chat
//@period A period to which the statistics applies
//@member_count Number of members in the chat
//@mean_view_count Mean number of times the recently sent messages was viewed
//@mean_share_count Mean number of times the recently sent messages was shared
//@enabled_notifications_percentage A percentage of users with enabled notifications for the chat
//@member_count_graph A graph containing number of members in the chat
//@join_graph A graph containing number of members joined and left the chat
//@mute_graph A graph containing number of members muted and unmuted the chat
//@view_count_by_hour_graph A graph containing number of message views in a given hour in the last two weeks
//@view_count_by_source_graph A graph containing number of message views per source
//@join_by_source_graph A graph containing number of new member joins per source
//@language_graph A graph containing number of users viewed chat messages per language
//@message_interaction_graph A graph containing number of chat message views and shares
//@instant_view_interaction_graph A graph containing number of views of associated with the chat instant views
//@recent_message_interactions Detailed statistics about number of views and shares of recently sent messages
chatStatisticsChannel period:dateRange member_count:statisticalValue mean_view_count:statisticalValue mean_share_count:statisticalValue enabled_notifications_percentage:double member_count_graph:StatisticalGraph join_graph:StatisticalGraph mute_graph:StatisticalGraph view_count_by_hour_graph:StatisticalGraph view_count_by_source_graph:StatisticalGraph join_by_source_graph:StatisticalGraph language_graph:StatisticalGraph message_interaction_graph:StatisticalGraph instant_view_interaction_graph:StatisticalGraph recent_message_interactions:vector<chatStatisticsMessageInteractionInfo> = ChatStatistics;


//@description A detailed statistics about a message @message_interaction_graph A graph containing number of message views and shares
messageStatistics message_interaction_graph:StatisticalGraph = MessageStatistics;


//@description A point on a Cartesian plane @x The point's first coordinate @y The point's second coordinate
point x:double y:double = Point;


//@class VectorPathCommand @description Represents a vector path command

//@description A straight line to a given point @end_point The end point of the straight line
vectorPathCommandLine end_point:point = VectorPathCommand;

//@description A cubic Bézier curve to a given point @start_control_point The start control point of the curve @end_control_point The end control point of the curve @end_point The end point of the curve
vectorPathCommandCubicBezierCurve start_control_point:point end_control_point:point end_point:point = VectorPathCommand;


//@class BotCommandScope @description Represents the scope to which bot commands are relevant

//@description A scope covering all users
botCommandScopeDefault = BotCommandScope;

//@description A scope covering all private chats
botCommandScopeAllPrivateChats = BotCommandScope;

//@description A scope covering all group and supergroup chats
botCommandScopeAllGroupChats = BotCommandScope;

//@description A scope covering all group and supergroup chat administrators
botCommandScopeAllChatAdministrators = BotCommandScope;

//@description A scope covering all members of a chat @chat_id Chat identifier
botCommandScopeChat chat_id:int53 = BotCommandScope;

//@description A scope covering all administrators of a chat @chat_id Chat identifier
botCommandScopeChatAdministrators chat_id:int53 = BotCommandScope;

//@description A scope covering a member of a chat @chat_id Chat identifier @user_id User identifier
botCommandScopeChatMember chat_id:int53 user_id:int53 = BotCommandScope;


//@class Update @description Contains notifications about data changes

//@description The user authorization state has changed @authorization_state New authorization state
updateAuthorizationState authorization_state:AuthorizationState = Update;

//@description A new message was received; can also be an outgoing message @message The new message
updateNewMessage message:message = Update;

//@description A request to send a message has reached the Telegram server. This doesn't mean that the message will be sent successfully or even that the send message request will be processed.
//-This update will be sent only if the option "use_quick_ack" is set to true. This update may be sent multiple times for the same message
//@chat_id The chat identifier of the sent message
//@message_id A temporary message identifier
updateMessageSendAcknowledged chat_id:int53 message_id:int53 = Update;

//@description A message has been successfully sent @message The sent message. Usually only the message identifier, date, and content are changed, but almost all other fields can also change @old_message_id The previous temporary message identifier
updateMessageSendSucceeded message:message old_message_id:int53 = Update;

//@description A message failed to send. Be aware that some messages being sent can be irrecoverably deleted, in which case updateDeleteMessages will be received instead of this update
//@message The failed to send message
//@old_message_id The previous temporary message identifier
//@error_code An error code
//@error_message Error message
updateMessageSendFailed message:message old_message_id:int53 error_code:int32 error_message:string = Update;

//@description The message content has changed @chat_id Chat identifier @message_id Message identifier @new_content New message content
updateMessageContent chat_id:int53 message_id:int53 new_content:MessageContent = Update;

//@description A message was edited. Changes in the message content will come in a separate updateMessageContent
//@chat_id Chat identifier
//@message_id Message identifier
//@edit_date Point in time (Unix timestamp) when the message was edited
//@reply_markup New message reply markup; may be null
updateMessageEdited chat_id:int53 message_id:int53 edit_date:int32 reply_markup:ReplyMarkup = Update;

//@description The message pinned state was changed @chat_id Chat identifier @message_id The message identifier @is_pinned True, if the message is pinned
updateMessageIsPinned chat_id:int53 message_id:int53 is_pinned:Bool = Update;

//@description The information about interactions with a message has changed @chat_id Chat identifier @message_id Message identifier @interaction_info New information about interactions with the message; may be null
updateMessageInteractionInfo chat_id:int53 message_id:int53 interaction_info:messageInteractionInfo = Update;

//@description The message content was opened. Updates voice note messages to "listened", video note messages to "viewed" and starts the self-destruct timer @chat_id Chat identifier @message_id Message identifier
updateMessageContentOpened chat_id:int53 message_id:int53 = Update;

//@description A message with an unread mention was read @chat_id Chat identifier @message_id Message identifier @unread_mention_count The new number of unread mention messages left in the chat
updateMessageMentionRead chat_id:int53 message_id:int53 unread_mention_count:int32 = Update;

//@description The list of unread reactions added to a message was changed
//@chat_id Chat identifier
//@message_id Message identifier
//@unread_reactions The new list of unread reactions
//@unread_reaction_count The new number of messages with unread reactions left in the chat
updateMessageUnreadReactions chat_id:int53 message_id:int53 unread_reactions:vector<unreadReaction> unread_reaction_count:int32 = Update;

//@description A message with a live location was viewed. When the update is received, the application is supposed to update the live location
//@chat_id Identifier of the chat with the live location message
//@message_id Identifier of the message with live location
updateMessageLiveLocationViewed chat_id:int53 message_id:int53 = Update;

//@description A new chat has been loaded/created. This update is guaranteed to come before the chat identifier is returned to the application. The chat field changes will be reported through separate updates @chat The chat
updateNewChat chat:chat = Update;

//@description The title of a chat was changed @chat_id Chat identifier @title The new chat title
updateChatTitle chat_id:int53 title:string = Update;

//@description A chat photo was changed @chat_id Chat identifier @photo The new chat photo; may be null
updateChatPhoto chat_id:int53 photo:chatPhotoInfo = Update;

//@description Chat permissions was changed @chat_id Chat identifier @permissions The new chat permissions
updateChatPermissions chat_id:int53 permissions:chatPermissions = Update;

//@description The last message of a chat was changed. If last_message is null, then the last message in the chat became unknown. Some new unknown messages might be added to the chat in this case
//@chat_id Chat identifier
//@last_message The new last message in the chat; may be null
//@positions The new chat positions in the chat lists
updateChatLastMessage chat_id:int53 last_message:message positions:vector<chatPosition> = Update;

//@description The position of a chat in a chat list has changed. An updateChatLastMessage or updateChatDraftMessage update might be sent instead of the update
//@chat_id Chat identifier
//@position New chat position. If new order is 0, then the chat needs to be removed from the list
updateChatPosition chat_id:int53 position:chatPosition = Update;

//@description Incoming messages were read or the number of unread messages has been changed @chat_id Chat identifier @last_read_inbox_message_id Identifier of the last read incoming message @unread_count The number of unread messages left in the chat
updateChatReadInbox chat_id:int53 last_read_inbox_message_id:int53 unread_count:int32 = Update;

//@description Outgoing messages were read @chat_id Chat identifier @last_read_outbox_message_id Identifier of last read outgoing message
updateChatReadOutbox chat_id:int53 last_read_outbox_message_id:int53 = Update;

//@description The chat action bar was changed @chat_id Chat identifier @action_bar The new value of the action bar; may be null
updateChatActionBar chat_id:int53 action_bar:ChatActionBar = Update;

//@description The chat available reactions were changed @chat_id Chat identifier @available_reactions The new reactions, available in the chat
updateChatAvailableReactions chat_id:int53 available_reactions:ChatAvailableReactions = Update;

//@description A chat draft has changed. Be aware that the update may come in the currently opened chat but with old content of the draft. If the user has changed the content of the draft, this update mustn't be applied
//@chat_id Chat identifier
//@draft_message The new draft message; may be null
//@positions The new chat positions in the chat lists
updateChatDraftMessage chat_id:int53 draft_message:draftMessage positions:vector<chatPosition> = Update;

//@description The message sender that is selected to send messages in a chat has changed @chat_id Chat identifier @message_sender_id New value of message_sender_id; may be null if the user can't change message sender
updateChatMessageSender chat_id:int53 message_sender_id:MessageSender = Update;

//@description The message auto-delete or self-destruct timer setting for a chat was changed @chat_id Chat identifier @message_auto_delete_time New value of message_auto_delete_time
updateChatMessageAutoDeleteTime chat_id:int53 message_auto_delete_time:int32 = Update;

//@description Notification settings for a chat were changed @chat_id Chat identifier @notification_settings The new notification settings
updateChatNotificationSettings chat_id:int53 notification_settings:chatNotificationSettings = Update;

//@description The chat pending join requests were changed @chat_id Chat identifier @pending_join_requests The new data about pending join requests; may be null
updateChatPendingJoinRequests chat_id:int53 pending_join_requests:chatJoinRequestsInfo = Update;

//@description The default chat reply markup was changed. Can occur because new messages with reply markup were received or because an old reply markup was hidden by the user
//@chat_id Chat identifier
//@reply_markup_message_id Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat
updateChatReplyMarkup chat_id:int53 reply_markup_message_id:int53 = Update;

//@description The chat theme was changed @chat_id Chat identifier @theme_name The new name of the chat theme; may be empty if theme was reset to default
updateChatTheme chat_id:int53 theme_name:string = Update;

//@description The chat unread_mention_count has changed @chat_id Chat identifier @unread_mention_count The number of unread mention messages left in the chat
updateChatUnreadMentionCount chat_id:int53 unread_mention_count:int32 = Update;

//@description The chat unread_reaction_count has changed @chat_id Chat identifier @unread_reaction_count The number of messages with unread reactions left in the chat
updateChatUnreadReactionCount chat_id:int53 unread_reaction_count:int32 = Update;

//@description A chat video chat state has changed @chat_id Chat identifier @video_chat New value of video_chat
updateChatVideoChat chat_id:int53 video_chat:videoChat = Update;

//@description The value of the default disable_notification parameter, used when a message is sent to the chat, was changed @chat_id Chat identifier @default_disable_notification The new default_disable_notification value
updateChatDefaultDisableNotification chat_id:int53 default_disable_notification:Bool = Update;

//@description A chat content was allowed or restricted for saving @chat_id Chat identifier @has_protected_content New value of has_protected_content
updateChatHasProtectedContent chat_id:int53 has_protected_content:Bool = Update;

//@description Translation of chat messages was enabled or disabled @chat_id Chat identifier @is_translatable New value of is_translatable
updateChatIsTranslatable chat_id:int53 is_translatable:Bool = Update;

//@description A chat was marked as unread or was read @chat_id Chat identifier @is_marked_as_unread New value of is_marked_as_unread
updateChatIsMarkedAsUnread chat_id:int53 is_marked_as_unread:Bool = Update;

//@description A chat was blocked or unblocked @chat_id Chat identifier @is_blocked New value of is_blocked
updateChatIsBlocked chat_id:int53 is_blocked:Bool = Update;

//@description A chat's has_scheduled_messages field has changed @chat_id Chat identifier @has_scheduled_messages New value of has_scheduled_messages
updateChatHasScheduledMessages chat_id:int53 has_scheduled_messages:Bool = Update;

//@description The list of chat filters or a chat filter has changed @chat_filters The new list of chat filters @main_chat_list_position Position of the main chat list among chat filters, 0-based
updateChatFilters chat_filters:vector<chatFilterInfo> main_chat_list_position:int32 = Update;

//@description The number of online group members has changed. This update with non-zero number of online group members is sent only for currently opened chats.
//-There is no guarantee that it will be sent just after the number of online users has changed
//@chat_id Identifier of the chat
//@online_member_count New number of online members in the chat, or 0 if unknown
updateChatOnlineMemberCount chat_id:int53 online_member_count:int32 = Update;

//@description Basic information about a topic in a forum chat was changed @chat_id Chat identifier @info New information about the topic
updateForumTopicInfo chat_id:int53 info:forumTopicInfo = Update;

//@description Notification settings for some type of chats were updated @scope Types of chats for which notification settings were updated @notification_settings The new notification settings
updateScopeNotificationSettings scope:NotificationSettingsScope notification_settings:scopeNotificationSettings = Update;

//@description A notification was changed @notification_group_id Unique notification group identifier @notification Changed notification
updateNotification notification_group_id:int32 notification:notification = Update;

//@description A list of active notifications in a notification group has changed
//@notification_group_id Unique notification group identifier
//@type New type of the notification group
//@chat_id Identifier of a chat to which all notifications in the group belong
//@notification_settings_chat_id Chat identifier, which notification settings must be applied to the added notifications
//@notification_sound_id Identifier of the notification sound to be played; 0 if sound is disabled
//@total_count Total number of unread notifications in the group, can be bigger than number of active notifications
//@added_notifications List of added group notifications, sorted by notification ID
//@removed_notification_ids Identifiers of removed group notifications, sorted by notification ID
updateNotificationGroup notification_group_id:int32 type:NotificationGroupType chat_id:int53 notification_settings_chat_id:int53 notification_sound_id:int64 total_count:int32 added_notifications:vector<notification> removed_notification_ids:vector<int32> = Update;

//@description Contains active notifications that was shown on previous application launches. This update is sent only if the message database is used. In that case it comes once before any updateNotification and updateNotificationGroup update @groups Lists of active notification groups
updateActiveNotifications groups:vector<notificationGroup> = Update;

//@description Describes whether there are some pending notification updates. Can be used to prevent application from killing, while there are some pending notifications
//@have_delayed_notifications True, if there are some delayed notification updates, which will be sent soon
//@have_unreceived_notifications True, if there can be some yet unreceived notifications, which are being fetched from the server
updateHavePendingNotifications have_delayed_notifications:Bool have_unreceived_notifications:Bool = Update;

//@description Some messages were deleted
//@chat_id Chat identifier
//@message_ids Identifiers of the deleted messages
//@is_permanent True, if the messages are permanently deleted by a user (as opposed to just becoming inaccessible)
//@from_cache True, if the messages are deleted only from the cache and can possibly be retrieved again in the future
updateDeleteMessages chat_id:int53 message_ids:vector<int53> is_permanent:Bool from_cache:Bool = Update;

//@description A message sender activity in the chat has changed
//@chat_id Chat identifier
//@message_thread_id If not 0, a message thread identifier in which the action was performed
//@sender_id Identifier of a message sender performing the action
//@action The action
updateChatAction chat_id:int53 message_thread_id:int53 sender_id:MessageSender action:ChatAction = Update;

//@description The user went online or offline @user_id User identifier @status New status of the user
updateUserStatus user_id:int53 status:UserStatus = Update;

//@description Some data of a user has changed. This update is guaranteed to come before the user identifier is returned to the application @user New data about the user
updateUser user:user = Update;

//@description Some data of a basic group has changed. This update is guaranteed to come before the basic group identifier is returned to the application @basic_group New data about the group
updateBasicGroup basic_group:basicGroup = Update;

//@description Some data of a supergroup or a channel has changed. This update is guaranteed to come before the supergroup identifier is returned to the application @supergroup New data about the supergroup
updateSupergroup supergroup:supergroup = Update;

//@description Some data of a secret chat has changed. This update is guaranteed to come before the secret chat identifier is returned to the application @secret_chat New data about the secret chat
updateSecretChat secret_chat:secretChat = Update;

//@description Some data in userFullInfo has been changed @user_id User identifier @user_full_info New full information about the user
updateUserFullInfo user_id:int53 user_full_info:userFullInfo = Update;

//@description Some data in basicGroupFullInfo has been changed @basic_group_id Identifier of a basic group @basic_group_full_info New full information about the group
updateBasicGroupFullInfo basic_group_id:int53 basic_group_full_info:basicGroupFullInfo = Update;

//@description Some data in supergroupFullInfo has been changed @supergroup_id Identifier of the supergroup or channel @supergroup_full_info New full information about the supergroup
updateSupergroupFullInfo supergroup_id:int53 supergroup_full_info:supergroupFullInfo = Update;

//@description A service notification from the server was received. Upon receiving this the application must show a popup with the content of the notification
//@type Notification type. If type begins with "AUTH_KEY_DROP_", then two buttons "Cancel" and "Log out" must be shown under notification; if user presses the second, all local data must be destroyed using Destroy method
//@content Notification content
updateServiceNotification type:string content:MessageContent = Update;

//@description Information about a file was updated @file New data about the file
updateFile file:file = Update;

//@description The file generation process needs to be started by the application
//@generation_id Unique identifier for the generation process
//@original_path The path to a file from which a new file is generated; may be empty
//@destination_path The path to a file that must be created and where the new file is generated
//@conversion String specifying the conversion applied to the original file. If conversion is "#url#" than original_path contains an HTTP/HTTPS URL of a file, which must be downloaded by the application
updateFileGenerationStart generation_id:int64 original_path:string destination_path:string conversion:string = Update;

//@description File generation is no longer needed @generation_id Unique identifier for the generation process
updateFileGenerationStop generation_id:int64 = Update;

//@description The state of the file download list has changed
//@total_size Total size of files in the file download list, in bytes
//@total_count Total number of files in the file download list
//@downloaded_size Total downloaded size of files in the file download list, in bytes
updateFileDownloads total_size:int53 total_count:int32 downloaded_size:int53 = Update;

//@description A file was added to the file download list. This update is sent only after file download list is loaded for the first time @file_download The added file download @counts New number of being downloaded and recently downloaded files found
updateFileAddedToDownloads file_download:fileDownload counts:downloadedFileCounts = Update;

//@description A file download was changed. This update is sent only after file download list is loaded for the first time
//@file_id File identifier
//@complete_date Point in time (Unix timestamp) when the file downloading was completed; 0 if the file downloading isn't completed
//@is_paused True, if downloading of the file is paused
//@counts New number of being downloaded and recently downloaded files found
updateFileDownload file_id:int32 complete_date:int32 is_paused:Bool counts:downloadedFileCounts = Update;

//@description A file was removed from the file download list. This update is sent only after file download list is loaded for the first time @file_id File identifier @counts New number of being downloaded and recently downloaded files found
updateFileRemovedFromDownloads file_id:int32 counts:downloadedFileCounts = Update;

//@description New call was created or information about a call was updated @call New data about a call
updateCall call:call = Update;

//@description Information about a group call was updated @group_call New data about a group call
updateGroupCall group_call:groupCall = Update;

//@description Information about a group call participant was changed. The updates are sent only after the group call is received through getGroupCall and only if the call is joined or being joined
//@group_call_id Identifier of group call
//@participant New data about a participant
updateGroupCallParticipant group_call_id:int32 participant:groupCallParticipant = Update;

//@description New call signaling data arrived @call_id The call identifier @data The data
updateNewCallSignalingData call_id:int32 data:bytes = Update;

//@description Some privacy setting rules have been changed @setting The privacy setting @rules New privacy rules
updateUserPrivacySettingRules setting:UserPrivacySetting rules:userPrivacySettingRules = Update;

//@description Number of unread messages in a chat list has changed. This update is sent only if the message database is used
//@chat_list The chat list with changed number of unread messages
//@unread_count Total number of unread messages
//@unread_unmuted_count Total number of unread messages in unmuted chats
updateUnreadMessageCount chat_list:ChatList unread_count:int32 unread_unmuted_count:int32 = Update;

//@description Number of unread chats, i.e. with unread messages or marked as unread, has changed. This update is sent only if the message database is used
//@chat_list The chat list with changed number of unread messages
//@total_count Approximate total number of chats in the chat list
//@unread_count Total number of unread chats
//@unread_unmuted_count Total number of unread unmuted chats
//@marked_as_unread_count Total number of chats marked as unread
//@marked_as_unread_unmuted_count Total number of unmuted chats marked as unread
updateUnreadChatCount chat_list:ChatList total_count:int32 unread_count:int32 unread_unmuted_count:int32 marked_as_unread_count:int32 marked_as_unread_unmuted_count:int32 = Update;

//@description An option changed its value @name The option name @value The new option value
updateOption name:string value:OptionValue = Update;

//@description A sticker set has changed @sticker_set The sticker set
updateStickerSet sticker_set:stickerSet = Update;

//@description The list of installed sticker sets was updated @sticker_type Type of the affected stickers @sticker_set_ids The new list of installed ordinary sticker sets
updateInstalledStickerSets sticker_type:StickerType sticker_set_ids:vector<int64> = Update;

//@description The list of trending sticker sets was updated or some of them were viewed @sticker_type Type of the affected stickers @sticker_sets The prefix of the list of trending sticker sets with the newest trending sticker sets
updateTrendingStickerSets sticker_type:StickerType sticker_sets:trendingStickerSets = Update;

//@description The list of recently used stickers was updated @is_attached True, if the list of stickers attached to photo or video files was updated; otherwise, the list of sent stickers is updated @sticker_ids The new list of file identifiers of recently used stickers
updateRecentStickers is_attached:Bool sticker_ids:vector<int32> = Update;

//@description The list of favorite stickers was updated @sticker_ids The new list of file identifiers of favorite stickers
updateFavoriteStickers sticker_ids:vector<int32> = Update;

//@description The list of saved animations was updated @animation_ids The new list of file identifiers of saved animations
updateSavedAnimations animation_ids:vector<int32> = Update;

//@description The list of saved notifications sounds was updated. This update may not be sent until information about a notification sound was requested for the first time @notification_sound_ids The new list of identifiers of saved notification sounds
updateSavedNotificationSounds notification_sound_ids:vector<int64> = Update;

//@description The selected background has changed @for_dark_theme True, if background for dark theme has changed @background The new selected background; may be null
updateSelectedBackground for_dark_theme:Bool background:background = Update;

//@description The list of available chat themes has changed @chat_themes The new list of chat themes
updateChatThemes chat_themes:vector<chatTheme> = Update;

//@description Some language pack strings have been updated @localization_target Localization target to which the language pack belongs @language_pack_id Identifier of the updated language pack @strings List of changed language pack strings; empty if all strings have changed
updateLanguagePackStrings localization_target:string language_pack_id:string strings:vector<languagePackString> = Update;

//@description The connection state has changed. This update must be used only to show a human-readable description of the connection state @state The new connection state
updateConnectionState state:ConnectionState = Update;

//@description New terms of service must be accepted by the user. If the terms of service are declined, then the deleteAccount method must be called with the reason "Decline ToS update" @terms_of_service_id Identifier of the terms of service @terms_of_service The new terms of service
updateTermsOfService terms_of_service_id:string terms_of_service:termsOfService = Update;

//@description The list of users nearby has changed. The update is guaranteed to be sent only 60 seconds after a successful searchChatsNearby request @users_nearby The new list of users nearby
updateUsersNearby users_nearby:vector<chatNearby> = Update;

//@description The list of bots added to attachment menu has changed @bots The new list of bots added to attachment menu. The bots must not be shown on scheduled messages screen
updateAttachmentMenuBots bots:vector<attachmentMenuBot> = Update;

//@description A message was sent by an opened Web App, so the Web App needs to be closed @web_app_launch_id Identifier of Web App launch
updateWebAppMessageSent web_app_launch_id:int64 = Update;

//@description The list of active emoji reactions has changed @emojis The new list of active emoji reactions
updateActiveEmojiReactions emojis:vector<string> = Update;

//@description The type of default reaction has changed @reaction_type The new type of the default reaction
updateDefaultReactionType reaction_type:ReactionType = Update;

//@description The list of supported dice emojis has changed @emojis The new list of supported dice emojis
updateDiceEmojis emojis:vector<string> = Update;

//@description Some animated emoji message was clicked and a big animated sticker must be played if the message is visible on the screen. chatActionWatchingAnimations with the text of the message needs to be sent if the sticker is played
//@chat_id Chat identifier
//@message_id Message identifier
//@sticker The animated sticker to be played
updateAnimatedEmojiMessageClicked chat_id:int53 message_id:int53 sticker:sticker = Update;

//@description The parameters of animation search through getOption("animation_search_bot_username") bot has changed @provider Name of the animation search provider @emojis The new list of emojis suggested for searching
updateAnimationSearchParameters provider:string emojis:vector<string> = Update;

//@description The list of suggested to the user actions has changed @added_actions Added suggested actions @removed_actions Removed suggested actions
updateSuggestedActions added_actions:vector<SuggestedAction> removed_actions:vector<SuggestedAction> = Update;

//@description Adding users to a chat has failed because of their privacy settings. An invite link can be shared with the users if appropriate @chat_id Chat identifier @user_ids Identifiers of users, which weren't added because of their privacy settings
updateAddChatMembersPrivacyForbidden chat_id:int53 user_ids:vector<int53> = Update;

//@description Autosave settings for some type of chats were updated @scope Type of chats for which autosave settings were updated @settings The new autosave settings; may be null if the settings are reset to default
updateAutosaveSettings scope:AutosaveSettingsScope settings:scopeAutosaveSettings = Update;

//@description A new incoming inline query; for bots only
//@id Unique query identifier
//@sender_user_id Identifier of the user who sent the query
//@user_location User location; may be null
//@chat_type The type of the chat from which the query originated; may be null if unknown
//@query Text of the query
//@offset Offset of the first entry to return
updateNewInlineQuery id:int64 sender_user_id:int53 user_location:location chat_type:ChatType query:string offset:string = Update;

//@description The user has chosen a result of an inline query; for bots only
//@sender_user_id Identifier of the user who sent the query
//@user_location User location; may be null
//@query Text of the query
//@result_id Identifier of the chosen result
//@inline_message_id Identifier of the sent inline message, if known
updateNewChosenInlineResult sender_user_id:int53 user_location:location query:string result_id:string inline_message_id:string = Update;

//@description A new incoming callback query; for bots only
//@id Unique query identifier
//@sender_user_id Identifier of the user who sent the query
//@chat_id Identifier of the chat where the query was sent
//@message_id Identifier of the message from which the query originated
//@chat_instance Identifier that uniquely corresponds to the chat to which the message was sent
//@payload Query payload
updateNewCallbackQuery id:int64 sender_user_id:int53 chat_id:int53 message_id:int53 chat_instance:int64 payload:CallbackQueryPayload = Update;

//@description A new incoming callback query from a message sent via a bot; for bots only
//@id Unique query identifier
//@sender_user_id Identifier of the user who sent the query
//@inline_message_id Identifier of the inline message from which the query originated
//@chat_instance An identifier uniquely corresponding to the chat a message was sent to
//@payload Query payload
updateNewInlineCallbackQuery id:int64 sender_user_id:int53 inline_message_id:string chat_instance:int64 payload:CallbackQueryPayload = Update;

//@description A new incoming shipping query; for bots only. Only for invoices with flexible price
//@id Unique query identifier
//@sender_user_id Identifier of the user who sent the query
//@invoice_payload Invoice payload
//@shipping_address User shipping address
updateNewShippingQuery id:int64 sender_user_id:int53 invoice_payload:string shipping_address:address = Update;

//@description A new incoming pre-checkout query; for bots only. Contains full information about a checkout
//@id Unique query identifier
//@sender_user_id Identifier of the user who sent the query
//@currency Currency for the product price
//@total_amount Total price for the product, in the smallest units of the currency
//@invoice_payload Invoice payload
//@shipping_option_id Identifier of a shipping option chosen by the user; may be empty if not applicable
//@order_info Information about the order; may be null
updateNewPreCheckoutQuery id:int64 sender_user_id:int53 currency:string total_amount:int53 invoice_payload:bytes shipping_option_id:string order_info:orderInfo = Update;

//@description A new incoming event; for bots only @event A JSON-serialized event
updateNewCustomEvent event:string = Update;

//@description A new incoming query; for bots only @id The query identifier @data JSON-serialized query data @timeout Query timeout
updateNewCustomQuery id:int64 data:string timeout:int32 = Update;

//@description A poll was updated; for bots only @poll New data about the poll
updatePoll poll:poll = Update;

//@description A user changed the answer to a poll; for bots only @poll_id Unique poll identifier @user_id The user, who changed the answer to the poll @option_ids 0-based identifiers of answer options, chosen by the user
updatePollAnswer poll_id:int64 user_id:int53 option_ids:vector<int32> = Update;

//@description User rights changed in a chat; for bots only
//@chat_id Chat identifier
//@actor_user_id Identifier of the user, changing the rights
//@date Point in time (Unix timestamp) when the user rights was changed
//@invite_link If user has joined the chat using an invite link, the invite link; may be null
//@old_chat_member Previous chat member
//@new_chat_member New chat member
updateChatMember chat_id:int53 actor_user_id:int53 date:int32 invite_link:chatInviteLink old_chat_member:chatMember new_chat_member:chatMember = Update;

//@description A user sent a join request to a chat; for bots only
//@chat_id Chat identifier
//@request Join request
//@user_chat_id Chat identifier of the private chat with the user
//@invite_link The invite link, which was used to send join request; may be null
updateNewChatJoinRequest chat_id:int53 request:chatJoinRequest user_chat_id:int53 invite_link:chatInviteLink = Update;


//@description Contains a list of updates @updates List of updates
updates updates:vector<Update> = Updates;


//@class LogStream @description Describes a stream to which TDLib internal log is written

//@description The log is written to stderr or an OS specific log
logStreamDefault = LogStream;

//@description The log is written to a file
//@path Path to the file to where the internal TDLib log will be written
//@max_file_size The maximum size of the file to where the internal TDLib log is written before the file will automatically be rotated, in bytes
//@redirect_stderr Pass true to additionally redirect stderr to the log file. Ignored on Windows
logStreamFile path:string max_file_size:int53 redirect_stderr:Bool = LogStream;

//@description The log is written nowhere
logStreamEmpty = LogStream;


//@description Contains a TDLib internal log verbosity level @verbosity_level Log verbosity level
logVerbosityLevel verbosity_level:int32 = LogVerbosityLevel;

//@description Contains a list of available TDLib internal log tags @tags List of log tags
logTags tags:vector<string> = LogTags;


//@description Contains custom information about the user @message Information message @author Information author @date Information change date
userSupportInfo message:formattedText author:string date:int32 = UserSupportInfo;


//@description A simple object containing a number; for testing only @value Number
testInt value:int32 = TestInt;
//@description A simple object containing a string; for testing only @value String
testString value:string = TestString;
//@description A simple object containing a sequence of bytes; for testing only @value Bytes
testBytes value:bytes = TestBytes;
//@description A simple object containing a vector of numbers; for testing only @value Vector of numbers
testVectorInt value:vector<int32> = TestVectorInt;
//@description A simple object containing a vector of objects that hold a number; for testing only @value Vector of objects
testVectorIntObject value:vector<testInt> = TestVectorIntObject;
//@description A simple object containing a vector of strings; for testing only @value Vector of strings
testVectorString value:vector<string> = TestVectorString;
//@description A simple object containing a vector of objects that hold a string; for testing only @value Vector of objects
testVectorStringObject value:vector<testString> = TestVectorStringObject;
