cheatsheet do
    title 'spacemacs'
    docset_file_name 'spacemacs'
    keyword 'spacemacs'
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
        id ''
        entry do
            name 'Escape shortcut'
            notes <<-'END'
            ```
            fd
            ```
            END
        end
        entry do
            name 'See also'
            notes <<-'END'
            The clojure cheat sheet has cloure spacemacs stuff
            END
        end
    end
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
            name 'Links'
            notes <<-'END'
            * [Quick start](https://github.com/syl20bnr/spacemacs/blob/master/doc/QUICK_START.org)
            * [Configuring Spacemacs: A Tutorial](http://thume.ca/howto/2015/03/07/configuring-spacemacs-a-tutorial/)
            END
        end
    end
    category do
      id 'Git'
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
    end
end
