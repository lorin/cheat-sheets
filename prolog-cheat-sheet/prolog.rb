cheatsheet do
    title 'prolog'
    docset_file_name 'prolog'
    keyword 'prolog'
    category do
        id ''
        entry do
            name 'Executable'
            notes <<-'END'
            ```
            swipl
            ```
            END
        end
        entry do
            name 'Loading a set of rules'
            notes <<-'END'
            ```
            $ swipl file.pl
            ```

            or

            ```
            $ swipl
            ?- consult(file).
            ```
            END
        end
        entry do
            name 'Adding a rule at the interpreter'
            notes <<-'END'
            ```
            ?- assertz(eats(dog, kibble)).
            true.

            ?- eats(dog, X).
            X = kibble.
            ```
            END
        end
    end
end
