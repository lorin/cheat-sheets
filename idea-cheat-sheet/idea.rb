# coding: utf-8
cheatsheet do
    title 'idea'
    docset_file_name 'idea'
    keyword 'idea'
    category do
      id 'Navigation'
      entry do
        name 'Next highlighted error'
        notes <<-'END'
        I have it mapped like this:

        ```
        noremap <C-n> :action GotoNextError<CR>
        noremap <C-p> :action GotoPreviousError<CR>
        ```

        `F2` is the official shortcut.
        END
      end
      entry do
        name 'Copy path to clipbard'
        notes <<-'END'
          ```
          CMD Shift C
          ```
          END
      end
    end
    category do
        id ''
        entry do
            name 'IDEA project files'
            notes <<-'END'
            They end in .ipr
            END
        end
        entry do
            name 'Show file in project file'
            notes <<-'END'
            ```
            Alt F1
            1
            ```
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
        entry do
            name 'Re-do the indexing'
            notes <<-'END'
            ```
            File -> Invalidate Caches / Restart ... -> Invalidate and Restart
            ```
            END
        end
        entry do
            name 'Show typescript error messages in a window'
            notes <<-'END'
            ```
            View -> Tool Windows -> TypeScript -> Errors
            ```
            END
        end
        entry do
            name 'Run code gen (e.g., jooq) task automatically'
            notes <<-'END'
            1. Open the Gradle sidebar
            1. Find the task you want to run
            1. Right-click on it and select "Execute before build" and "Execute before rebuild"
            END
        end
        entry do
          name 'Analyze an external stack trace'
          notes <<-'END'
          1. Copy the stack trace onto your clipboard
          1. Shift Shift
          1. Analyze stack trace
        END
        end
    end
    category do
        id 'Database'
        entry do
            name 'Ad-hoc queries'
            notes <<-'END'
            1. Open the Database tab on the left
            2. Click on the "console" icon (next to funnel)

            This will open a terminal where you can type SQL. 

            Hit CMD-Enter and the result will appear at the bottom.
            END
        end
        entry do
            name 'Show a table'
            notes <<-'END'
            Double click on the table in the right-hand pane
            END
        end
        entry do
            name 'Modify data graphically'
            notes <<-'END'
            1. Double click on the table.
            1. Edit the desired rows.
            1. Click CMD-Enter or right-click and choose "Submit"
            END
        end
    end
    category do
        id 'Go'
        entry do
            name 'Set the GOROOT'
            notes <<-'END'
            ```
            IntelliJ IDEA -> Preferences... -> Languages & Frameorks -> Go -> GOROOT
            ```

            If you installed Go via homebrew, set this to: /usr/local/opt/go/libexec

            MacOS file dialog doesn't let you browse to /usr. However, if you hit `shift + command + g`, you can specify the directory.
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
        id 'Contextual help'
        entry do
            name 'Show args in function'
            notes <<-'END'
            ```
            CMD P (pops up)
            F1 (right-hand pane)
            ```
            END
        end
    end
    category do
        id 'Keyboard shortcuts'
        entry do
            name 'Hide gradle tool window'
            notes <<-'END'
            ```
            shift ESC
            
            ```
            END
        end
        entry do
            name 'Add constructor parameter as instance variable'
            notes <<-'END'
            ```
            Option-Enter
            ```
            END
        end
        entry do
            name 'Open terminal tool window'
            notes <<-'END'
            ```
            Alt-F12
            ```
            END
        end
        entry do
            name 'Hide bottom pane'
            command 'shift-escape'
        end
        entry do
            name 'Emmet expansion'
            notes <<-'END'
            ```
            Tab
            ```
            END
        end
        entry do
            name 'Show arguments'
            notes <<-'END'
            ```
            CMD P
            ```
            END
        end
        entry do
            name 'Complete is block'
            notes <<-'END'
            ```
            CMD Shift Enter
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
    category do
        id 'Editor behaviour'
        entry do
            name 'Change attribute quote/brace autocompletion in JSX '
            notes <<-'END'
            ```
            Settings > Editor > Code Style > HTML > Other > Add for JSX attributes
            ```

            You can choose brace, quotes, or by type.

            See [WEB-28689](https://youtrack.jetbrains.com/issue/WEB-28689)
            END
        end
    end
end
