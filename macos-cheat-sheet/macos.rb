cheatsheet do
    title 'macOS'
    docset_file_name 'macOS'
    keyword 'mac'
    category do
        id ''
        entry do
            name 'Mute iMessage'
            notes <<-'END'
            System preferences -> Notifications -> Messages -> None
            END
        end
    end
    category do
        id 'Keyboard'
        entry do
            name 'Screen capture'
            notes <<-'END'
            ```
            ⇧ ⌘ 4
            ```

            This is set in System Preferences > Keyboard > Shortcuts > Screen Shots.

            I like to use Monosnap as an alternative
            END
        end
    end
    category do
        id 'Text'
        entry do
            name 'Special characters'
            notes <<-'END'
            Edit -> Emoji & Symbols (^⌘ space)
            END
        end
    end
    category do
        id 'File system'
        entry do
            name 'List file metadata'
            notes <<-'END'
            To view extended attributes (e.g., as used by Deckset)

            ```
            ls -l@
            ```

            To view metadata attributes:

            ```
            mdls
            ```
            END
        end
    end
end

