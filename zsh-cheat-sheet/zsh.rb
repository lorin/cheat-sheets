cheatsheet do
    title 'zsh'
    docset_file_name 'zsh'
    keyword 'zsh'
    category do
        id 'Control constructs'
        entry do
            name 'for loop'
            notes <<-'END'
            ```zsh
            for region in us-east-1 eu-west-1 us-west-1 us-west-2
            do
                echo $region
            done
            ```

            You can also save a line with a semicolon:

            ```zsh
            for f in $(ls); do
                ...
            done
            ```
            END
        end
        entry do
            name 'if statement'
            notes <<-'END'
            ```zsh
            if [[ test condition here ]]
            then
             echo "conditional was true"
            else
             echo "conditional was false"
            fi
            ```
            END
        end
    end
    category do
        id 'General'
        entry do
            name 'Run zsh without loading anything'
            notes <<-'END'
            ```
            zsh -f
            ```
            END
        end
    end
    category do
        id 'Functions'
        entry do
            name 'Define a function'
            notes <<-'END'
            ```
            function html {
                pandoc -c https://rawgit.com/lorin/macdown/master/MacDown/Resources/Styles/GitHub2.css $@ | browser
            }
            ```
            END
        end
    end
    category do
        id 'Variable interpolation'
        entry do
            name 'Filename without extension'
            notes <<-'END'
            ```
            ${fname:r}
            ```
            END
        end
        entry do
            name 'Directory that file is in'
            notes <<-'END'
            ```
            ${fname:h}
            
            ```
            END
        end
        entry do
            name 'File extension'
            notes <<-'END'
            ```
            ${fname:e}
            ```
            END
        end
        entry do
            name 'File name without path'
            notes <<-'END'
            ```
            ${fname:t}
            ```
            END
        end
    end
    category do
        id 'Non-interactive'
        entry do
            name 'Run a command'
            notes <<-'END'
            ```
            zsh -c 'ls *.html'
            ```
            END
        end
        entry do
            name 'Make a function available in non-interactive shells'
            notes <<-'END'
            Put the function definition in `~/.zshenv`
            END
        end
    end
end
