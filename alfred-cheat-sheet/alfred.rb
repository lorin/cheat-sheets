cheatsheet do
    title 'alfred'
    docset_file_name 'alfred'
    keyword 'alfred'
    category do
        id 'Keyboard shortcuts'
        entry do
            name 'Home directory'
            command '~'
            END
        end
        entry do
            name 'Top-level directory'
            notes <<-'END'
            ```
            /
            ```
            END
        end
    end
    category do
        id 'Common tasks'
        entry do
            name 'Launch app from custom keyword'
            notes <<-'END'
            1. `⌘ ,` to bring up settings
            1. Workflows (at the top)
            1. `+` at the bottom-left
            1. `Templates -> Files and Apps -> Launch file group from keyword`
            END
        end
        entry do
            name 'Launch app with hotkey'
            notes <<-'END'
            1. `⌘ ,` to bring up settings
            1. Workflows (at the top)
            1. `+` at the bottom-left
            1. `Templates -> Files and Apps -> Launch file group from hotkey`
            END
        end
    end
end
