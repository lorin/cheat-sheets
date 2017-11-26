cheatsheet do
    title 'http'
    docset_file_name 'http'
    keyword 'http'
    category do
        id 'httpie'
        entry do
            name 'Docs'
            notes <<-'END'
            <https://httpie.org/doc>
            END
        end
        entry do
            name 'Headers'
            notes <<-'END'
            ```
            http put foo.example.com Content-Type:application/json < file.json
            ```
            END
        end
        entry do
            name 'form urlencoded'
            notes <<-'END'
            ```
            http -f post http://www.example.com/form name="My name" address="123 Fake St"
            ```

            The header will contain:

            ```
            Content-Type: application/x-www-form-urlencoded; charset=utf-8
            ```
            END
        end
        entry do
            name 'Pass numbers or booleans'
            notes <<-'END'
            Use `:=`, instead of `=`:

            ```
            http post http://www.example.com name=foo count:=12 flag:=true
            ```

            Body will be:

            ```
            {"name": "foo", "count": 12, "flag": true}
            ```
            END
        end
        entry do
            name 'Pass complex json as a body'
            notes <<-'END'
            Pass to stdin

            ```bash
            http post $ENDPOINT < input.json
            ```
            END
        end
        entry do
            name 'Basic auth'
            notes <<-'END'
            ```
            http -a username:password www.example.com
            
            ```
            END
        end
    end
    category do
        id 'url encoding and decoding'
        entry do
            name 'encode: Python 3'
            notes <<-'END'
            ```python
            from urllib.parse import urlencode
            x = [("shape", "circle"), ("color", "red")]
            y = urlencode(x)
            ```
            END
        end
        entry do
            name 'decode: python 3'
            notes <<-'END'
            ```python
            import urllib
            qs = ...
            s = urllib.parse.unquote(quoted_string)
            ```
            END
        end
    end
    category do
        id 'Insomnia'
        entry do
            name 'Import an url'
            notes <<-'END'
            1. Click the + on the left
            2. Give this url a meaningful name
            3. Paste the url into the top
            4. Click "Query"
            5. Click "Import from URL" at the bottom
            END
        end
    end
end
