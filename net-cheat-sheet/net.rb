cheatsheet do
    title 'network stuff'
    docset_file_name 'net'
    keyword 'net'
    category do
        id ''
        entry do
            name 'Who is listening on port 8080'
            notes <<-'END'
            ```
            lsof -n -iTCP:8080
            ```
            END
        end
    end
end
