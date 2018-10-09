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
            name 'channels.history API'
            notes <<-'END'
            <https://api.slack.com/methods/channels.history>
            END
        end
    end
end
