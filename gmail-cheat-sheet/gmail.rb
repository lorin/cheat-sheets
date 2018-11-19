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
        id ''
        entry do
            name 'bcc'
            notes <<-'END'
            Shift ⌘ B
            END
        end
    end
end
