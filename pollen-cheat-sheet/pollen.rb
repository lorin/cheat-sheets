cheatsheet do
    title 'pollen'
    docset_file_name 'pollen'
    keyword 'pollen'
    category do
        id 'Basics'
        entry do
            name 'Markdown'
            notes <<-'END'
            ```
            file.html.pmd
            ```
            END
        end

        entry do
            name 'Render'
            notes <<-'END'
            ```
            raco pollen render file.txt.pp
            ```
            END
        end
        entry do
            name 'Bring up local server'
            notes <<-'END'
            ```
            raco pollen start
            ```

            <http://localhost:8080/index.ptree>
            END
        end
        entry do
            name 'Bring up local docs'
            notes <<-'END'
            ```
            raco docs pollen
            ```
            END
        end
    end
end
