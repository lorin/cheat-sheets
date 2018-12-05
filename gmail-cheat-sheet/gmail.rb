cheatsheet do
    title 'gmail'
    docset_file_name 'gmail'
    keyword 'gmail'
    category do
        id 'Filtering'
        entry do
            name 'On a certain date'
            notes <<-'END'
            ```
            label:my-label after:2018/11/12 before:2018/11/13  
            ```

            Above will match emails on Nov. 12, 2018.
            END
        end
    end
    category do
        id 'Keyboard shortcuts'
        entry do
            name 'bcc'
            notes <<-'END'
            Shift ⌘ B
            END
        end
        entry do
            name 'Previous/next message in thread'
            notes <<-'END'
            ```
            P
            N
            ```
            END
        end
        entry do
            name 'Move cursor to email list'
            notes <<-'END'
            ```
            u
            ```
            END
        end
    end
end
