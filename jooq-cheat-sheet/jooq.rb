cheatsheet do
    title 'jooq'
    docset_file_name 'jooq'
    keyword 'jooq'
    category do
        id 'Code generation'
        entry do
            name 'Gradle setup'
            notes <<-'END'
            See <https://github.com/etiennestuder/gradle-jooq-plugin> for more details

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
                            // H2: "db.jooq.name=org.jooq.util.h2.H2Database"
                            name = "org.jooq.util.postgres.PostgresDatabase"
                            // With H2, use "PUBLIC" instead
                            inputSchema = 'public'
                        }

                        target {
                            packageName = 'com.example.foo.jooq'
                            // directory defaults to: build/generated-src/jooq
                            // directory = 'generated/src/main/java'
                        }
                    }

                }
            }


            // Set up task dependencies, assumes flywyay which isn't shown above
            // See the flyway cheat sheet for details there

            // Migrate
            generatefooJooqSchemaSource.dependsOn flywayMigrate
            compileKotlin.dependsOn generatefooJooqSchemaSource
            compileJava.dependsOn generatefooJooqSchemaSource
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
    category do
        id 'Select'
        entry do
            name 'SELECT *'
            notes <<-'END'
            ```
            import static org.example.foo.jooq.tables.Widgets.WIDGETS;

            DSLContext dsl = ...;

            // Result implements List
            Result<IncsRecord> result = dsl.selectFrom(WIDGETS).fetch();
            ```
            END
        end
    end
    category do
        id 'Insert'
        entry do
            name 'Insert longs'
            notes <<-'END'
            ```
            create
                .insertInto(MYTABLE, FIELD1, FIELD2)
                .values(ULong.valueOf(1), ULong.valueOf(2))
                .values(ULong.valueOf(3), ULong.valueOf(4))
                .execute();
            ```
            END
        end
    end
    category do
        id 'Mappings'
        entry do
            name 'MySQL: map BOOLEAN to boolean'
            notes <<-'END'

            In the build.gradle job, you can specify that types that start with is_ or has_ should be mapped to Java booleans by doing:

            ```
            def jooqWriter = new StringWriter()
            def jooqXml = new groovy.xml.MarkupBuilder(jooqWriter).configuration('xmlns': 'http://www.jooq.org/xsd/jooq-codegen-3.10.0.xsd') {
                ...
                generator() {
                    database() {
                        ...
                        forcedTypes(){
                            forcedType() {
                                name('BOOLEAN')
                                expression('.*\\.is_.*|.*\\.has_.*')
                                types('.*')
                        }
                
            ```
            END
        end
    end
end
