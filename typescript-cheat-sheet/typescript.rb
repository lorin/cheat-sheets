cheatsheet do
    title 'typescript'
    docset_file_name 'typescript'
    keyword 'typescript'
    category do
        id 'Types'
        entry do
            name 'Define a type for an object'
            notes <<-'END'
            ```typescript
            interface Widget {sku: string, description: string};

            const row = (widget: Widget) => 
                <tr>
                    <td>{widget.sku}</td>
                    <td>{widget.description}</td>
                </tr>
            ```
            END
        end
    end
end
