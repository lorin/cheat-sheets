cheatsheet do
    title 'slack'
    docset_file_name 'slack'
    keyword 'slack'
    category do
        id 'Keyboard shortcuts'
        entry do
            name 'Jump to a channel with activity'
            notes <<-'END'
            ```
            CMD K
            ```
            END
        end
        entry do
            name 'React from keyboard'
            notes <<-'END'
            ```
            +:thumbsup:
            ```
            END
        end
    end
    category do
        id 'Search'
        entry do
            name 'For a person on a day'
            notes <<-'END'
            ```
            from:lorin on:yesterday
            ```
            END
        end
    end
    category do
        id 'Commands'
        entry do
            name 'Mute the channel'
            notes <<-'END'
            ```
            /mute
            ```
            END
        end
    end
    category do
        id 'API'
        entry do
            name 'Getting an auth token for reading public history'
            notes <<-'END'
            You need an app with an associated bot.

            1. Go to <https://api.slack.com/apps>
            1. Click "Create New App" 
            1. Click "Add features and functionality"
            1. Click "Bots"
            1. Give your bot a name, click "Save Changes"
            1. Click "Basic Information" on the left.
            1. Click "Add features and functionality".
            1. Click "Permissions".
            1. Under "Scopes", choose "channels:history", "channels:read", "users::read"
            1. Click "Install app"

            That will create the bot in your Slack.

            Use the OAuth Access Token (I think the oauth acceess token is for reading, bot user for writing).

            END
        end
        entry do
            name 'Get posts: channels.history'
            notes <<-'END'
            Documented at: <https://api.slack.com/methods/channels.history>

            ```bash
            http -b https://slack.com/api/channels.history token==$SLACK_TOKEN channel==CEY6WLNSY
            ```

            ```json
            {
                "ok": true,
                "has_more": false,
                "messages": [
                    {
                        "client_msg_id": "5bff938c-4b3a-4db4-9e1b-0792ef3606ed",
                        "text": "Foo the bar!",
                        "ts": "1545259760.000400",
                        "type": "message",
                        "user": "UEYHRCKRB"
                    },
                    {
                        "subtype": "channel_join",
                        "text": "<@UEYHRCKRB> has joined the channel",
                        "ts": "1545258127.000200",
                        "type": "message",
                        "user": "UEYHRCKRB"
                    }
                ]
            }
            ```
            END
        end
        entry do
            name 'Get channel names: conversations.list'
            notes <<-'END'
            Documented at: <https://api.slack.com/methods/conversations.list>

            ```bash
            http https://slack.com/api/conversations.list token==$SLACK_TOKEN | jq '.channels[] | {id: .id, name: .name}'
            ```

            ```json
            {
              "id": "CEY6WLNSY",
              "name": "random"
            }
            {
              "id": "CEYBVB42E",
              "name": "general"
            }
            {
              "id": "CEYBVB85Q",
              "name": "stuff"
            }
            ```
            END
        end
        entry do
            name 'Get user names: users.list'
            notes <<-'END'
            Documented at: <https://api.slack.com/methods/users.list>

            ```bash
            http https://slack.com/api/users.list token==$SLACK_TOKEN | jq '.members[] | {id: .id, name: .name, real_name: .real_name}'
            ```

            ```json
            {
              "id": "USLACKBOT",
              "name": "slackbot",
              "real_name": "slackbot"
            }
            {
              "id": "UEY700U76",
              "name": "conversation_grabber",
              "real_name": "Conversation Grabber"
            }
            {
              "id": "UEYHRCKRB",
              "name": "lhochstein",
              "real_name": "Lorin Hochstein"
            }
            ```
            END
        end
    end
end
