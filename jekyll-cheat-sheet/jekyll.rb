cheatsheet do
    title 'jekyll'
    docset_file_name 'jekyll'
    keyword 'jekyll'
    category do
        id ''
        entry do
            name 'Quickstart'
            notes <<-'END'
            ```
            jekyll new mysite
            cd mysite
            bundle exec jekyll serve
            ```

            <http://localhost:4000>
            END
        end
        entry do
            name 'Prereqs'
            notes <<-'END'
            ```
            gem install jekyll bundler
            ```
            END
        end
    end
end
