cheatsheet do
    title 'gradle'
    docset_file_name 'gradle'
    keyword 'gradle'
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
        id 'Obscure'
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
