cheatsheet do
    title 'unix'
    docset_file_name 'unix'
    keyword 'unix'
    category do
        id ''
        entry do
            name 'Generate random instance id'
            notes <<-'END'
            ```bash
            printf 'i-%s' "$(xxd -l 9 -p /dev/urandom | head -c17)"
            ```
            END
        end
        entry do
            name 'Filter out characters'
            notes <<-'END'
            ```bash
            echo "Only hex allowed" | tr -dc '0-9a-f'
            ```
            END
        end
    end
end
