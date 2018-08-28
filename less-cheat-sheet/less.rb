cheatsheet do
    title 'less'
    docset_file_name 'less'
    keyword 'less'
    category do
        id ''
        entry do
            name 'Show line numbers'
            notes <<-'END'
            ```
            -N
            ```

            You can type this while it's running, or on the CLI
            END
        end
        entry do
            name 'Jump to line'
            notes <<-'END'
            ```
            123g
            ```
            END
        end
    end
end
