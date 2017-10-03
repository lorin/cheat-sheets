cheatsheet do
    title 'html'
    docset_file_name 'html'
    keyword 'html'
    category do
        id 'Tidy'
        entry do
            name 'Format an html fragment'
            notes <<-'END'
            ```
            tidy -iq -omit
            ```
            END
        end
        entry do
            name 'Install tidy'
            notes <<-'END'
            ```
            brew install tidy-html5
            ```
            END
        end
    end
end
