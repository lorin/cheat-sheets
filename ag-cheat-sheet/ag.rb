cheatsheet do
    title 'ag'
    docset_file_name 'ag'
    keyword 'ag'
    category do
        id ''
        entry do
            name 'Ignore a directory'
            notes <<-'END'
            ```
            ag --ignore vendor WARN
            ```
            END
        end
        entry do
            name 'File names only'
            notes <<-'END'
            Use `-l`, e.g.:

            ```
            ag -l foo | xargs sed -i '' s/foo/bar/g
            ```
            END
        end
    end
end
