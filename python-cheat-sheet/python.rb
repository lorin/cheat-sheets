cheatsheet do
    title 'python'
    docset_file_name 'python'
    keyword 'python'
    category do
        id 'regex'
        entry do
            name "Return matched groups"
            notes <<-'END'
            ```python
            def parse(line):
                result = re.search("name=(.*?) size=(.*?) shape=(.*?) color=(.*?) ", line)
                return result.group(1, 2, 3, 4)
            ```
            END
        end
    end
    category do
        id 'Strings and output'
        entry do
            name "No trailing newline or space"
            notes <<-'END'
            ```
            print(s, end="")
            ```
            END
        end
        entry do
            name "String interpolation"
            notes <<-'END'
            ```
            "foo:{} bar:{}".format(foo, bar)
            ```
            END
        end
        entry do
            name 'Large number with commas, no decimal'
            notes <<-'END'
            ```
            "{:,.0f}".format(N)
            ```
            END
        end
    end
    category do
        id 'Date time'
        entry do
            name 'Parse datetime string'
            notes <<-'END'
            ```
            $ pip install python-dateutil
            ```

            ```python
            import dateutil.parser
            d = dateutil.parser.parse('2016-11-02 18:06:04')
            ```
            END
        end
    end
    category do
        id 'flake8'
        entry do
            name 'Ignore line length'
            notes <<-'END'
            setup.cfg:

            ```
            [flake8]
            ignore = E501
            ```
            END
        end
    end
end
