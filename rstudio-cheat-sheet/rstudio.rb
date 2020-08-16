cheatsheet do
    title 'rstudio'
    docset_file_name 'rstudio'
    keyword 'rstudio'
    category do
        id 'Keyboard shortcuts'
        entry do
            name 'Evaluate chunk'
            notes <<-'END'
            ```
            Cmd+Shift+Enter
            ```
            END
        end
        entry do
            name 'Create chunk'
            notes <<-'END'
            ```
            Cmd+Option+I
            ```
            END
        end
        entry do
            name 'HTML preview'
            notes <<-'END'
            ```
            Cmd+Shift+K
            ```
            END
        end
        entry do
            name 'Jump to R Console window'
            notes <<-'END'
            ```
            Ctrl+2
            ```
            END
        end
        entry do
            name 'Jump back to text editor'
            notes <<-'END'
            ```
            Ctrl+1
            ```
            END
        end
    end
    category do
        id 'import data'
        entry do
            name 'Import Excel data'
            notes <<-'END'
            1. Top-left, click environment tab
            2. Click "Import Dataset -> From Excel..."

            This will let you view the data and choose the types, then will generate code on the console.
            END
        end
        
    end
end
