cheatsheet do
    title 'markdown'
    docset_file_name 'markdown'
    keyword 'markdown'
    category do
        id ''
        entry do
            name 'Images'
            notes <<-'END'
            ```
            ![Alt text for diagram](images/diagram.png)
            ```
            END
        end
        entry do
            name 'Generate tables'
            notes <<-'END'
            See [Markdown Tables Generator][1]

            ```
            | Tables   |      Are      |  Cool |
            |----------|:-------------:|------:|
            | col 1 is |  left-aligned | $1600 |
            | col 2 is |    centered   |   $12 |
            | col 3 is | right-aligned |    $1 |
            ```

            [1]: http://www.tablesgenerator.com/markdown_tables

            END
        end
        entry do
            name 'Strikethrough'
            notes <<-'END'
            ```
            <del>Like this</del>
            ```

            <del>Like this</del>
            END
        end
    end
    category do
        id 'Extensions'
        entry do
            name 'Admonition'
            notes <<-'END'
            ```
            !!! note
                If admonition is enabled, this will show up as a note.
            ```
            END
        end
    end
    category do
        id 'GitHub'
        entry do
            name 'Equations'
            notes <<-'END'
            Not supported. As a workaround, use [codecogs](https://www.codecogs.com/latex/eqneditor.php)
            END
        end
    end
end
