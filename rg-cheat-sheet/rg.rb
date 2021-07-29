cheatsheet do
    title 'ripgrep (rg)'
    docset_file_name 'rg'
    keyword 'rg'
    category do
        id 'File types'
        entry do
            name 'Match against a file type (language)'
            notes <<-'END'
            ```
            rg -t kotlin '@Test'
            ```
            END
        end
        entry do
            name 'List supported file types'
            notes <<-'END'
            ```
            rg --type-list
            ```
            END
        end
    end
end
