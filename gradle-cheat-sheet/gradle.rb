cheatsheet do
    title 'gradle'
    docset_file_name 'gradle'
    keyword 'gradle'
    category do
        id 'jars etc'
        entry do
            name 'Which version of a jar is linked?'
            notes <<-'END'
            ```
            ./gradlew resolve
            ```

            This will generate a build scan.

            Click the URL.
            Go to "Dependencies" on the right.
            Click on a project, and then click "compileClasspath"
            END
        end

    end
    category do
        id 'Testing'
        entry do
            name 'Run a specific test'
            notes <<-'END'
            ```
            ./gradlew test --tests com.example.MyTest1 --tests com.example.MyTest2
            ```
            END
        end
        entry do
            name 'Stop / fail after one test'
            notes <<-'END'
            ```
            ./gradlew test --fail-fast
            ```
            END
        end
        entry do
            name 'Enable test coverage (jacoco)'
            notes <<-'END'
            ```
            // Near the top
            plugins {
                id 'jacoco'
            }

            test {
                finalizedBy jacocoTestReport // report is always generated after tests run
            }

            jacocoTestReport {
                dependsOn test // tests are required to run before generating the report
            }
            ```

            Report: `build/reports/jacoco/test/html/index.html`
            END
        end
    end
    category do
        id 'variables and properties'
        entry do
            name 'Set a project property on the command line'
            notes <<-'END'
            ```
            # Use -Pkey=value

            $ gw liquibaseUpdateSql -PliquibaseRunList=local
            ```

            For more details, see [Project properties](https://docs.gradle.org/current/userguide/build_environment.html#sec:project_properties)
            END
        end

        entry do
            name 'Custom variable in build.gradle'
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
        entry do
            name 'Custom variables in gradle.properties'
            notes <<-'END'
            You can create a `gradle.properties` file and those variables are acessible, e.g.:

            ```properties
            db.url=jdbc:h2:./test
            db.user=sa
            db.jooq.name=org.jooq.util.h2.H2Database
            db.jooq.inputSchema=PUBLIC
            ```

            Then you can do:

            ```groovy
            jooq {
                foo(sourceSets.main) {
                    jdbc {
                        url = db.url
                        user = db.user
                        ...
                    }
                   ...
               }
            }
            ```

            END
        end
        entry do
            name 'Directory relative to parent'
            notes <<-'END'
            Use `rootProject.projectDir.absolutePath`. For example:

            ```groovy
            asciidoctor {
                sourceDir = file('src/docs')
                attributes = ['snippets': rootProject.projectDir.absolutePath + '/build/generated-snippets']
            }
            ```
            END
        end
    end
    category do
        id 'jars'
        entry do
            name 'Depend on the most recent version'
            notes <<-'END'
            Append `:latest.release`, e.g.:

            ```
            dependencies {
                implementation("com.acme:my-cool-library:latest.release")
            }
            ```
            END
        end
        entry do
            name 'Find jars'
            notes <<-'END'
            <https://search.maven.org>
            END
        end
        entry do
            name 'Jar dependency tree'
            notes <<-'END'
            ```
            ./gradlew dependencies
            ```
            END
        end
        entry do
            name 'Dependency insights'
            notes <<-'END'
            ```
            ./gradlew keel-web:dI --dependency io.strikt:strikt-jackson --configuration testCompileClasspath
            ```
            END
        end
    end
    category do
        id 'Nebula stuff'
        entry do
            name 'Update dependency lock file'
            notes <<-'END'
            ```
            ./gradlew generateLock saveLock
            ```

            See [depenendency lock plugin](https://github.com/nebula-plugins/gradle-dependency-lock-plugin)
            END
        end
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
        id 'Less common'
        entry do
            name 'Add a test directory not called "test"'
            notes <<-'END'
            ```groovy

            apply plugin: 'nebula.facet'

            facets {
                docTest {
                    parentSourceSet = 'test'
                    // Don't run it for gradlew check
                    includeInCheckLifecycle = false
                }
            }
            ```
            END
        end
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
