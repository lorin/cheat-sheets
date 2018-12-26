cheatsheet do
    title 'omnigraffle'
    docset_file_name 'omnigraffle'
    keyword 'omnigraffle'
    category do
        id 'Text'
        entry do
            name 'Left justify'
            notes <<-'END'
            * ^⌘{
            * Format -> Text -> Align Left
            END
        end
        entry do
            name 'Change font color'
            notes <<-'END'
            * Select text object
            * Click "Inspect" at top-right
            * Choose "T" box (second option)
            * Under "Font", choose color
            END
        end
    end

    category do
        id 'Stencils'
        entry do
            name 'Stick figure'
            notes <<-'END'
            1. Inspectors -> Stencils
            2. Software -> UML-Use Case
            END
        end
    end


    category do
        id 'Layout'
        entry do
            name 'Auto-layout'
            notes <<-'END'
            1. Inspectors->Canvas ⌘-3
            2. Diagram Layout and Style -> Auto layout
            END
        end
    end
end
