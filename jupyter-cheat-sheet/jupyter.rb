cheatsheet do
    title 'jupyter'
    docset_file_name 'jupyter'
    keyword 'jupyter'
    category do
        id 'Embedding stuff'
        entry do
            name 'Display an image from a url'
            notes <<-'END'
            ```python
            from IPython.display import Image

            def show(url):
                display(Image(url=url))

            ...

            show("http://www.example.com/image.png")
            
            ```
            END
        end
        
    end
    category do
        id 'bash'
        entry do
            name 'Display an image'
            notes <<-'END'
            Use the `display` bash command.

            ```
            curl -s http://www.example.com/image.png | display
            ```
            END
        end
        
    end
    category do
        id 'Keyboard shortcuts'
        entry do
            name 'Docs'
            notes <<-'END'
            <https://www.dataquest.io/blog/jupyter-notebook-tips-tricks-shortcuts/>
            END
        end
        entry do
            name 'Command palette'
            command '⌘ ⇪ P'
        end
        entry do
            name 'Command mode'
            notes <<-'END'
            ```
            ESC
            ```
            END
        end
        entry do
            name 'Edit mode'
            notes <<-'END'
            ```
            ENTER
            ```
            END
        end
        entry do
            name 'Add cell above'
            notes <<-'END'
            ```
            A
            ```
            END
        end
        entry do
            name 'Add cell below'
            notes <<-'END'
            ```
            B
            ```
            END
        end
    end
end
