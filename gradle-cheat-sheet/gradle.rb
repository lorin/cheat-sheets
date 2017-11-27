cheatsheet do
    title 'gradle'
    docset_file_name 'gradle'
    keyword 'gradle'
    category do
        id ''
        entry do
            name 'Custom variable'
            notes <<-'END'
            You can create [extra user-defined properties][1] with an "ext" block.

            [1]: https://docs.gradle.org/current/userguide/writing_build_scripts.html#sec:extra_properties

            ```gradle
            ext {
                // This is only used for local development
                jdbcURL = "jdbc:postgresql://localhost:5432/foo"
            }

            // Example of derferencing

            flyway {
                url = jdbcURL
            }

            jooq {
                foo(sourceSets.main) {
                    jdbc {
                        url = jdbcURL
                        ...
                    }
                   ... 
               }
            }
            ```
            END
        end
    end
    category do
        id ''
        entry do
            name 'Find jars'
            notes <<-'END'
            <https://search.maven.org>
            END
        end
    end
    category do
        id 'Nebula stuff'
        entry do
            name 'Override recommended dependency version'
            notes <<-'END'
            ```groovy
            configurations.all {

                resolutionStrategy {
                    force "org.flywaydb:flyway-core:4.2.0"
                }
            }
            ```

            See [nebula-dependency-recommender-plugin][1] docs.

            [1]: https://github.com/nebula-plugins/nebula-dependency-recommender-plugin#51-forced-dependencies
            END
        end
    end
    category do
        id 'Obscure'
        entry do
            name 'Override source sets'
            notes <<-'END'
            Say you wanted to put groovy code (e.g., Spock) under src/test/java
            intead of src/test/groovy and still have it work:

            ```
            sourceSets {
                test {
                    java {
                        srcDirs = ['src/test/java']
                    }
                    groovy {
                        srcDirs = ['src/test/java']
                    }
                    resources {
                        srcDirs = ['src/test/resources']
                    }
                }
            }
            ```
            END
        end
        entry do
            name 'Include class files'
            notes <<-'END'
            Assuming they are in the "vendor" directory:

            ```
            dependencies {
                compile files('vendor')
            }
            ```
            END
        end
    end
end
