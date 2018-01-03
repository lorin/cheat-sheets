cheatsheet do
    title 'idea'
    docset_file_name 'idea'
    keyword 'idea'
    category do
        id ''
        entry do
            name 'IDEA project files'
            notes <<-'END'
            They end in .ipr
            END
        end
        entry do
            name 'Override methods'
            notes <<-'END'
            ```
            command N
            ```
            END
        end
        entry do
            name 'Trailing whitespace'
            notes <<-'END'
            ```
            Preferences... -> Editor -> General
            ```

            Under "Other": Strip trailing spaces on Save"
            END
        end
    end
    category do
        id 'Module stuff'
        entry do
            name 'Tests don\'t see proper dependencies'
            notes <<-'END'
            I fixed this once by going into 
            
            ```
            File -> Project Structure -> Modules -> Dependencies 
            ```

            and then removing a "test" module that had spuriously appeared (I already had a different test module previously).

            See [Working with module dependencies](https://www.jetbrains.com/help/idea/configuring-projects.html#working-with-module-dependencies).
            END
        end
    end
    category do
        id 'Keyboard shortcuts'
        entry do
            name 'Hide bottom pane'
            command 'shift-escape'
        end
        entry do
            name 'Toggle bottom pane'
            command 'command-4'
        end
        entry do
            name 'Emmet expansion'
            notes <<-'END'
            ```
            Tab
            ```
            END
        end
    end
    category do
        id 'vim emulation'
        entry do
            name 'Config file'
            notes <<-'END'
            ```
            ~/.ideavimrc
            ```
            END
        end
        entry do
            name 'bind a key to an IDEA action'
            notes <<-'END'
            In ~/.ideavimrc:

            ```
            noremap <C-b> :action ToggleLineBreakpoint<CR>
            ```
            END
        end
        entry do
            name 'Docs on binding to IDEA actions'
            notes <<-'END'
            https://github.com/JetBrains/ideavim#executing-ide-actions
            END
        end
        entry do
            name 'Get a list of actions'
            notes <<-'END'
            ```
            :actionlist [pattern]
            ```
            END
        end
    end
    category do
        id 'Gradle'
        entry do
            name 'Specifying which gradle to use'
            notes <<-'END'
            Preferences > Build, Execution, Deployment > Gradle: Gradle home

            For example:

            ```
            /Users/lorin/.gradle/wrapper/dists/nebula-gradle-3.15.0-all/aw6emjsee0yzx1387vqaehhg2/gradle-2.13
            ```
            END
        end
    end
    category do
        id 'Javascript / JEST'
        entry do
            name 'Run tests'
            notes <<-'END'
            From [WEB-14979](https://youtrack.jetbrains.com/issue/WEB-14979#comment=27-1518879)


            ### Install CLI
            Install Jest CLI: `npm install –save-dev jest-cli`

            ### Create node run config
            Change the following:

            * JavaScript file: `node_modules/.bin/jest`
            * Application paramaters: `--runInBand`

            `–-runInBand` tells jest to run in single process, otherwise there
            is a port conflict when running multiple node processes in debug
            mode.

            ### Run tests
            Create some tests and run configuration in Debug mode (Ctrl-D). If you set breakpoints in your test or app code they should hit.

            END
        end
    end
    category do
        id 'Warnings'
        entry do
            name 'Disable warnings for unused public methods'
            notes <<-'END'
            ```
            Preferences...>Edtor>Inspections>Java>Declaration redundancy>Unused declaration
            ```
            END
        end
        entry do
            name 'Disable unindexed repository warning'
            notes <<-'END'
            1. Preferences -> Appearance & Behavior -> Notifications -> "Unindexed maven repositories gradle detection".
            2. Change Popup to "No popup"
            3. Uncheck "log"

            For details see:
            * [this post](https://intellij-support.jetbrains.com/hc/en-us/community/posts/115000125290-Indexing-https-plugins-gradle-org-m2?page=1#community_comment_115000160950)
            * [IDEA-148753](https://youtrack.jetbrains.com/issue/IDEA-148753)
            END
        end
    end
end
