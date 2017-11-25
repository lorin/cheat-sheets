cheatsheet do
    title 'kotlin'
    docset_file_name 'kotlin'
    keyword 'kotlin'
    category do
        id 'Basics'
        entry do
            name 'Docs'
            notes <<-'END'
            <https://kotlinlang.org/docs/reference/basic-syntax.html>
            END
        end
        entry do
            name 'Class with method'
            notes <<-'END'
            ```kotlin
            class MyClass {
                fun map(): Map<String, String> {
                    return hashMapOf("foo" to "bar")
                }
            }
            ```
            END
        end
    end
    category do
        id 'Literals'
        entry do
            name 'Hash Map'
            notes <<-'END'
            ```kotlin
            hashMapOf(
                "foo" to "bar",
                "baz" to "quux"
            )
            
            ```
            END
        end
    end
end
