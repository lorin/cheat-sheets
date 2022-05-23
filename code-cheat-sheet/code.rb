cheatsheet do
    title 'Visual Studio Code'
    docset_file_name 'code'
    keyword 'code'
    category do
        id 'Keyboard shortcuts'
        entry do
            name 'fold'
            command '⌘ ⎇ ['
        end
        entry do
            name 'Next tab'
            command '⌘ ⎇ →'
        end
        entry do
            name 'Comand palette'
            command ' ⌘ ⇧ P'
        end
        entry do
            name 'Open file'
            command '⌘ P'
        end
        entry do
            name 'Git commit'
            command '^ ⇧ G'
        end
        entry do
            name 'Open terminal'
            command '^ `'
        end
    end
    category do
        id ''
        entry do
            name 'Format doc'
            notes <<-'END'
            Command: `Format document`

            (I use the Prettier plugin)
            END
        end
        entry do
            name 'copy with syntax higlighting'
            notes <<-'END'
            1. Highlight the code
            1. Ctrl Shift P (Command Palette)
            1. "Copy With Syntax Highlighting"
            END
        end

    end
end
