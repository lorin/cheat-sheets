cheatsheet do
    title 'liquibase'
    docset_file_name 'liquibase'
    keyword 'liquibase'
    category do
        id ''
        entry do
            name 'Look at the migration SQL'
            notes <<-'END'
            ```
            # Assuming you're using the gradle plugin and have this in gradle.properties
            # liquibaseTaskPrefix=liquibase
            ./gradlew liquibaseUpateSql

            ```
            END
        end
    end
end
