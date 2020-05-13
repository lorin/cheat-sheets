cheatsheet do
    title 'sed'
    docset_file_name 'sed'
    keyword 'sed'
    category do
        id 'Common tasks'
        entry do
            name 'Strip leading timestamp from GitHub Actions log'
            notes <<-'END'
            ```
            sed 's/^[0-9T:.-]\{27\}Z //'
            ```
            END
        end
    end
end
