cheatsheet do
    title 'typescript'
    docset_file_name 'typescript'
    keyword 'typescript'
    category do
        id 'Types'
        entry do
            name 'String that can only take on certain values'
            notes <<-'END'
            ```typescript
            type status = 'PASS' | 'FAIL'
            ```
            END
        end
        entry do
            name 'Object whose keys are only certain strings'
            notes <<-'END'
            ```typescript
            const statusToText: { [key in Status]: string } = {
                PASS: "it pased!",
                FAIL: "it failed!"
            };

            // use it like this
            statusToText[status]
            ```
            END
        end
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
        entry do
            name 'Casting (as)'
            notes <<-'END'
            ```tsx
            let subject = shallow(<MyContainer />);
            let instance = subject.instance() as MyContainer;
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

            export interface Props { compiler: string; framework: string; }

            export const Hello = (props: Props) => <h1>Hello from {props.compiler} and {props.framework}!</h1>;
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
                constructor(props : HelloProps) {
                    super(props);
                    ...
                }


                render() {
                    return <h1>Hello from {this.props.compiler} and {this.props.framework}!</h1>;
                }
            }
            ```
            END
        end
        entry do
            name 'Children'
            notes <<-'END'
            ```tsx
            const Row = (props : {children: JSX.Element}) => <div className="row">{props.children}</div>
            ```
            END
        end
        entry do
            name 'Inline styles'
            notes <<-'END'
            ```tsx
            const myStyles : React.CSSProperties {
                "top": "10px",
                "fontSize": "20px"
            }

            ...
            <span style={myStyles}>Stuff goes here</span>

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
    category do
        id 'Declaration files'
        entry do
            name 'Github repo'
            notes <<-'END'
            <https://github.com/DefinitelyTyped/DefinitelyTyped>
            END
        end
        entry do
            name 'Definitely Typed Website'
            notes <<-'END'
            <http://definitelytyped.org/>
            END
        end
        entry do
            name 'TypeScript Docs'
            notes <<-'END'
            <http://www.typescriptlang.org/docs/handbook/declaration-files/introduction.html>
            END
        end
    end
end
