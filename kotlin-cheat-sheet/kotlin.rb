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
    category do
        id 'Annotations'
        entry do
            name 'Annotate constructor'
            notes <<-'END'
            Here's an example from Spring where the constructor is annotated with `@Autowired`

            ```kotlin
            package org.example.foo

            import org.example.foo.jooq.Tables.WIDGETS
            import org.example.foo.service.WidgetService
            import org.springframework.beans.factory.annotation.Autowired
            import org.springframework.web.bind.annotation.RequestMapping
            import org.springframework.web.bind.annotation.RestController

            @RestController
            class WidgetController @Autowired constructor (private val widgetService : WidgetService) {
                @RequestMapping("api/widgets")
                fun widgets() : List<Map<String, String>> {
                    return widgetService.all.map{
                        hashMapOf("name" to it.get(WIDGETS.NAME),
                                  "description" to it.get(WIDGETS.DESCRIPTION))
                    }
                }
            }
            ```
            END
        end
    end
end
