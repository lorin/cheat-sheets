cheatsheet do
    title 'frontend'
    docset_file_name 'frontend'
    keyword 'frontend'
    category do
        id 'yarn'
        entry do
            name 'Role'
            notes <<-'END'
            Package management
            END
        end
        entry do
            name 'Start a project'
            notes <<-'END'
            ```
            mkdir proj
            cd proj
            yarn init
            ```
            END
        end
        entry do
            name 'Install the required stuff'
            notes <<-'END'
            ```
            yarn add react react-dom webpack webpack-dev-server path html-webpack-plugin
            yarn add babel-loader babel-core babel-preset-env babel-preset-react css-loader --dev
            ```
            END
        end
        entry do
            name 'Rebuild a module after a node change'
            notes <<-'END'
            ```
            yarn install
            ```

            (node-sass needs this)
            END
        end
    end
    category do
        id 'webpack'
        entry do
            name 'Build the js'
            notes <<-'END'
            Can configure this via yarn by adding to package.json:

            ```
            ...

              "scripts": {
                "build": "webpack",
              },
            ```

            Then do:

            ```
            yarn build
            ```
            END
        end
        entry do
            name 'html-webpack-plugin docs'
            notes <<-'END'
            [Configuration options](https://github.com/jantimon/html-webpack-plugin#configuration)
            END
        end
    end
    category do
        id 'babel'
        entry do
            name '.babelrc'
            notes <<-'END'
            ```
            {
                "presets":[
                    "es2017", "react"
                ]
            }
            ```
            END
        end
    end
end
