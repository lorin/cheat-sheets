cheatsheet do
    title 'sqlite'
    docset_file_name 'sqlite'
    keyword 'sqlite'
    category do
        id 'Commands'
        entry do
            name 'list tables'
            command '.tables'
        end
        entry do
            name 'describe schema'
            command '.schema <tablename>'
        end
    end
    category do
        id 'SQL'
        entry do
            name 'Create table'
            notes <<-'END'
            Note that SQLite tables have a `rowid` field automatically added.

            ```sql
            create table shapes (
            sides integer,
            color text
            );
            ```
            END
        end
    end
    category do
        id 'Python'
        entry do
            name "Simple creation and insert"
            notes <<-'END'
            This is [using connection as a context manager][1].

            [1]: https://docs.python.org/3/library/sqlite3.html#using-the-connection-as-a-context-manager

            ```python
            import sqlite3

            with sqlite3.connect("db.sqlite") as con:
                con.execute('create tables shapes (sides integer, color text)')

                con.execute("insert into shapes values (?,?)", (4, "square"))

            ```
            END
        end
    end
end
