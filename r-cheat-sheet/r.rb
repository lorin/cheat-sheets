cheatsheet do
    title 'r'
    docset_file_name 'r'
    keyword 'r'
    category do
        id 'Basics'
        entry do
            name 'Data frame'
            notes <<-'END'
            ```
            x <- data.frame(
                foo=c(1,2,3),
                bar=c(4,5,6)
            )
            ```
            END
        end
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
        id 'Categorical data (factors)'
        entry do
            name 'Get the levels (values) of a factor'
            notes <<-'END'
            ```
            levels(x$color)
            ```
            END
        end
        entry do
            name 'Reorder factors'
            notes <<-'END'
            ```
            x$color <- factor(x$color, levels(x$color)[c(2,3,1)])
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
            ggplot(mapping=aes(x=p_grid, y=likelihood)) + geom_line() +
            ggtitle("Title here") + xlab("x-axis label") + ylab("y-axis label")
            ```
            END
        end
        entry do
            name 'Facet plot: dot plots side-by-side'
            notes <<-'END'
            Assuemes group, color, count

            ```r
            ggplot(x, aes(count, color)) + geom_point() + facet_grid(. ~ group)
            ```
            END
        end
        entry do
            name 'Better labeling of points'
            notes <<-'END'
            See: geom_label_repel
            END
        end
    end
    category do
        id 'distributions'
        entry do
            name 'binomial'
            notes <<-'END'
            ```
            N.heads <- 6
            N.flips <- 10
            p.heads <- 0.5
            likelihood <- dbinom(N.heads, N.flips, p.heads)
            ```
            END
        end
    end
end
