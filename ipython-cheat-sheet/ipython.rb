cheatsheet do
    title 'ipython'
    docset_file_name 'ipython'
    keyword 'ipython'
    category do
        id ''
        entry do
            name 'Other cheat sheets'
            notes <<-'END'
            * pandas
            * ggplot
            END
        end
        entry do
            name 'Run a python script, bringing its vars in scope'
            notes <<-'END'
            ```
            %run myscript
            ```
            END
        end
        entry do
            name 'Bring up editor (terminal)'
            notes <<-'END'
            ```
            %edit
            ```
            END
        end
        entry do
            name 'Suppress FutureWarning warnings'
            notes <<-'END'
            ```
            import warnings
            warnings.simplefilter(action = "ignore", category = FutureWarning)
            ```
            END
        end
        entry do
            name 'Change numerical formatting of displaye ddata'
            notes <<-'END'
            Need to set `pandas.options.display.float_format`, see pandas cheat sheet
            END
        end
    end
    category do
        id 'Plots'
        entry do
            name 'inline plots (one-off)'
            notes <<-'END'
            ```
            %matplotlib inline
            ```
            END
        end
        entry do
            name 'inline plots by default'
            notes <<-'END'
            Edit `~/.ipython/profile_default/ipython_kernel_config.py`

            ```python
            c.InteractiveShellApp.matplotlib = "inline"
            ```

            If the file doesn't exist yet, create it by doing:

            ```bash
            ipython profile create
            ```
            END
        end
    end
    category do
        id 'Jupyter'
        entry do
            name 'VIM bindings'
            notes <<-'END'
            See [lambdalisue/jupyter-vim-binding](https://github.com/lambdalisue/jupyter-vim-binding/wiki/Installation)

            Make sure that you first install IPython-notebook-extensions, as documented.

            This will conflict with the hide prompt numbers keyboard shortcuts.
            END
        end
        entry do
            name 'VIM keyboard shortcuts'
            notes <<-'END'
            See <https://github.com/lambdalisue/jupyter-vim-binding/blob/master/lib/jupyter/shortcuts.js>

            * Insert cell below: `ctrl-o o`
            * Insert cell above: `ctrl-o shift-o`
            * Code: `⌘ 1`
            * Markdown: `⌘ 2`
            END
        end
        entry do
            name 'Hide prompt numbers'
            notes <<-'END'
            You can install [kirbs-/hide_code](https://github.com/kirbs-/hide_code).

            Keyboard shortcut to hide prompts: `w`

            This doesn't work with VIM bindings.

            END
        end
    end
end
