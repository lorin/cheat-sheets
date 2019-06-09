cheatsheet do
    title 'applescript'
    docset_file_name 'applescript'
    keyword 'applescript'
    category do
        id ''
        entry do
            name 'POSIX path of script file'
            notes <<-END
            ```applescript
            POSIX path of (path to me)
            ```
            END
        end
        entry do
            name 'Directory manipulation'
            notes <<-END
            ```applescript
            tell application "Finder"
                set parentDir to get POSIX path of ((container of (path to me)) as text)
                set filePath to parentDir & "slides.pdf"
            end tell
            ```
            END
        end
        entry do
            name 'She-bang'
            notes <<-END
            ```applescript
            #!/usr/bin/osascript
            tell application "Finder"
                set parentDir to get POSIX path of ((container of (path to me)) as text)
            end tell

            tell application "Deckset"
                set filePath to parentDir & "slides.pdf"
                export document 1 to filePath as "PDF"
            end tell
            ```
            END
        end
    end
end
