cheatsheet do
    title 'flyway'
    docset_file_name 'flyway'
    keyword 'flyway'
    category do
        id 'gradle'
        entry do
            name ''
            notes <<-'END'
            ```
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
    end
end
