cheatsheet do
    title 'alfred'
    docset_file_name 'alfred'
    keyword 'alfred'
    category do
        id 'Keyboard shortcuts'
        entry do
            name 'Home directory'
            command '~'
        end
        entry do
            name 'Top-level directory'
            notes <<-'END'
            ```
            /
            ```
            END
        end
        entry do
            name 'Find files'
            notes <<-'END'
            ```
            SPACE
            ```

            If you preface your search with space, Alfred will search files.
            END
        end
        entry do
            name 'Focus on selected item'
            notes <<-'END'
            ```
            OPT CMD \
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
        entry do
            name 'Large type'
            notes <<-'END'
            1. Type text
            2. `⌘ L`
            END
        end
    end
    category do
        id 'Integrations'
        entry do
            name 'Busycal'
            notes <<-'END'
            ```
            busy event description here
            ```

            <https://github.com/LeEnno/alfred-add-to-busycal>
            END
        end
    end
end
