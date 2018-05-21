cheatsheet do
    title 'r'
    docset_file_name 'r'
    keyword 'r'
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
