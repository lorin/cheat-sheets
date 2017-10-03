cheatsheet do
    title 'asciidoc'
    docset_file_name 'asciidoc'
    keyword 'asciidoc'
    category do
        id ''
        entry do
            name 'Footnotes'
            notes <<-'END'
            ```
            footnote:[this is a footnote]
            ```
            END
        end
    end
    category do
        id 'Blocks'
        entry do
            name 'Code block with caption'
            notes <<-'END'
            ```
            [[ec2_env_vars]]
            .Setting EC2 environment variables
            ====
            [source,bash]
            ----
            # Don't forget to replace these values with your actual credentials!
            export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
            export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
            ----
            ====
            ```
            END
        end
        entry do
            name 'Note'
            notes <<-'END'
            ```asciidoc
            [NOTE]
            ====
            This is a note
            ====
            ```
            END
        end
        entry do
            name 'Warning'
            notes <<-'END'
            ```asciidoc
            [WARNING]
            ====
            This is a warning
            ====
            ```
            END
        end
        entry do
            name 'Tip'
            notes <<-'END'
            ```asciidoc
            [TIP]
            ====
            This is a tip
            ====
            ```
            END
        end
        entry do
            name 'Sidebar'
            notes <<-'END'
            ```asciidoc
            .Sidebar title
            ****
            Put the text that you want to go into a sidebar here.
            ****
            ```
            END
        end
        entry do
            name 'Quote block'
            notes <<-'END'
            ```asciidoc
            [quote, John Doe, The Autobiography of John Doe]
            ____________________________________________________________________
            Some compelling quote here.
            ____________________________________________________________________
            ```
            END
        end
    end
    category do
        id 'Link'
        entry do
            name 'Link'
            notes <<-'END'
            Link in parens.

            ```
            The actual http://bit.ly/2lAsfV8[inventory script]
            ```
            END
        end
    end
    category do
        id 'Emphasis'
        entry do
            name 'Italics'
            notes <<-'END'
            ```
            _this is in italics_
            ```
            END
        end
        entry do
            name 'Bold'
            notes <<-'END'
            ```
            *this is in bold*
            ```
            END
        end
        entry do
            name 'Italics & bold'
            notes <<-'END'
            ```
            *_this is in italics and bold_*
            ```
            END
        end
        entry do
            name 'Callouts'
            notes <<-'END'
            ```
            ----
            TASK: [debug var=login] *******************************************************
            ok: [server1] => {
                "login": {
                    "changed": true, <1>
                    "cmd": [ <2>
                        "id",
                        "-un"
                    ],
                    "delta": "0:00:00.002180",
                    "end": "2015-01-11 15:57:19.193699",
                    "invocation": {
                        "module_args": "id -un",
                        "module_name": "command"
                    },
                    "rc": 0, <3>
                    "start": "2015-01-11 15:57:19.191519",
                    "stderr": "", <4>
                    "stdout": "vagrant", <5>
                    "stdout_lines": [ <6>
                        "vagrant"
                    ],
                    "warnings": []
                }
            }

            ----

            <1> The +changed+ key is present in the return value of all Ansible modules...
            <2> The +cmd+ key contains the invoked command as a list of strings.
            <3> The +rc+ key contains the return code. If it is non-zero, Ansible will assume the task failed to execute.
            <4> The +stderr+ key contains any text written to standard error, as a single string.
            <5> The +stdout+ key contains any text written to standard out, as a single string.
            <6> The +stdout_lines+ key contains any text written to split by newline. It is a list, where each element of the list is a line of output.

            ```
            END
        end
    end
    category do
        id 'Tables'
        entry do
            name 'Example'
            notes <<-'END'
            ```
            [[table_ref]]
            .Argument options
            [options="header"]
            |===========================================================================================
            |Option   | Description
            |required | If True, argument is required
            |default  | Default value if argument is not required
            |choices  | A list of possible values for the argument
            |aliases  | Other names you can use as an alias for this argument
            |type     | Argument type. Allowed values: `'str'`, `'list'`, `'dict'`, `'bool'`, `'int'`, `'float'`
            |===========================================================================================
            ```
            END
        end
    end
    category do
        id 'Lists'
        entry do
            name 'Bullets'
            notes <<-'END'
            ```
            * Stars work great
            * See how they go!

            - Dashes are good too
            - I prefer stars, though.
            ```
            END
        end
        entry do
            name 'Numbered'
            notes <<-'END'
            ```
            . First
            . Second
            . Third
            ```
            END
        end
    end
    category do
        id 'Code'
        entry do
            name 'Inline'
            notes <<-'END'
            ```
            This is a +command+ name.
            ```
            END
        end
        entry do
            name 'Block of code, not a figure'
            notes <<-'END'
            ```
            ----
            Code goes here
            ----
            ```
            END
        end
        entry do
            name 'Block of code as a figure'
            notes <<-'END'
            ```
            [[refname]]
            .Caption goes here
            ====
            ----
            Code goes here
            ----
            ====
            ```
            END
        end
    end
    category do
        id 'Images'
        entry do
            name 'Add an image'
            notes <<-'END'
            ```
            [[foo_image]]
            .This is the caption
            image::path/to/foo.png[foo]
            ```
            END
        end
        entry do
            name 'Reference an image'
            notes <<-'END'
            ```
            See <<foo_image>> for the figure.
            ```
            END
        end
    end
    category do
        id 'Break'
        entry do
            name 'Page break before entity'
            notes <<-'END'
            ```
            [role="pagebreak-before"]
            // entity goes here
            ```
            END
        end
    end
end
