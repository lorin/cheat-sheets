cheatsheet do
    title 'jira'
    docset_file_name 'jira'
    keyword 'jira'
    category do
        id 'Searching'
        entry do
            name 'Text in title (summary)'
            notes <<-'END'
            Issues -> Search for issues

            ```
            project = FOO AND summary ~ bar AND text ~ "baz quux" ORDER BY key DESC
            ```
            END
        end
        entry do
            name 'Date/time'
            notes <<-'END'
            ```
            project = FOO AND created >= "2018/01/01" ORDER BY key ASC
            ```
            END
        end
        entry do
            name 'Search by owner'
            notes <<-'END'
            Issues -> Search for issues

            ```
            project = FOO AND assignee = lhochstein ORDER BY key DESC
            ```
            END
        end
    end
    category do
        id 'Formatting'
        entry do
            name 'Monospace (code) block'
            notes <<-'END'
            ```
            {code}
            foo += 1;
            bar = 0;
            {code}
            ```
            END
        end
    end
end
