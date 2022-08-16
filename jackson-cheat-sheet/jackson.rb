cheatsheet do
    title 'jackson'
    docset_file_name 'jackson'
    keyword 'jackson'
    category do
        id 'Kotlin'
        entry do
            name 'Missing field exception'
            notes <<-'END'
            If there's a missing field, Jackson throws a
            [MissingKotlinParameterException](https://github.com/FasterXML/jackson-module-kotlin/blob/master/src/main/kotlin/com/fasterxml/jackson/module/kotlin/Exceptions.kt).

            Here's an example that just prints the missing field name

            ```kotlin
            try {
                // deserialization happens here
            }  catch(e: MissingKotlinParameterException) {
                println("Missing field is: ${parameter.name})
            ```
            END
        end
    end
end
