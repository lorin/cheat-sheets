cheatsheet do
    title 'groovy'
    docset_file_name 'groovy'
    keyword 'groovy'
    category do
        id 'Maps'
        entry do
            name 'Literal'
            notes <<-'END'
            ```groovy
            [name: "foo", "age": 43]
            
            ```
            END
        end
        entry do
            name 'Interpolate variable for key'
            notes <<-'END'
            ```groovy
            def name = "key"
            [(name): "foo"]
            ```
            END
        end
    end
    category do
        id 'Lists'
        entry do
            name 'Literal'
            notes <<-'END'
            ```groovy
            def lst = ["one", "two", "three"]
            ```
            END
        end
        entry do
            name 'Adding elements'
            notes <<-'END'
            [Official docs][1]

            ```groovy
            lst << "four"
            ```

            [1]: http://groovy-lang.org/groovy-dev-kit.html#_adding_or_removing_elements
            END
        end
        entry do
            name 'Convert to set'
            notes <<-'END'
            ```groovy
            def st = ["one", "two", "three"] as Set
            ```
            END
        end
    end
end
