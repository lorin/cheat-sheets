cheatsheet do
    title 'mkdocs'
    docset_file_name 'mkdocs'
    keyword 'mkdocs'
    category do
        id 'Starting out'
        entry do
            name 'Create new project'
            notes <<-'END'
            ```
            mkdocs new my-project
            cd my-project
            ```
            END
        end
        entry do
            name 'Helpful mkdocs.yml config'
            notes <<-'END'
            ```
            site_name: name of site
            theme: readthedocs
            copyright: <a href="https://www.example.com/these-docs">Source for these docs</a>
            markdown_extensions:
              - footnotes
              - admonition:
              - toc:
                  permalink: True
            ```
            END
        end
        entry do
            name 'Serve dynamically'
            notes <<-'END'
            ```
            mkdocs serve
            ```
            END
        end
        entry do
            name 'Generate HTML'
            notes <<-'END'
            ```
            mkdocs build
            ```
            END
        end
    end
    category do
        id 'Admonitions'
        entry do
            name 'Docs'
            notes <<-'END'
            <https://squidfunk.github.io/mkdocs-material/extensions/admonition/>
            END
        end
        entry do
            name 'Syntax'
            notes <<-'END'
            ```
            !!! note
                This shows up as a note.
                Has to be indented like this.
            ```
            END
        end
        entry do
            name 'Change the title'
            notes <<-'END'
            ```
            !!! warning "Show this text instead"
                Warning goes here.
            ```
            END
        end
        entry do
            name 'Types'
            notes <<-'END'
            * note
            * warning
            * danger
            * info
            * abstract
            * tip
            * success
            * question
            * failure
            * bug
            * quote
            END
        end
    end
    category do
        id 'Images'
        entry do
            name 'Image'
            notes <<-'END'
            ```
            ![Logo](img/logo.png)
            ```
            END
        end
    end
    category do
        id 'Anchors'
        entry do
            name 'Enable (mkdocs.yml)'
            notes <<-'END'
            ```
            markdown_extensions:
            - toc:
                permalink: True
            ```
            END
        end
        entry do
            name 'Link'
            notes <<-'END'
            ```
            Here is a link to [FooBar](#foobar).

            ## FooBar

            This is the FooBar section.
            ```
            END
        end
    end
    category do
        id 'Footnotes'
        entry do
            name 'Enable (mkdocs.yml)'
            notes <<-'END'
            ```
            markdown_extensions:
                - footnotes
            ```
            END
        end
        entry do
            name 'Write footnote'
            notes <<-'END'
            ```
            Here is some text[^1].

            [^1]: Here is a footnote.
            ```
            END
        end
    end
    category do
        id 'Notes'
        entry do
            name 'Enable (mkdocs.yml)'
            notes <<-'END'
            ```
            markdown_extensions:
                - admonition:
            ```
            END
        end
        entry do
            name 'Write note'
            notes <<-'END'
            ```
            !!! note
                Your note goes here.
            ```
            END
        end
    end
    category do
        id 'Committing generated to separate branch'
        entry do
            name 'Fully automated'
            notes <<-'END'
            This will generate to the gh-pages branch and push up:

            ```
            mkdocs gh-deploy
            ```

            It should be customizable to use other branch names.
            END
        end
        entry do
            name 'Reminder'
            notes <<-'END'
            Don't .gitignore the "site" folder. Below uses "git stash save -u",
            depends on git not ignoring it.
            END
        end
        entry do
            name 'Creating an orphaned pages branch'
            notes <<-'END'
            ```
            git checkout --orphan pages
            git rm -rf .

            # You need to a file or git won't keep the branch
            touch .gitkeep
            git add .gitkeep
            git commit -m 'initial commit'
            ```
            END
        end
        entry do
            name 'Automating generation'
            notes <<-'END'
            Script that generates files to `pages` branch.

            ```bash
            #!/bin/bash
            set -e
            mkdocs build
            git stash save -u
            git checkout pages

            # Remove existing content
            git rm -rf .

            # Restore the generated content
            git stash pop
            mv site/* .
            rmdir site
            echo "Commit changed files and push up"
            ```

            END
        end
    end
end
