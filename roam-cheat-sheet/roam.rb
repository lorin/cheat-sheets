cheatsheet do
    title 'Roam Research'
    docset_file_name 'roam'
    keyword 'roam'
    category do
        id 'Keyboard shortcuts'
        entry do
            name 'Go to daily notes'
            command 'CTRL SHIFT D'
        end
        entry do
            name 'Open link or block in sidebar'
            command 'CTL SHIFT O'
        end
        entry do
            name 'Create note'
            command 'CMD U'
        end
        entry do
            name 'Typing focus on new note'
            command 'CMD Enter'
        end
        entry do
            name 'Open link in sidebar (mouse)'
            command 'SHIFT Click'
        end
        entry do
            name 'expand'
            command 'CMD down'
        end
        entry do
            name 'collapse'
            command 'CMD up'
        end
        entry do
            name 'move block up'
            command 'CMD SHIFT up'
        end
        entry do
            name 'move block down'
            command 'CMD SHIFT down'
        end
    end
    category do
        id 'Functionality'
        entry do
            name 'Reference a block'
            notes <<-'END'
            Use ((double parens))

            It will let you choose.
            END
        end
        entry do
            name 'Calculator'
            notes <<-'END'
            ```
            {{calc: 4*5}}
            ```

            You can reference blocks in your calcs as well.
            END
        end
    end
end
