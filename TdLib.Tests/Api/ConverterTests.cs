// SPDX-FileCopyrightText: 2024 tdsharp contributors <https://github.com/egramtel/tdsharp>
//
// SPDX-License-Identifier: MIT

using Newtonsoft.Json;
using Xunit;
using Xunit.Sdk;

namespace TdLib.Tests.Api;

public class ConverterTests
{
    private static readonly Converter Converter = new();

    [Fact]
    public void BezierCurveDeserializedCorrectly()
    {
        var json = """
{
    "@type": "updateNewMessage",
    "message": {
        "@type": "message",
        "id": 0,
        "sender_id": {
            "@type": "messageSenderUser",
            "user_id": 0
        },
        "chat_id": 0,
        "is_outgoing": true,
        "is_pinned": false,
        "can_be_edited": false,
        "can_be_forwarded": true,
        "can_be_saved": true,
        "can_be_deleted_only_for_self": true,
        "can_be_deleted_for_all_users": false,
        "can_get_added_reactions": false,
        "can_get_statistics": false,
        "can_get_message_thread": false,
        "can_get_viewers": false,
        "can_get_media_timestamp_links": false,
        "has_timestamped_media": true,
        "is_channel_post": false,
        "contains_unread_mention": false,
        "date": 0,
        "edit_date": 0,
        "unread_reactions": [],
        "reply_in_chat_id": 0,
        "reply_to_message_id": 0,
        "message_thread_id": 0,
        "ttl": 0,
        "ttl_expires_in": 0.000000,
        "via_bot_user_id": 0,
        "author_signature": "",
        "media_album_id": "0",
        "restriction_reason": "",
        "content": {
            "@type": "messageSticker",
            "sticker": {
                "@type": "sticker",
                "set_id": "0",
                "width": 0,
                "height": 0,
                "emoji": "\ud83d\ude02",
                "type": {
                    "@type": "stickerTypeAnimated"
                },
                "outline": [
                    {
                        "@type": "closedVectorPath",
                        "commands": [
                            {
                                "@type": "vectorPathCommandCubicBezierCurve",
                                "start_control_point": {
                                    "@type": "point",
                                    "x": 223.000000,
                                    "y": 464.000000
                                },
                                "end_control_point": {
                                    "@type": "point",
                                    "x": 174.000000,
                                    "y": 431.000000
                                },
                                "end_point": {
                                    "@type": "point",
                                    "x": 133.000000,
                                    "y": 402.000000
                                }
                            }
                        ]
                    }
                ]
            }
        }
    }
}
""";
        var data = JsonConvert.DeserializeObject<TdApi.Object>(json, Converter);
        if (data is not TdApi.Update.UpdateNewMessage
            {
                Message.Content: TdApi.MessageContent.MessageSticker { Sticker: { Outline: var outline } }
            })
        {
            throw new XunitException("Data is not a properly-formed message");
        }

        var path = Assert.Single(outline);
        var curve = Assert.IsType<TdApi.VectorPathCommand.VectorPathCommandCubicBezierCurve>(Assert.Single(path.Commands));

        var startControlPoint = curve.StartControlPoint;
        var endControlPoint = curve.EndControlPoint;
        var endPoint = curve.EndPoint;

        Assert.Equal(
            new { X = 223.0, Y = 464.0 },
            new { X = startControlPoint.X!.Value, Y = startControlPoint.Y!.Value });
        Assert.Equal(
            new { X = 174.0, Y = 431.0 },
            new { X = endControlPoint.X!.Value, Y = endControlPoint.Y!.Value });
        Assert.Equal(
            new { X = 133.0, Y = 402.0 },
            new { X = endPoint.X!.Value, Y = endPoint.Y!.Value });
    }
}
