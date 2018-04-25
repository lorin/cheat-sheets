cheatsheet do
    title 'Git'
    docset_file_name 'Git'
    keyword 'git'
    category do
        id ''
        entry do
            name 'Set upstream for current branch'
            notes <<-'END'
            ```
            git branch -u origin/my-branch
            ```
            END
        end
        entry do
            name 'Useful links'
            notes <<-'END'
            <https://csswizardry.com/2017/05/little-things-i-like-to-do-with-git/>
            END
        end
        entry do
            name 'Set email on local repo'
            notes <<-'END'
            ```
            git config user.email "email@example.com"
            ```
            END
        end
        entry do
            name 'Get an old version of a file with rename'
            notes <<-'END'
            ```
            git show SHA:path/to/file > file-old
            ```
            END
        end
    end
    category do
        id 'ignore'
        entry do
            name 'Ignore locally'
            notes <<-'END'
            add to `.git/info/exclude`
            END
        end
        entry do
            name 'Ignore checked-in files'
            notes <<-'END'
            You can delete the files from git without deleted them from the file system

            ```
            git rm -r --cached dirname
            ```

            Then you can git-ignore.

            See <https://stackoverflow.com/a/1330097/742>
            END
        end
        entry do
            name 'Ignore all untracked files'
            notes <<-'END'
            I have a `git ignore` alias from [Stack Overflow](https://stackoverflow.com/a/15142010/742):


            ```
            [alias]
                ignore = "!echo \"$(git status --porcelain | grep '^??' | cut -c4-)\" >> .gitignore"
            ```
            END
        end
    end
    category do
        id 'log'
        entry do
            name 'Show diffs'
            notes <<-'END'
            ```
            git log -p myfile
            ```
            END
        end
        entry do
            name 'Date range'
            notes <<-'END'
            ```
            git log --after=2017-12-01 --until=2017-12-31
            ```
            END
        end
    end
    category do
        id 'stash'
        entry do
            name 'Stash untracked files'
            notes <<-'END'
            ```
            git stash save -u
            ```
            END
        end
    end
    category do
        id 'diffs'
        entry do
            name 'Word-level diffs'
            notes <<-'END'
            ```
            git diff --word-diff
            ```
            END
        end
        entry do
            name 'List changed files'
            notes <<-'END'
            ```
            git diff --name-only master
            ```
            END
        end
    end
    category do
        id 'rebase'
        entry do
            name 'Run a test against each commit'
            notes <<-'END'
            ```
            git rebase -i --exec "make test" master
            ```
            END
        end
        entry do
            name 'Break up an old commit'
            notes <<-'END'
            Steps:

                1. `git rebase -i master`

                2. Change "pick" to "edit"

                3. `git reset HEAD~`

                4. "git add, git commit"

                5. `git rebase --continue`
            END
		end
    end
    category do
        id 'creating new branches'
        entry do
            name 'Create an orphaned branch'
            notes <<-'END'
            ```
            git checkout --orphan mybranch
            git rm -rf .
            ...
            git commit -m 'initial commit'

            ```
            END
        end
    end
    category do
        id 'tags'
        entry do
            name 'add a tag'
            command 'git tag -a tagname'
        end
        entry do
            name 'push tag'
            command 'git push origin tagname'
        end
    end
    category do
        id 'merge'
        entry do
            name 'Clobber one branch with another w/o losing history'
            notes <<-'END'
            Via [Stack Overflow][1]

            ```bash
            git checkout newhotness
            git merge -s ours master
            git checkout master
            git merge newhotness
            ```

            [1]: http://stackoverflow.com/a/2862938/742
            END
        end
    end
    category do
        id 'Ancestry'
        entry do
            name 'Is sha1 an ancestor of sha2?'
            notes <<-'END'
            From <https://stackoverflow.com/a/13526591/742>

            ```
            git merge-base --is-ancestor <maybe-ancestor-commit> <descendant-commit>
            ```

            It doesn't produce any output, but returns 0 on success, 1 on failure.
            END
        end
        entry do
            name 'Most recent common ancestor'
            notes <<-'END'
            ```
            git merge-base feature master
            
            ```
            END
        end
    end
    category do
        id 'revert'
        entry do
            name 'Revert merge commit'
            notes <<-'END'
            ```
            git revert -m [1|2]
            ```
            END
        end
    end
    category do
        id 'bisect'
        entry do
            name 'Automated with a script'
            notes <<-'END'
            Here we have a script called present.sh that just looks like this:

            ```
            grep --silent myFunc foo/bar/baz.c
            ```

            Then we do this:

            ```
            git bisect start master 8c31fabcf2c
            git bisect run ./present.sh
            ```

            It will run until it finds the diff.
            END
        end
    end
    category do
        id 'submodule'
        entry do
            name 'De-submodule'
            notes <<-'END'
            This will lose history.  Here's a zsh script I used,
            based on <https://stackoverflow.com/a/16162228/742>

            ```
            #!/usr/local/bin/zsh
            set -eu

            for d in $(ls -d *cheat-sheet); do
                echo $d
                mv $d "${d}_tmp"
                git submodule deinit $d
                git rm $d
                mv "${d}_tmp" $d
                rm -rf "${d}"/.git
                git add $d
            done
            ```
            END
        end
    end
end

