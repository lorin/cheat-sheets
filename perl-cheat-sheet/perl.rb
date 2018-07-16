cheatsheet do
    title 'perl'
    docset_file_name 'perl'
    keyword 'perl'
    category do
        id 'Flags'
        entry do
            name 'Execute code snippet'
            command '-e'
        end
        entry do
            name 'Loop over input'
            command '-n'
        end
        entry do
            name 'Loop over input and print'
            command '-p'
        end
        entry do
            name 'Strip newlines off input, add to output'
            command '-l'
        end
        entry do
            name 'Modify file in-place'
            command '-i'
        end
        entry do
            name 'Enable warnings'
            command '-w'
        end
    end
    category do
        id 'One-liners'
        entry do
            name 'Extract part of an input'
            notes <<-'END'
            Let's say myfile.log contains lines like the following and you just want to extract the apps:
            ```
            [20922] 2016/09/02 12:00:04 app=foo account=test region=us-east-1
            ```
            Perl oneliner looks like this:
            ```bash
            cat myfile.log | perl -nle '/app=(.*?) /; print "$1"'
            ```
            END
        end
        entry do
            name 'Search and replace across multiple files'
            notes <<-'END'
            ```bash
            ffind .go | grep -v vendor | xargs perl -pi -w -e 's/old text/new text/g;'
            ```
            END
        end
        entry do
            name 'Same as above, with spaces in filenames'
            notes <<-'END'
            ```bash
            find . -type f -print0 | xargs -0 perl ...
            ```
            END
        end
    end
end
