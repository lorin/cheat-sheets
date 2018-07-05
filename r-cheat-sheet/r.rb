cheatsheet do
    title 'r'
    docset_file_name 'r'
    keyword 'r'
    category do
        id 'Data frame basics'
        entry do
            name 'Create a data frame'
            notes <<-'END'
            ```r
            x <- data.frame(
                foo=c(1,2,3),
                bar=c(4,5,6)
            )
            ```
            END
        end
        entry do
            name 'Summarize a data frame'
            notes <<-'END'
            ```r
            str(d)
            ```

            Output looks like:

            ```
            'data.frame':	544 obs. of  4 variables:
             $ height: num  152 140 137 157 145 ...
             $ weight: num  47.8 36.5 31.9 53 41.3 ...
             $ age   : num  63 63 65 41 51 35 32 27 19 54 ...
             $ male  : int  1 0 0 1 0 1 0 1 0 1 ...
            ```
            END
        end
        entry do
            name 'Get a column'
            notes <<-'END'
            ```r
            d$height
            ```
            END
        end
        entry do
            name 'Filter rows'
            notes <<-'END'
            ```r
            d2 <- d[d$age >= 18, ]
            ```
            END
        end
    end
    category do
        id 'Basics'
        entry do
            name 'Constant vector'
            notes <<-'END'
            ```r
            rep(1,20)
            ```
            END
        end
        entry do
            name 'Counting sequence'
            notes <<-'END'
            ```r
            seq(from=0, to=1, length.out=100)
            seq(from=0, to=1, by=0.01)
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
            ```r
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
        id 'Data frame manipulation'
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
            name 'Histogram from vector'
            notes <<-'END'
            ```r
            ggplot(mapping = aes(samples)) + geom_histogram()
            ```
            END
        end
        entry do
            name 'Better labeling of points'
            notes <<-'END'
            See: `geom_label_repel`
            END
        end
        entry do
            name 'Area under part of the curve'
            notes <<-'END'
            ```r
            globe <- data.frame(p=p_grid, posterior=posterior)
            domain <- p_grid<=0.4
            ggplot(globe, aes(p, posterior)) + geom_line() + geom_area(data=globe[domain, ], mapping = aes(p, posterior))
            ```
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
            samples <- rbinom(1e4, N.flips, p.heads)
            ```
            END
        end
    end
    category do
        id 'Odds & ends'
        entry do
            name 'Integral (cumulative)'
            notes <<-'END'
            ```
            cumsum(x)
            ```
            END
        end
    end
end
