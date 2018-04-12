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
    category do
        id 'React'
        entry do
            name 'Simple case (no props)'
            notes <<-'END'
            ```tsx
            import * as React from 'react';

            const Widget = () => <h1>Widget</h1>;

            export default Widget;
            
            ```
            END
        end
        entry do
            name 'Simple case (with props)'
            notes <<-'END'
            From [typescript docs](https://www.typescriptlang.org/docs/handbook/react-&-webpack.html)

            ```tsx
            import * as React from "react";

            export interface HelloProps { compiler: string; framework: string; }

            export const Hello = (props: HelloProps) => <h1>Hello from {props.compiler} and {props.framework}!</h1>;
            ```
            END
        end
        entry do
            name 'Class-based'
            notes <<-'END'
            From [typescript docs](https://www.typescriptlang.org/docs/handbook/react-&-webpack.html)

            ```tsx
            import * as React from "react";

            export interface HelloProps { compiler: string; framework: string; }

            // 'HelloProps' describes the shape of props.
            // State is never set so we use the '{}' type.
            export class Hello extends React.Component<HelloProps, {}> {
                render() {
                    return <h1>Hello from {this.props.compiler} and {this.props.framework}!</h1>;
                }
            }
            ```
            END
        end
    end
    category do
        id 'Imports'
        entry do
            name 'Import with "export =" syntax'
            notes <<-'END'
            Example: the keymirror package has the following index.d.ts

            ```
            declare function KeyMirror<T>(obj: T): {[K in keyof T]: K};
            export = KeyMirror;
            ```

            You import it like htis:

            ```
            import keyMirror = require('keymirror');
            ```

            See <https://www.typescriptlang.org/docs/handbook/modules.html>
            END
        end
    end
end
