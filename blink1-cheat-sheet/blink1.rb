cheatsheet do
    title 'blink1'
    docset_file_name 'blink1'
    keyword 'blink1'
    category do
        id 'REST API'
        entry do
            name 'Docs'
            notes <<-'END'
            * [node-blink1-server](https://github.com/todbot/node-blink1-server) is the server that starts up with the GUI
            * <https://github.com/todbot/blink1/blob/master/docs/app-url-api.md> is other docs that don't quite seem to match
            END
        end
        entry do
            name 'On/off'
            notes <<-'END'
            ```
            http http://localhost:8934/blink1/on
            http http://localhost:8934/blink1/off
            ```
            END
        end
        entry do
            name 'Red/green/blue'
            notes <<-'END'
            ```
            http localhost:8934/blink1/fadeToRGB rgb=="#ff0000"
            http localhost:8934/blink1/fadeToRGB rgb=="#00ff00"
            http localhost:8934/blink1/fadeToRGB rgb=="#0000ff"
            ```

            ```
            curl http://localhost:8934/blink1/fadeToRGB?rgb=ff0000
            curl http://localhost:8934/blink1/fadeToRGB?rgb=00ff00
            END
        end
    end
end
