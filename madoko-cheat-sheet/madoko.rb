cheatsheet do
    title 'madoko'
    docset_file_name 'madoko'
    keyword 'madoko'

    category do
        id 'Command line'
        entry do
            name 'Convert document.mdk to out/document.pdf' 
            notes <<-'END'
                ```
                madoko --no-logo --pdf --odir=out document
                ```
            END
        end
    end

    category do
        id 'Header'
        entry do
            name 'Author'
            notes <<-'END'
                ```
                Title       : Insert interesting title here
                Author      : Lorin Hochstein
                Affiliation : Netflix
                Email       : lorin@netflix.com
                ```
            END
        end
        entry do
            name 'Style'
            notes <<-'END'
                ```
                Doc class    : [conference]style/IEEEtran.cls
                ```
            END
        end

    end

    category do
        id 'References'
        entry do
            name 'Specify refs.bib as the bibliography file'
            notes <<-'END'
                In the metadata section at the top:

                ```
                Bibliography : refs
                ```

                At the bottom of the document:

                ```
                [BIB]
                ```
            END
        end
    end
end
