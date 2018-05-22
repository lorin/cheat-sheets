cheatsheet do
    title 'r'
    docset_file_name 'r'
    keyword 'r'
    category do
        id 'R notebook'
        entry do
            name 'Insert code chunk'
            notes <<-'END'
            ```
            Cmd+Option+I
            ```
            END
        end
        entry do
            name 'Evaluate code chunk'
            notes <<-'END'
            You need to put `{r}` after the code fence.

            To evaluate: Cmd+Shift+Enter
            END
        end
        entry do
            name 'HTML preview'
            notes <<-'END'
            ```
            Cmd+Shift+K
            ```
            END
        end
    end
    category do
        id 'ggplot'
        entry do
            name 'Simple line plot'
            notes <<-'END'
            ```r
            library(ggplot2)
            p_grid = seq(from=0, to=1, length.out=20)
            likelihood = dbinom(6, size=9, prob=p_grid)
            ggplot(mapping=aes(x=p_grid, y=likelihood))+geom_line()
            ```
            END
        end
    end
end
