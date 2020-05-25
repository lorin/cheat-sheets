cheatsheet do
    title 'spacemacs'
    docset_file_name 'spacemacs'
    keyword 'spacemacs'
    category do
      id 'Configuring'
      entry do
        name 'Open config file'
        notes <<-'END'
            ```
            SPC f e d
            ```
            END
      end
      entry do
        name 'Reload .spacemacs'
        notes <<-'END'
            ```
            SPC f e R
            ```
            END
      end
      entry do
        name 'persistent emacs'
        notes <<-'END'
        In the config file, set `dotspacemacs-persistent-server` to either `t` or `nil`
        END
      end
      entry do
        name 'Close window without killing server'
        notes <<-'END'
        ```
        SPC q z
        ```
        END
      end
      entry do
        name 'Restart emacs'
        notes <<-'END'
          ```
          SPC q R
          ```
          END
      end
      entry do
        name 'Links'
        notes <<-'END'
            * [Quick start](https://github.com/syl20bnr/spacemacs/blob/master/doc/QUICK_START.org)
            * [Configuring Spacemacs: A Tutorial](http://thume.ca/howto/2015/03/07/configuring-spacemacs-a-tutorial/)
            END
      end
    end
    category do
        id 'Navigating'
        entry do
            name 'Last buffer'
            notes <<-'END'
            ```
            SPC tab
            ```
            END
        end
    end
    category do
        id 'Markdown'
        entry do
            name 'Key bindings reference'
            notes <<-'END'
            <https://develop.spacemacs.org/layers/+lang/markdown/README.html#key-bindings>
            END
        end
        entry do
            name 'Italics'
            notes <<-'END'
            ```
            SPC m x i
            ```
            END
        end
    end
    category do
      id 'Themes'
      entry do
        name 'Cycle themes'
        notes <<-'END'
          ```
          SPC T n
          ```
          END
      end
    end
    category do
        id 'Basics'
        entry do
            name 'Escape shortcut'
            notes <<-'END'
            ```
            fd
            ```
            END
        end
        entry do
          name 'Open a file with auto-complete'
          notes <<-'END'
          ```
          SPC f f
          ```
          END
        end
        entry do
          name 'Run an Emacs command'
          notes <<-'END'
          ```
          SPC SPC
          ```
          END
        end
        entry do
          name 'Evaluate elisp'
          notes <<-'END'
          ```
          Opt :
          ```
          END
        end
        entry do
          name 'Inspect a variable'
          notes <<-'END'
          ```
          SPC h d v buffer-file-name
          ```

          Example: variable buffer-file-name
        END
        end
        entry do
            name 'See also'
            notes <<-'END'
            The clojure cheat sheet has clojure spacemacs stuff
            END
        end
    end
    category do
      id 'Git'
      entry do
        name 'magit'
        notes <<-'END'
        ```
        SPC g s - bring up magit status
        s - stage file
        c - commit file
        p - push file
        ```
        END
      end

      entry do
        name 'Toggle git gutter'
        notes <<-'END'
          ```
          SPC T d
          ```
          END
      end
      entry do
        name 'Stage and commit'
        notes <<-'END'
        ```
        spc g . w
        spc g . C
        ```
        END
      end
    end
    category do
      id 'Snippets'
      entry do
        name 'autocomplete'
        notes <<-'END'
        ```
        Alt-/
        ```

        Alas, can't use tab
        END
      end
      entry do
        name 'Create a snippet'
        notes <<-'FIN'
        This example is for a snippet named "entry" that works for Ruby files.

        Filename: `~/.emacs.d/private/snippets/ruby-mode/entry`

        ```
        # -*- mode: snippet -*-
        #name : cheatset entry
        #key : entry
        # --
        entry do
        name '$0'
        notes <<-'END'
                  \`\`\`

                  \`\`\`
                  END
        end
        ```

        Filename: `~/.emacs.d/private/snippets/ruby-mode/category`

        ```
        # -*- mode: snippet -*-
        #name : cheatset category
        #key : category
        # --
        category do
        id '$0'

        end
        ```
        FIN
      end
    end
    category do
      id 'Moving from vim'
      entry do
        name 'Switch to normal mode with control space'
        notes <<-'END'
        ```
        (defun dotspacemacs/user-config ()

          (global-set-key (kbd "C-SPC") 'evil-escape)
          )
        ```
        END
      end
      entry do
        name 'ControlP equivalent'
        notes <<-'END'
        ```
        SPC p f
        ```

        For more details: <https://github.com/syl20bnr/spacemacs/issues/1544>
        END
      end
      entry do
        name 'Clear highlight search'
        notes <<-'END'
        ```
        SPC s c
        :nohl
        ```
        END
      end
    end
end
