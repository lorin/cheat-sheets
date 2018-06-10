cheatsheet do
    title 'jest'
    docset_file_name 'jest'
    keyword 'jest'
    category do
        id ''
        entry do
            name 'Basic example with enzyme'
            notes <<-'END'
            ```tsx
            import * as React from 'react';
            import {configure, shallow, ShallowWrapper} from 'enzyme';
            import * as Adapter from 'enzyme-adapter-react-16';

            configure({ adapter: new Adapter() });

            describe("MyComponent", () => {
                let widget : Widget;

                beforeEach(() => {
                    widget = null;
                });
            });

            it("does what it's supposed to", () => {
                // code goes here

                let component = shallow(<MyWidget foo={1} bar={2} />);
                let inst = component.instance as MyWidget;
                inst.myWidgetMethod(12);


                expect(widget).not.toBeNull();
            });

            
            ```
            END
        end
    end
    category do
        id 'mocks'
        entry do
            name 'Manual mock location'
            notes <<-'END'
            If the class you're mocking is in `foo/bar/baz/Widget.tsx`,
            the mock is `foo/bar/baz/__mocks__/Widget.tsx`.
            END
        end
        entry do
            name 'Using a manual mock'
            notes <<-'END'
            Import the original, not the mock:

            ```ts
            import {Widget} from "../stuff/Widget";

            jest.mock("../stuff/Widget");
            ```
            END
        end
        entry do
            name 'Jest built-in mocks'
            notes <<-'END'
            ```ts
            let mymock = jest.fn();

            expect(mymock.calls.length).toBe(1); // called once
            expect(mymock.calls[0][0]).toBe("foo"); // first arg of first call
            
            ```
            END
        end
    end
    category do
        id 'enzyme'
        entry do
            name 'Install'
            notes <<-'END'
            ```
            yarn add --dev enzyme enzyme-adapter-react-16 @types/enzyme @types/enzyme-adapter-react-16
            ```
            END
        end
    end
    category do
        id 'yarn'
        entry do
            name 'package.json'
            notes <<-'END'
            ```json
            {
              "scripts": {
                "test": "jest"
            },
              "jest": {
                "transform": {
                  "^.+\\.tsx?$": "ts-jest"
                },
                "testRegex": "(/__tests__/.*|(\\.|/)(test|spec))\\.(jsx?|tsx?)$",
                "moduleFileExtensions": [
                  "ts",
                  "tsx",
                  "js",
                  "jsx",
                  "json",
                  "node"
                ]
              }
            }
            ```
            END
        end
    end
end
