cheatsheet do
    title 'gdoc'
    docset_file_name 'gdoc'
    keyword 'gdoc'
    category do
        id 'Keyboard shortcuts'
        entry do
            name 'Link'
            notes <<-'END'
            <https://support.google.com/docs/answer/179738?co=GENIE.Platform%3DDesktop&hl=en&oco=1>
            END
        end
        entry do
            name 'Set header level'
            notes <<-'END'
            ⌘ + Option + [1-6]
            END
        end
    end
    category do
        id 'General'
        entry do
            name 'Strikethrough'
            notes <<-'END'
            ⌘+Shift+X
            END
        end
        entry do
            name 'Outline'
            notes <<-'END'
            ```
            Tools -> Document Outline
            ```
            END
        end
        entry do
            name 'Export diagram'
            notes <<-'END'
            1. Click on a diagram
            2. Click the "Edit" link in the bottom-left corner
            3. Click the "Actions" menu option at the top-level
            4. Click "Downlad as..." and choose format
            END
        end
        entry do
            name 'Change owner'
            notes <<-'END'
            From <https://support.google.com/drive/answer/2494892>

            1. Open the homescreen for Google Drive, Google Docs, Google Sheets, or Google Slides.
            1. Click the file you want to transfer to someone else.
            1. Click Share 
            1. Click Advanced.
            1. To the right of a person you've already shared the file with, click the Down arrow. 
            1. Click Is owner.
            1. Click Save changes.
            END
        end
        entry do
            name 'Subcscribe to comments'
            notes <<-'END'
            1. Click Comments icon
            1. Click *Notifications*
            1. Select "All"
            END
        end
    end
    category do
        id 'Google sheets'
        entry do
            name 'Pivot table, simple'
            notes <<-'END'
            If you want each row to correspond to one row in your dataset,
            and you want columns to show one of the categorical data values

            For example, if you have a spreadsheet where the rows are tickets,
            and the columns have categorical data about the tickets.

            1. Highlight the data 
            2. Data -> Pivot table...
            3. Rows, click "ADD", choose "Ticket number" as the field
            4. Columns, click "ADD", choose the field you want to look at
            5. Values, click "ADD", summarize by COUNTA

            END
        end
        entry do
            name 'Count unique values'
            notes <<-'END'
            Use a pivot table. Just pick the one column you care about for the data.

            Rows: The one column.

            Values: The one column, summarize by COUNTA
            END
        end
        entry do
            name 'Reference columns from another table'
            notes <<-'END'
            ```
            =query(Responses!A:C, "")
            ```

            Above is the simplest thing you can do, it grabs columns A:C from the "Responses" tab,
            and does no filtering. You can filter using the [Query Language syntax](https://developers.google.com/chart/interactive/docs/querylanguage).
            END
        end
    end
end
