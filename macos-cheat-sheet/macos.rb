cheatsheet do
    title 'macOS'
    docset_file_name 'macOS'
    keyword 'mac'
    category do
        id 'File browsing'
        entry do
            name 'Open /usr in file browser'
            notes <<-'END'
            ```
            shift + command + g
            ```

            This will prompt you for the directory.
            END
        end
    end
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
    category do
        id 'Spotlight'
        entry do
            name 'Search from command-line'
            notes <<-'END'
            ```
            mdfind myfile.json
            ```
            END
        end
    end
    category do
        id 'System stuff'
        entry do
            name 'Restart mDNSResponder'
            notes <<-'END'
            ```
            sudo killall -TERM mDNSResponder
            ```
            END
        end
    end
end

