cheatsheet do
    title 'awk'
    docset_file_name 'awk'
    keyword 'awk'
    category do
        id ''
        entry do
            name 'Print the first field'
            notes <<-'END'
            ```
            awk '{print $1}'
            ```
            END
        end
        entry do
            name 'Skip the first line'
            notes <<-'END'
            ```
            awk 'NR>1'
            ```
            END
        end
        entry do
            name 'Print every field except the first'
            notes <<-'END'
            ```
            awk '{for (i=2; i<NF; i++) printf $i " "; print $NF}'
            ```
            END
        end
        entry do
            name 'Replace first field with dash'
            notes <<-'END'
            ```
            awk '{$1 = "-"; print}'
            ```
            END
        end
        entry do
            name 'Print lines with 5 fields'
            notes <<-'END'
            ```
            awk 'NF==5'
            ```
            END
        end
        entry do
            name 'Output 4th column of 2nd line'
            notes <<-'END'
            ```
            awk 'NR==2 {print $4}'
            ```
            END
        end
        entry do
            name 'Show all docker images that start with ch13'
            notes <<-'END'
            ```
            docker images | awk 'NR!=1 && /ch13.*/ {print $1":"$2}' | xargs docker rmi
            ```
            END
        end
    end
end
