cheatsheet do
    title 'ripgrep (rg)'
    docset_file_name 'rg'
    keyword 'rg'
    category do
        id 'Common tasks'
        entry do
            name 'Only show file names'
            notes <<-'END'
            ```bash
            rg --files-with-matches regular_expression
            ```
            END
        end

    end
    category do
        id 'File types'
        entry do
            name 'Match against a file type (language)'
            notes <<-'END'
            ```bash
            rg -t kotlin '@Test'
            ```
            END
        end
        entry do
            name 'List supported file types'
            notes <<-'END'
            ```bash
            rg --type-list
            ```
            END
        end
    end
end
