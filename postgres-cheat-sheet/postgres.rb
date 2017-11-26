cheatsheet do
    title 'postgres'
    docset_file_name 'postgres'
    keyword 'postgres'
    category do
        id 'Server'
        entry do
            name 'Port'
            command "5432"
        end
    end
    category do
        id 'Client'
        entry do
            name 'Connect by host'
            notes <<-'END'
            ```
            psql -h localhost -U mezzanine
            ```
            END
        end
    end
    category do
        id 'Java'
        entry do
            name 'JDBC url'
            notes <<-'END'
            ```
            jdbc:postgresql://hostname:5432/dbname
            ```
            END
        end
    end
    category do
        id 'CLI'
        entry do
            name 'List tables'
            notes <<-'END'
            ```
            \dt
            ```
            END
        end
    end
    category do
        id 'Creating a table'
        entry do
            name 'Auto-increment primary key'
            notes <<-'END'
            ```
            CREATE TABLE widgets (
                id SERIAL PRIMARY KEY
            );
            
            ```
            END
        end
    end
end
