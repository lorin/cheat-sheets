cheatsheet do
    title 'deckset'
    docset_file_name 'deckset'
    keyword 'deckset'
    category do
        id ''
        entry do
            name 'Per-slide Footers'
            notes <<-'END'
            ```
            [.footer: Text here]
            ```
            END
        end
    end
    category do
        id 'Themes'
        entry do
            name 'Where data is stored'
            notes <<-'END'
            It's stored as extended attributes to the file:

            ```
            $  ls -l@ pres.md
            -rw-------@ 1 lorin  lorin  1303 Aug 30 22:54 pres.md
                com.apple.quarantine	  22
                com.decksetapp.ColorScheme	   7
                com.decksetapp.Identifier	  36
                com.decksetapp.Theme	   5
                com.decksetapp.Thumbnail	22505
            ```
            END
        end
    end
end
