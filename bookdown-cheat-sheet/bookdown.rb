cheatsheet do
    title 'bookdown'
    docset_file_name 'bookdown'
    keyword 'bookdown'
    category do
        id ''
        entry do
            name 'Basic example'
            notes <<-'END'
            <https://github.com/rstudio/bookdown-demo>
            END
        end
        entry do
            name 'Build on the command-line'
            notes <<-'END'
            ```
            Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
            Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
            Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::epub_book')"
            ```

            If you get unknown timzone warnings, set the TZ env var to make it happy:

            ```
            export TZ=America/Los_Angeles
            ```
            END
        end
        entry do
            name 'Prereqs'
            notes <<-'END'
            ```
            brew install pandoc pandoc-citeproc
            ```

            RStudio
            
            END
        end
    end
end
