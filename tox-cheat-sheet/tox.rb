cheatsheet do
    title 'tox'
    docset_file_name 'tox'
    keyword 'tox'
    category do
        id ''
        entry do
            name 'Just run one environment'
            notes <<-'END'
            ```python
            tox -e style
            ```

            Environments are listed in:

            ```ini
            [tox]
            envlist = style,...
            ```
            END
        end
        entry do
            name 'Ignore a flake8 warning'
            notes <<-'END'
            ```ini
            [flake8]
            ignore = E501
            ```
            END
        end
    end
end
