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
        entry do
            name 'Lists'
            notes <<-'END'
            ```kotlin
            val items = listOf(1, 2, 3)
            val mut = mutableListOf(1,2,3)
            ```
            END
        end
    end
    category do
        id 'Maps'
        entry do
            name 'Literal'
            notes <<-'END'
            ```kotlin
            hashMapOf(
                "foo" to "bar",
                "baz" to "quux"
            )
            
            ```
            END
        end
        entry do
            name 'Access'
            notes <<-'END'
            ```kotlin
            mymap["foo"]
            ```
            END
        end
        entry do
            name 'Membership'
            notes <<-'END'
            ```kotlin
            if("foo" in mymap) { ... }
            ```
            END
        end
    end
    category do
        id 'Properties'
        entry do
            name 'Read-only'
            notes <<-'END'
            ```kotlin
            class WidgetService construtor (private val provider : WidgetProvider) {
                val all: List<Widget>
                    get() = this.provider.getAllWidgets()
            }
            ```
            END
        end
    end
    category do
        id 'Constructors'
        entry do
            name 'Simple case'
            notes <<-'END'
            ```kotlin
            class Widget(provider : WidgetProvider) {
                ...
            }
            ```
            END
        end
    end
    category do
        id 'Non-obvious conversions from Java to Kotlin'
        entry do
            name 'main function'
            notes <<-'END'
            This is package-level scope, so not inside of a class.

            ```kotlin
            fun main(args: Array<String>) {
                // ...
            }
            ```
            END
        end
    end
    category do
        id 'Spring application invocation of main'
        entry do
            name ''
            notes <<-'END'
            ```kotlin
            fun main(args: Array<String>) {
                SpringApplication.run(MyClass::class.java, *args)
            }
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
            class WidgetController
            @Autowired
            constructor (private val widgetService : WidgetService) {
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
