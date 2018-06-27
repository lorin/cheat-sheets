cheatsheet do
    title 'css'
    docset_file_name 'css'
    keyword 'css'
    category do
        id 'Tables'
        entry do
            name 'Show vertical lines'
            notes <<-'END'
            ```less
            tbody > tr > td,th {
              border-left: solid 1px;
              border-right: solid 1px;
            }
            ```
            (LESS)
            END
        end
    end
end
