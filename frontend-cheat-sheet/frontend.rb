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
    end
    category do
        id 'webpack'
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
