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
            name 'Syntax highlighting with less'
            notes <<-'END'
            ```
            jq -C . file.json | less -R
            ```
            END
        end
        entry do
            name 'Escape a character'
            notes <<-'END'
            Access it as a js-style quoted key:

            ```
            jq .["foo.bar"] file.json
            
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
            jq '.values[] | select(.id.name == "foo" or .id.name == "bar")'
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
        entry do
            name 'Get indexes of array'
            notes <<-'END'
            ```
            jq '. | to_entries[] | {index: .key, data: .value}'
            
            ```
            END
        end
    end
    category do
        id 'String manipulation, interpolation and variables'
        entry do
            name 'String interpolation'
            notes <<-'END'
            ```bash
            jq -r '.[] | "\(.name) is awesome"'
            ```
            END
        end
        entry do
            name 'defining a variable'
            notes <<-'END'
            ```bash
            jq -r '.[] | . as $item | "\($item.name) is awesome"'
            ```
            END
        end
        entry do
            name 'Keys and list of values to a formatted table'
            notes <<-'END'

            ```bash
            jq -r '.[] | "\(.name): \(reduce .values[] as $item (""; . + $item + " ") )"'
            ```

            Assumes your input looks like this:

            ```json
            [
              {
                "name": "foo",
                "values": ["a","b","c"]
              },
              {
                "name": "bar",
                "values": ["d","e","f"]
              }
            ]
            ```

            Generates output like this:

            ```
            foo: a b c
            bar: d e f
            ```

            END
        end
        entry do
            name 'Split a string'
            notes <<-'END'
            ```bash
            jq -r '.issues[] | (.fields.created | split("T") | .[0]) + " " + .key + " " + .fields.summary' 
            ```

            Here `.fields.created` is a timestamp in RFC3339 format (e.g., `2006-01-02T15:04:05Z07:00`).

            To get the date, we're splitting on the "T", and just grabbing the first element of the resulting list.
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

