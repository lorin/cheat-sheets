cheatsheet do
    title 'vim'
    docset_file_name 'vim'
    keyword 'vim'
    category do
        id 'Inserting characters'
        entry do
            name 'Em-dash'
            notes <<-'END'
            In insert mode (note capital M)

            ```
            CTRL k - M
            ```
            END
        end
        entry do
            name 'En-dash'
            notes <<-'END'
            In insert mode (note capital N)

            ```
            CTRL k - N
            ```
            END
        end
    end
    category do
        id 'Moving lines around'
        entry do
            name 'Copy line 23 to current location'
            notes <<-'END'
            ```
            :23t-
            ```
            END
        end
    end
    category do
        id 'Invoking shell'
        entry do
            name 'Ignore failure'
            notes <<-'END'
            ```
            :silent ! command-goes-here
            ```
            END
        end
        entry do
            name 'Suppress output and ignore failure'
            notes <<-'END'
            ```
            :silent ! command-goes-here > /dev/null
            ```
            END
        end
    end
    category do
        id 'Registers'
        entry do
            name 'Last yank'
            notes <<-'END'
            ```
            0
            ```

            Example:

            ```
            "0p
            ```
            END
        end
        entry do
            name 'System clipboard'
            notes <<-'END'
            ```
            +
            ```
            END
        end
        entry do
            name 'Paste system clipboard into command line'
            notes <<-'END'
            ```
            C-r +
            ```
            END
        end
        entry do
            name 'Do math with the = register'
            notes <<-'END'
            In edit mode:

            ```
            C-r= 5+12
            ```

            That will write "17" into the buffer at the current location
            END
        end
        entry do
            name 'Where registers are stored'
            notes <<-'END'
            ```
            ~/.viminfo
            ```
            END
        end
        entry do
            name 'Unnamed (default) register'
            notes <<-'END'
            ```
            "
            ```
            END
        end
    end
    category do
        id 'Directories'
        entry do
            name 'Show current working directory'
            notes <<-'END'
            ```
            :pwd
            ```
            END
        end
        entry do
            name 'Show full path of current file'
            notes <<-'END'
            ```
            :echo expand('%:p')
            ```
            END
        end
        entry do
            name 'Show directory of current file'
            notes <<-'END'
            ```
            :echo expand('%:p:h')
            ```
            END
        end
        entry do
            name 'Change to directory of currently open file for current window'
            notes <<-'END'
            ```
            :lcd %:p:h
            ```
            END
        end
        entry do
            name 'Change to directory of currently open file'
            notes <<-'END'
            ```
            :cd %:p:h
            ```
            END
        end
        entry do
            name 'Automatically change to directory of current file'
            notes <<-'END'
            ```
            :set autochdir
            ```
            END
        end
    end
    category do
        id 'Variables'
        entry do
            name 'Set value of option'
            command ':set tw=79'
        end
        entry do
            name 'Show value of option'
            command ':set fo?'
        end
        entry do
            name 'Unset a boolean option'
            command ':set nolist'
        end
        entry do
            name 'Show value of variable (let)'
            command ':echo mapleader'
        end
    end
    category do
        id 'Line wrapping'
        entry do
            name 'Docs for formatoptions'
            notes <<-'END'
            It's called `formatoptions` or `fo` for short. For details on the different values:

            ```
            help fo-table
            ```
            END
        end
        entry do
            name 'Set line width'
            notes <<-'END'
            ```
            :set textwidth=79
            ```
            END
        end
        entry do
            name 'Break long lines in insert mode'
            notes <<-'END'
            ```
            set fo-=l
            ```

            (If this is set, it won't break long lines as you type).
            END
        end
    end
    category do
        id 'Search and replace'
        entry do
            name 'Interactive'
            notes '`s/foo/bar/gc`'
        end
        entry do
            name 'Clear last search highlighting'
            command ':noh'
        end
        entry do
            name 'Case insensitive search'
            command ':set ic'
        end
        entry do
            name 'Search current word'
            command '*'
        end
        entry do
            name 'Replace commas with carriage returns'
            notes <<-'END'
            ```
            %s/,/\r/g
            ```

            See <https://stackoverflow.com/questions/71417/why-is-r-a-newline-for-vim> for why it's `\r` and not `\n`.
            END
        end
    end
    category do
        id 'Visual mode'
        entry do
            name 'Append to multiple lines'
            notes <<-'END'
            1. Hit `Ctrl-V`
            2. Hit `$`
            3. Move down as much as desired
            4. Hit `A`
            END
        end
    end
    category do
        id 'Navigation'
        entry do
            name 'Jump to last location'
            command "''"
        end
        entry do
            name 'Next/prev git change'
            notes <<-'END'
            ```
            ]c
            [c
            ```
            END
        end
        entry do
            name 'Forward back one sentence'
            notes <<-'END'
            ```
            )
            (
            ```
            END
        end
        entry do
            name 'Navigate syntastic errors'
            notes <<-'END'
            Navigate back and forth by doing:

            ```
            :lnext
            :lprev
            ```

            Syntastic needs to populate a loclist for this to work. You can default this on by doing:

            ```
            let g:syntastic_always_populate_loc_list = 1
            ```

            To one-off it, do:

            ```
            :Errors
            :lclose
            ```
            END
        end
    end
    category do
        id 'Indenting, wrapping, columns'
        entry do
            name 'Show tabs'
            command ':set list'
        end
        entry do
            name 'Enable word wrap'
            command ':set fo+=t'
        end
        entry do
            name 'Move up/down logical lines'
            notes <<-'END'
            ```
            gk
            gj
            ```
            END
        end
        entry do
            name 'Set word wrap width'
            command ':set tw=79'
        end
        entry do
            name 'Convert tabs to spaces'
            notes <<-'END'
            ```
            %retab!
            ```
            END
        end
        entry do
            name '4 spaces when hit tab'
            notes <<-'END'
            ```
            set expandtab
            set shiftwidth=4
            ```
            END
        end
        entry do
            name 'File-specific indent'
            notes <<-'END'
            ```
            au FileType yaml setl shiftwidth=2
            ```
            END
        end
        entry do
            name 'Vertical column at right edge'
            notes <<-'END'
            ```
            :set colorcolumn=80
            ```
            END
        end
        entry do
            name 'Go to column 80'
            notes <<-'END'
            ```
            80|
            ```
            END
        end
    end
    category do
        id 'Macros'
        entry do
            name 'Record macro "q"'
            notes <<-'END'
            ```
            qq
            <do stuff>
            q
            ```
            END
        end
        entry do
            name 'Play back macro "q"'
            notes <<-'END'
            ```
            @q
            ```
            END
        end
        entry do
            name 'Play back last macro'
            notes <<-'END'
            ```
            @@
            ```

            I have this aliased to `Q`;

            ```
            nnoremap Q @@
            ```
            END
        end
        entry do
            name 'Run macro "q" over multiple lines'
            notes <<-'END'
            Visual select the lines, then type:

            ```
            :normal @q
            ```
            END
        end
        entry do
            name 'Undoing a mistake'
            notes <<-'END'
            From <https://www.hillelwayne.com/post/vim-macro-trickz/>

            1. Undo and keep going normally
            2. `"qp` to paste macro `q` to an empty line
            3. Remove the mistaken keystrokes and the undo
            4. `"qy$` to copy it back in.

            I've aliased `Y` to `y$` so can do `"qY` instead:

            ```
            nnoremap Y y$
            ```
            END
        end
    end
    category do
        id 'Omni Completion'
        entry do
            name 'Choose the current option'
            command 'ESC'
        end
    end
    category do
        id 'HTML'
        entry do
            name 'Emmet completion'
            command 'C-y ,'
        end
        entry do
            name 'Next emmet field'
            notes <<-'END'
            ```
            C-y n
            ```
            END
        end
        entry do
            name 'Preivous emmet field'
            notes <<-'END'
            ```
            C-y N
            ```
            END
        end
        entry do
            name 'Surround text with tag in visual mode'
            command 'S<tag>'
        end
        entry do
            name 'Emmet, hyperlink'
            notes <<-'END'
            ```
            a[href=www.example.com]{this will become a link}
            ```
            END
        end
    end
    category do
        id 'Spellcheck'
        entry do
            name 'Start spellcheck'
            command ':setlocal spell spelllang=en_us'
        end
        entry do
            name 'Next word'
            command ']s'
        end
        entry do
            name 'Ignore word'
            command 'zg'
        end
        entry do
            name 'Suggest'
            command 'z='
        end
    end
    category do
        id 'Help'
        entry do
            name 'Describe what variable does'
            command ":help 'list'"
        end
        entry do
            name 'Help with a plugin'
            command ':help vim-go'
        end
        entry do
            name 'Look up under cursor in .vimrc'
            notes <<-'END'
            Hit `K`.

            You first need add this to your `.[n]vimrc/after/ftplugin/vim.vim`

            ```
            :setlocal keywordprg=:help
            ```

            From http://stackoverflow.com/a/15867465/742
            END
        end
    end
    category do
        id 'Snippets'
        entry do
            name 'Snippet framework plugin'
            notes 'https://github.com/SirVer/ultisnips'
        end
        entry do
            name 'Snippets'
            notes <<-'END'
            https://github.com/honza/vim-snippets
            END
        end
        entry do
            name 'create a snippet'
            notes <<-'FIN'
            1. Open a file of the type that you want associated with the snippet.
            2. `:UltiSnipsEdit`
            3. Write the snippet and save it

            Example snippet that creates cheatsheet entry:

            ```
            snippet entry "cheatsheet entry"
            entry do
                name '$1'
                notes <<-'END'
                \`\`\`
                $2
                \`\`\`
                END
            end
            endsnippet

            ```
            FIN
        end
        entry do
            name 'Next field in snippet'
            notes <<-'END'
            ```
            C-j
            ```
            END
        end
    end
    category do
        id 'ctrlp'
        entry do
            name 'Control what it ignores'
            notes <<-'END'
            My vimrc sets the `g:ctrlp_user_command` variable.

            ```
            let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard | grep -v ^vendor/']
            ```
            END
        end
    end
    category do
        id 'Sessions'
        entry do
            name 'Create a session'
            notes <<-'END'
            ```
            :mks ~/.vim/sessions/mysession.vim
            ```
            END
        end
        entry do
            name 'Load a session'
            notes <<-'END'
            ```
            :source ~/.vim/sessions/mysession.vim
            ```
            END
        end
    end
    category do
        id 'Leader shortcuts'
        entry do
            name 'Define leader key'
            notes <<-'END'
            ```
            let mapleader = ","
            ```
            END
        end
        entry do
            name 'Define a shortcut that uses leader'
            notes <<-'END'
            Note that you need to use `<cr>` to indicate where to hit enter. Think of it is as specifying
            exactly what you would type, not a command language.

            ```
            " Save the current file, add all changed files, commit, push, and reload
            noremap <leader>c :w<cr> :silent !git add . && git commit -m copyedit && git push<cr> :e<cr>
            ```
            END
        end
    end
    category do
        id  'Miscellaneous'
        entry do
            name 'Delete ruby block'
            notes <<-'END'
            ```
            dar
            ```

            (Requires rhysd/vim-textobj-ruby)
            END
        end
        entry do
            name 'Change the color scheme'
            notes <<-'END'
            Useful for me for json.

            ```
            :colorscheme slate
            ```
            END
        end
        entry do
            name 'Print'
            notes <<-'END'
            Right to the printer:

            ```
            :hardcopy
            ```

            To a file:

            ```
            :hardcopy > /path/to/file.ps
            ```

            Convert the ps to the pdf (macOS: just open the file).
            END
        end
    end
    category do
        id 'vim-plug Plugin manager'
        entry do
            name 'Package location'
            notes <<-'END'
            ```
            ~/.nvim/plugged
            ```
            END
        end
        entry do
            name 'Install plugins'
            notes <<-'END'
            ```
            :PlugInstall
            ```
            END
        end
    end
    category do
        id 'Defining new syntax types'
        entry do
            name 'Supported formatting types'
            notes <<-'END'
            ```
            :help syntax
            ```
            END
        end
    end
    category do
        id 'FZF (fuzzy finder)'
        entry do
            name 'Comments'
            notes <<-'END'
            I use junegunn/fzf.vim as a ctrlp replacement, with ctrl-p mapped to list git-tracked files.

            ```
            nnoremap <C-p> :GFiles<cr>
            ```

            END
        end
        entry do
            name 'List all files'
            notes <<-'END'
            ```
            :FZF
            ```
            END
        end
    end
end
