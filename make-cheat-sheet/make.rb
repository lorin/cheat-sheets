cheatsheet do
    title 'make'
    docset_file_name 'make'
    keyword 'make'
    category do
        id ''
        entry do
            name 'Links'
            notes <<-'END'
            * [Automatic variables](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html)
            * [Self-documented Makefile](https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html)
            END
        end
        entry do
            name 'Target name'
            notes <<-'END'
            ```
            $@
            ```
            END
        end
        entry do
            name 'First prereq'
            notes <<-'END'
            ```
            $<
            ```
            END
        end
        entry do
            name 'All prereqs, spaces between them'
            notes <<-'END'
            ```
            $^
            ```
            END
        end
    end
end
