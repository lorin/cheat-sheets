cheatsheet do
    title 'google-sheets'
    docset_file_name 'google-sheets'
    keyword 'google-sheets'
    category do
        id 'Frequency'
        entry do
            name 'Generate histogram / frequency bucket data stuff'
            notes <<-'END'
            Example:
            ```
            =frequency(B:B,D23:D33)
            ```

            Where "B" is the column with the data, and D23:D33 are your classes (buckets).


            END
        end
    end
end
