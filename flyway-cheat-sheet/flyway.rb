cheatsheet do
    title 'flyway'
    docset_file_name 'flyway'
    keyword 'flyway'
    category do
        id 'gradle'
        entry do
            name 'Docs'
            notes <<-'END'
            <https://flywaydb.org/documentation/gradle/>
            END
        end
        entry do
            name 'Basics'
            notes <<-'END'
            ```groovy
            buildscript {
                dependencies {
                    classpath "org.flywaydb:flyway-gradle-plugin:4.2.0"
                }
            }

            flyway {
                url = 'jdbc:postgresql://localhost:5432/mydatabase'
            }
            ```
            END
        end
        entry do
            name 'Manual invocation'
            notes <<-'END'
            ```bash
            ./gradlew flywayMigrate  -Dflyway.url=jdbc:postgresql://localhost:5432/mydatabase -Dflyway.user=`whoami`
            ```
            END
        end
    end
end
