cheatsheet do
    title 'requests'
    docset_file_name 'requests'
    keyword 'requests'
    category do
        id ''
        entry do
            name 'Query params'
            notes <<-'END'
            ```python
            import requests

            url = "http://www.example.com"
            params = {"foo": "bar", "baz": "quux"}
            r = requests.get(url, params=params)
            r.raise_for_status()
            result = r.json()
            ```
            END
        end
        entry do
            name 'POST json body'
            notes <<-'END'
            ```python
            import requests

            url = "http://www.example.com"
            params = {"foo": "bar", "baz": "quux"}

            r = requests.post(url, json=params)
            r.raise_for_status()
            result = r.json()
            ```
            END
        end

    end
end
