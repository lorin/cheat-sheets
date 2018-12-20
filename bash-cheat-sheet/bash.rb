cheatsheet do
    title 'bash'
    docset_file_name 'bash'
    keyword 'bash'
    category do
        id 'Command-line args'
        entry do
            name 'First, second, third, etc.'
            notes <<-'END'
            ```
            first=$1
            second=$2
            third=$3
            ```
            END
        end
        entry do
            name '$@'
            notes <<-'END'
            String that contains all of the positional parameters.
            END
        end
    end
    category do
        id 'Functions'
        entry do
            name 'One argument'
            notes <<-'END'
            ```
            # date to epoch millis
            epoch() {
                gdate -d "$1" +%s%3N
            }

            millis=`epoch "19-Oct-2018 09:00"`
            ```
            END
        end
    end
    category do
        id 'Special variables'
        entry do
            name 'Docs'
            notes <<-'END'
            [Special parameters](https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html)
            END
        end
    end
    category do
        id 'Loops'
        entry do
            name 'Loop over output'
            notes <<-'END'
            ```bash
            for i in $( ls ); do
                echo $i
            done
            ```
            END
        end
        entry do
            name 'Loop over list literal'
            notes <<-'END'
            ```bash
            ITEMS="alpha beta gamma"
            for item in $ITEMS; do
                echo "item: $item"
            done
            ```
            END
        end
    end
    category do
        id 'Tests'
        entry do
            name 'Double versus single brackets'
            notes <<-'END'
            See [BashFAQ/031](http://mywiki.wooledge.org/BashFAQ/031)

            Prefer `[[ ... ]]`, which does not require quoting
            END
        end
        entry do
            name 'Check if a variable is blank'
            notes <<-'END'
            ```bash
            if [[ -z $timeout ]]; then
                timeout=3
            fi
            ```
            END
        end
        entry do
            name 'String comparison'
            notes <<-'END'
            ```
            timeout=`jq -r .timeout < $1`
            if [[ $timeout = null ]]; then
                timeout=3
            fi
            ```
            END
        end
    end
    category do
        id 'Arguments'
        entry do
            name 'First argument'
            command '$1'
        end
        entry do
            name 'Ensure gets exactly one argument'
            notes <<-'END'
            The `$#` variable holds the number of arguments.
            It does *not* count the command name as an argument.

            Here's how you would check if one arg was passed:

            ```bash
            if [[ $# -ne 1 ]]; then
                echo "Wrong number of arguments: $#"
            fi
            ```
            END
        end
    end
end
