cheatsheet do
    title 'sql'
    docset_file_name 'sql'
    keyword 'sql'
    category do
        id 'Insertions'
        entry do
            name 'Specify columns'
            notes <<-'END'
            ```sql
            INSERT INTO mytable (colour, flavour) VALUES ('green', 'chocolate');
            ```
            END
        end
    end
    category do
        id 'Deletions'
        entry do
            name 'Delete all entries'
            notes <<-'END'
            ```sql
            DELETE from mytable
            ```
            END
        end
        entry do
            name 'Delete entries'
            notes <<-'END'
            ```sql
            DELETE from mytable WHERE column=value;
            ```
            END
        end
    end
end
