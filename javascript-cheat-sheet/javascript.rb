cheatsheet do
    title 'javascript'
    docset_file_name 'javascript'
    keyword 'javascript'
    category do
        id 'Basics'
        entry do
            name 'Array length'
            notes <<-'END'
            ```
            arr.length
            ```
            END
        end
        entry do
            name 'Visit a different page'
            notes <<-'END'
            ```
            window.location="/new/path/goes/here";
            ```
            END
        end
    end
    category do
        id 'Arrays'
        entry do
            name 'map with index'
            notes <<-'END'
            ```js
            tags.map((tag, index) => ({tag, index}));
            ```

            Index is the second argument.
            END
        end
        entry do
            name 'Shallow copy'
            notes <<-'END'
            ```js
            tags.slice();
            ```
            END
        end
    end
    category do
        id 'Keyboard events'
        entry do
            name 'Example handling events'
            notes <<-'END'
            ```javascript
            handleKey(event) {
                switch(event.key) {
                    case 'j':
                    case 'ArrowDown':
                        // ...
                        break;
                    case 'k':
                    case 'ArrowUp':
                        // ...
                        break;
                    case 'Enter':
                        console.log("Enter");
                        break;
                }
            }
            ```
            END
        end
        entry do
            name 'Object type'
            notes <<-'END'
            Keypress handler is passed a `KeyboardEvent` object.
            END
        end
        entry do
            name 'Accessing the key'
            notes <<-'END'
            ```
            event.key
            ```

            [Key Values MDN doc page](https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent/key/Key_Values)
            END
        end
        entry do
            name 'Checking for modifier key'
            notes <<-'END'
            ```js
            if(event.metaKey) {
               ... 
            }
            ```

            There is a read-only KeyboardEvent property for each modifier:

            * metaKey (cmd on macOS)
            * ctrlKey
            * shiftKey
            END
        end
        entry do
            name 'Handle keyboard events on the entire page'
            notes <<-'END'
            ```
            document.addEventListener("keydown", this.handleKey.bind(this));
            ```
            END
        end
        entry do
            name 'Stop handling'
            notes <<-'END'
            ```
            document.removeEventListener("keydown", this.handleKey.bind(this));
            ```
            END
        end
    end
end