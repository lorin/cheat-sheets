cheatsheet do
    title 'deckset'
    docset_file_name 'deckset'
    keyword 'deckset'
    category do
        id ''
        entry do
            name 'One line'
            notes <<-'END'
            ```
            # [fit] Text fits!
            ```
            END
        end
        entry do
            name 'Image (full slide)'
            notes <<-'END'
            ```
            ![fit](chaos-monkey.jpg)
            ```
            END
        end
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
    category do
        id 'Other'
        entry do
            name 'Smart copy and paste'
            notes <<-'END'

            To copy a slide from Deckset to another document, just ⌘+C it, then
            ⌘+V it into your editor (it will paste the _Markdown_) or into any
            application that handles PDFs (it will paste the slide as _PDF_).

            END
        end
        entry do
            name 'Emoji'
            notes <<-'END'
            See [Emoji docs](https://docs.decksetapp.com/English.lproj/Formatting/09-emojis.html)
            END
        end
    end
end
