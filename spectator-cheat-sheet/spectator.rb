cheatsheet do
    title 'spectator'
    docset_file_name 'spectator'
    keyword 'spectator'
    category do
        id ''
        entry do
            name 'Basic counter'
            notes <<-'END'
            ```kotlin
            import com.netflix.spectator.api.Registry

            class MyClass(
                private val spectator: Registry
            ) {
                private val counterId = spectator.createId("my.metric.name")

                fun foo() {
                    spectator.counter(
                        counterId.withTags("action", "push", "color", "blue")
                      ).increment()
                }
            }
            ```
            END
        end
    end
end
