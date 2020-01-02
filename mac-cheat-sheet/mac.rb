# coding: utf-8
cheatsheet do
    title 'mac'
    docset_file_name 'mac'
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
        entry do
            name 'Show hidden (dot files) files'
            notes <<-'END'
            ```
            shift + command + .
            ```

            This will reveal hidden files.
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
        entry do
            name 'Search menu items'
            notes <<-'END'
            ```
            ⇧ ⌘ /
            ```
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
        entry do
            name 'Inspect html clipboard'
            notes <<-'END'
            ```
            pbv public.html
            ```
            Requires [macos-pasteboard](https://github.com/chbrown/macos-pasteboard)
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
            name 'Set an environment variable'
            notes <<-'END'
            File: `~/Library/LaunchAgents/setenv.plist`

            Contents:

            ```xml
            <?xml version="1.0" encoding="UTF-8"?>
            <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
            <plist version="1.0">
            <dict>
              <key>Label</key>
              <string>my.startup</string>
              <key>ProgramArguments</key>
              <array>
                <string>sh</string>
                <string>-c</string>
                <string>launchctl setenv JAVA_HOME /Users/lhochstein/.sdkman/candidates/java/current</string>
              </array>
              <key>RunAtLoad</key>
              <true/>
            </dict>
            </plist>
            ```
            END
        end
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

