cheatsheet do
    title 'r'
    docset_file_name 'r'
    keyword 'r'
    category do
        id 'Basics'
        entry do
            name 'Constant vector'
            notes <<-'END'
            ```
            rep(1,20)
            ```
            END
        end
        entry do
            name 'Introspect an object'
            notes <<-'END'
            ```
            typeof(x)
            str(x)
            ```
            END
        end
    end
    category do
        id 'Table manipulation'
        entry do
            name 'Schema examples'
            notes <<-'END'
            Let's say you have a table with three columns:
            * group (control, experiment)
            * color (red, green, blue, ...)
            * count (count for each (group, color) pair)
            END
        end
        entry do
            name 'Filter by color'
            notes <<-'END'
            ```
            counts.blue <- counts[counts$color == "blue", ]
            ```
            END
        end
        entry do
            name 'Outer join'
            notes <<-'END'
            You can use "merge" with an unrelated table:

            ```
            merge(counts, data.frame(p=seq(0,1,.01))
            ```
            END
        end
        entry do
            name 'Sum count by groups'
            notes <<-'END'

            ```r
            counts <- ...
            library(data.table)
            dt <- data.table(counts)
            groups <- dt[,list(count=sum(count)), by=group]
            ```
            END
        end
        entry do
            name 'Make the table wide'
            notes <<-'END'
            Sort descending by "control", put NAs at the end

            ```r
            library(data.table)
            x <- dcast(counts, color ~ group, value.var="count")
            setorder(x, -control, na.last = TRUE)
            ```
            END
        end

        
    end
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
