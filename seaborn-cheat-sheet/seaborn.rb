cheatsheet do
    title 'seaborn'
    docset_file_name 'seaborn'
    keyword 'seaborn'
    category do
        id 'Histograms & distributions'
        entry do
            name 'Estimate distribution'
            notes <<-'END'
            ```python
            import seaborn as sns
            sns.distplot(days).set_title("Days between events")
            ```
            END
        end
        entry do
            name 'Histogram: counts only'
            notes <<-'END'
            ```python
            import seaborn as sns
            sns.distplot(days, kde=False).set_title("Days between events")
            ```
            END
        end
        entry do
            name 'Plotting an exponential over the graph'
            notes <<-'END'
            ```python
            import numpy as np

            N = 100
            x = np.linspace(0, 25, N)
            lamb = 1/3
            y = lamb * np.exp(-1*lamb*x)

            graph = sns.distplot(days)
            graph.plot(x,y)
            graph.set_title("Days between events")
            ```
            END
        end
    end
end
