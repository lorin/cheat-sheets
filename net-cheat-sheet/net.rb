cheatsheet do
    title 'net'
    docset_file_name 'net'
    keyword 'net'
    category do
        id ''
        entry do
            name 'Who is listening on port 8080'
            notes <<-'END'
            ```
            lsof -n -iTCP:8080
            ```
            END
        end
        entry do
          name 'What ports is that pid listening on'
          notes <<-'END'
          ```
          lsof -nP -iTCP -sTCP:LISTEN | grep <PID> 
          ```
          END
        end
        entry do
            name 'Who is listening on all ports (macOS)'
            notes <<-'END'
            ```
            lsof -i -P
            ```
            END
        end
        entry do
            name 'Who is listening on all ports (Linux)'
            notes <<-'END'
            ```
            ss -tunapl
            ```

            From <https://twitter.com/b0rk/status/1090058524137345025>
            END
        end
    end
    category do
        id 'DNS'
        entry do
            name 'Do a DNS lookup'
            notes <<-'END'
            On macOS, you can use `host` or `dig`, but
            to replicate app behavior, do something like:

            ```python
            #!/usr/bin/env python3
            import sys
            from socket import gethostbyname

            hostname = sys.argv[1]
            result = gethostbyname(hostname)
            print(result)
            ```
            END
        end
    end
    category do
        id 'Other'
        entry do
            name 'asnum lookup'
            notes <<-'END'
            <https://bgpview.io/>
            END
        end
    end
end
