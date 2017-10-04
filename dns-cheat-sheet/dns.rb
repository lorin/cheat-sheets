cheatsheet do
    title 'dns'
    docset_file_name 'dns'
    keyword 'dns'
    category do
        id 'Client-side lookup'
        entry do
            name 'Dig (simple)'
            notes <<-'END'
            ```
            dig +short www.example.com
            ```
            END
        end
        entry do
            name 'Custom DNS server'
            notes <<-'END'
            ```
            dig +short www.example.com @8.8.8.8
            ```
            END
        end
    end
end
