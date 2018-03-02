cheatsheet do
    title 'typescript'
    docset_file_name 'typescript'
    keyword 'typescript'
    category do
        id 'Types'
        entry do
            name 'Define a type for an object'
            notes <<-'END'
            ```tsx
            interface Widget {sku: string, description: string};

            const row = (widget: Widget) => 
                <tr>
                    <td>{widget.sku}</td>
                    <td>{widget.description}</td>
                </tr>
            ```
            END
        end
        entry do
            name 'Javascript array'
            notes <<-'END'
            Two ways:

            ```
            number[]
            Array<number>
            ```
            END
        end
    end
    category do
        id 'Packages'
        entry do
            name 'Downloading types'
            notes <<-'END'
            ```
            yarn add --dev @types/react @types/react-dom
            ```
            END
        end
    end
end
