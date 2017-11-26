cheatsheet do
    title 'jooq'
    docset_file_name 'jooq'
    keyword 'jooq'
    category do
        id 'Code generation'
        entry do
            name 'Gradle setup'
            notes <<-'END'
            See <https://github.com/etiennestuder/gradle-jooq-plugin> for mroe details

            Assumes database is named "foo", postgres as backend

            ```gradle
            buildscript {
                ext.jooq_version = '3.10.1'

                dependencies {
                    classpath 'nu.studer:gradle-jooq-plugin:2.0.9'
                }
            }

            dependencies {
                compile "org.postgresql:postgresql"
                compile "org.jooq:jooq"

                jooqRuntime "org.postgresql:postgresql"
            }

            jooq {
                foo(sourceSets.main) {
                    jdbc {
                        url = project.property('jooq.url')
                        user = project.property('jooq.user')
                        // I usually do this locally against Postgres.app, so no password here
                    }
                    generator {
                        database {
                            name = "org.jooq.util.postgres.PostgresDatabase"
                            inputSchema = 'public'
                        }

                        target {
                            packageName = 'com.example.foo.jooq'
                            directory = 'generated/src/main/java'
                        }
                    }

                }
            }
            ```
            END
        end
        entry do
            name 'Executing the task'
            notes <<-'END'
            ```
            JDBC="jdbc:postgresql://localhost:5432/foo"
            ./gradlew generateIncompleteJooqSchemaSource -Pjooq.url=$(JDBC) -Pjooq.user=$$USER
            ```
            END
        end
    end
end
