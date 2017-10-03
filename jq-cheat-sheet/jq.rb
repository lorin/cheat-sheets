cheatsheet do
    title 'jq'
    docset_file_name 'jq'
    keyword 'jq'
    category do
        id ''
        entry do
            name 'Read from a file'
            notes <<-'END'
            ```
            jq -f myprog < input.js
            ```
            END
        end
        entry do
            name 'Get the list of keys'
            notes <<-'END'
            Here's an example that gets the list of libraries from a [Nebula dependencies.lock file](https://github.com/nebula-plugins/gradle-dependency-lock-plugin)

            ```
            < dependencies.lock jq -r '.compile | keys[]'
            ```
            END
        end
        entry do
            name 'Iterate over keys and values'
            notes <<-'END'
            Use `to_entries`. 

            Here it is with `name:version` format:

            ```
            < dependencies.lock jq -r '.compile | to_entries[] | "\(.key):\(.value.locked)"'
            ```


            Here it is as a tab-seprated table with name and version:

            ```
            < dependencies.lock jq -r '.compile | to_entries[] | [.key, .value.locked] | @tsv'
            ```
            END
        end
    end
    category do
        id 'List processing'
        entry do
            name 'Filter'
            notes <<-'END'
            ```
            jq '.values[] | select(.id.name == "foo")'
            ```
            END
        end
        entry do
            name 'Filter array'
            notes <<-'END'
            ```
            jq '.values | map(select(.id.name == "foo"))'
            ```
            END
        end
        entry do
            name 'Length of an array'
            notes <<-'END'
            ```
            jq '.values | length'
            ```
            END
        end
    end
    category do
        id 'Fancy'
        entry do
            name 'Unique list of tags in jsonl input'
            notes <<-'END'
            ```
            jq -r -s -f tags.filter < input.jsonl
            ```

            Where tags.filter is:
            ```
            reduce .[].tags as $item ([]; . + $item) | 
            unique | 
            .[]
            ```

            Here I'm parsing a jsonl dump from Mongo where each object
            has a tags field that contains a list of strings.
            END
        end
    end
end

