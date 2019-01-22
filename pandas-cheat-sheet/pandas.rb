cheatsheet do
    title 'Pandas'
    docset_file_name 'Pandas'
    keyword 'pandas'
    category do
        id 'Resources'
        entry do
            name 'Links'
            notes <<-'END'
            * [Official docs][0]
            * [Learn Pandas][1] example notebooks

            [0]: http://pandas.pydata.org/pandas-docs/stable
            [1]: https://github.com/tdpetrou/Learn-Pandas
            END
        end
    end
    category do
        id 'Inspecting a data frame'
        entry do
            name 'Column types'
            notes <<-'END'
            ```python
            df.dtypes
            ```
            END
        end
    end
    category do
        id 'Indexing and filtering'
        entry do
            name 'One column'
            notes <<-'END'
            ```python
            data.colname
            ```

            or:

            ```python
            data['colname']
            ```
            END
        end
        entry do
            name 'Filtering and indexing docs'
            notes <<-'END'
            <http://pandas.pydata.org/pandas-docs/stable/indexing.html?#boolean-operators>
            END
        end
        entry do
            name 'First 10 rows'
            notes <<-'END'
            ```python
                data.iloc[:10]
            ```
            END
        end
        entry do
            name 'Filter by column value (query)'
            notes <<-'END'
            ```python
            df.query('group == "control" and days >= 1')
            ```
            END
        end
        entry do
            name 'Filter by column value (pure Python)'
            notes <<-'END'
            ```python
            df[(df.group == 'control') & (df.days >= 1)]
            ```
            END
        end

        entry do
            name 'Pick out columns'
            notes <<-'END'
            ```python
                data[['name', 'quarter']]
            ```
            END
        end

        entry do
            name 'Sort by columns'
            notes <<-'END'
            ```python
            df.sort_values(['date', 'id'], inplace=True, ascending=False)
            ```
            END
        end

        entry do
            name 'Access a specific cell'
            notes <<-'END'
            Do .loc[ind, column]:

            ```python
                df.loc['Subtotal', 'category'] = ''
            ```
            END
        end

        entry do
            name 'Add the index to the data frame'
            notes <<-'END'
            ```python
            df['index_col'] = df.index
            ```
            END
        end

        entry do
            name 'Reset the index'
            notes <<-'END'
            Works for series as well as data frames

            ```
            df = pd.DataFrame(entries).sort_values(by='start',ascending=False)
            df.index = range(len(df))  # fix index
            ```
            END
        end

        entry do
            name 'Find row which has max column value'
            notes <<-'END'
            ```python
            df['mycol'].idxmax()
            ```
            END
        end
    end
    category do
        id 'Creating a data frame'
        entry do
            name 'Read from csv with date parsing'
            notes <<-'END'
            ```python
            import pandas as pd

            data = pds.read_csv('data.csv', parse_dates=['start', 'end'])
            ```
            END
        end
        entry do
            name 'List of dictionaries (rowwise)'
            notes <<-'END'
            (If you're using ggplot, you'll want to organize the data rowwise).

            ```python
                import pandas as pd

                entries = [{'id': 'a', 'val':5}, {'id': 'b', 'val': 8} ]
                df = pd.DataFrame(entries)
            ```
            END
        end
        entry do
            name 'List of dictionaries in json format'
            notes <<-'END'
            This assumes that there's a timestamp in epoch mililis

            ```python
            df = pd.read_json("rows.json", date_unit="ms")
            df.timestamp = df.timestamp.apply(lambda x: x.tz_localize('UTC').tz_convert('US/Pacific'))
            ```
            END
        end
        entry do
            name 'Dictionary of lists (columnwise)'
            notes <<-'END'
            ```python
                import pandas as pd

                expt = [1, 2, 14, 29,  7]
                ctrl = [2, 3, 0,  -1, 19]
                df = pd.DataFrame({'experiment': expt, 'control': ctrl}, columns=["control", "experiment"])
            ```
            END
        end

        entry do
            name 'Read from sqlite'
            notes <<-'END'
            ```python
            import pandas as pd
            from sqlalchemy import create_engine

            disk_engine = create_engine('sqlite:///db.sqlite')
            df = pd.read_sql_query("select * from mytable", disk_engine)

            # Print the first four rows
            df.head()
            ```
            END
        end

        entry do
            name 'Sort and fix index'
            notes <<-'END'
            ```python
                import pandas as pd
                entries = pd.DataFrame(...)

                data = pd.DataFrame(entries).sort_values(by='start',ascending=False)
                data.index = range(len(data)) # fix index
            END
        end
    end
    category do
        id 'Manipulating a data frame'
        entry do
            name 'Set the column names'
            notes <<-'END'
            ```
            df.columns = ['foo', 'bar', baz']
            ```
            END
        end
        entry do
            name 'String of timestamp to time'
            notes <<-'END'
            ```python
            import pandas as pd

            df.timestamp = df.timestamp.apply(lambda x: pd.to_datetime(x))
            ```
            END
        end
    end
    category do
        id 'Date & Time'
        entry do
            name 'Localize a time column'
            notes <<-'END'
            ```python
            df.timestamp = df.timestamp.apply(lambda x: x.tz_convert('US/Pacific'))
            ```
            END
        end
        entry do
            name 'String of timestamp to time'
            notes <<-'END'
            ```python
            import pandas

            df.timestamp.apply(lambda x: panads.to_datetime(x))
            ```
            END
        end
        entry do
            name 'Millis to local time (pandas)'
            notes <<-'END'
            ```python
            import pandas as pd

            def to_pst(millis):
                return pd.to_datetime(millis, unit="ms", utc=True).tz_convert("US/Pacific")
            ```
            END
        end
        entry do
            name "Convert a column to panda Timestamps"
            notes <<-'END'
             ```python
             import numpy as np
             dfdate = df.date.apply(np.datetime64)
             ```
             END
        end
        entry do
            name 'Convert from timedelta to numbres'
            notes <<-'END'
            ```python

            from datetime import timedelta
            days = df.duration / timedelta(days=1)
            years=df.duration / timedelta(days=365)
            ```
            END
        end
    end
    category do
        id 'Common things I do'
        entry do
            name 'Diff successive rows'
            notes <<-'END'
            ```pandas
            df['diff'] = (df.start.shift(-1) - df.start)/timedelta(days=1)
            ```
            END
        end
        entry do
            name 'Count elements (data frame)'
            notes <<-'END'
            ```python
            data.groupby('bar').agg(['count'])

            # Might want to subset columns
            data[['foo', 'bar']].groupby('bar').agg(['count'])
            ```
            END
        end
        entry do
            name 'Count elements (series)'
            notes <<-'END'
            ```python
            s.value_counts()
            ```
            END
        end
        entry do
            name 'Cumulative sum with columnwise data'
            notes <<-'END'
            Assuming you have data like this

            ```
            |time|  group    |     count|
            |----|-----------|----------|
            |0   |control    |        12|
            |0   |experiment |        24|
            |1   |control    |        13|
            |1   |experiment |        25|
            ```

            You can convert it to the equivalent shape cumulative by doing:

            ```python
            dfc = df.groupby(["time", "group"]).sum().groupby(level=[1]).cumsum().reset_index()
            ```

            The first group by doesn't actually do any calculations (each (time,group) group has only a single 
            element, but it puts the data in the right shape that you can then group by the "group" part and
            cumulative sum across time.

            The reset_index at the end flattens the columns.

            END
        end
        entry do
            name 'Change NA to 0'
            notes <<-'END'
            ```python
            df.fillna(0, inplace=True)
            ```
            END
        end
        entry do
            name 'Save to csv'
            notes <<-'END'
            ```python
            df.to_csv(path_or_buf='data.csv', index=False)
            ```
            END
        end
    end

    category do
        id 'Summarizing and visualizing'
        entry do
            name "Summary statistics"
            notes <<-'END'
            ```
            ser = ... # series
            ser.describe()
            ```
            This shows count, mean, std, min, 25%, 50%, 75%, max.
            END
        end
    end

    category do
        id 'Conversion'
        entry do
            name 'Convert single element numeric series to float'
            notes <<-'END'
            ```
            s = ... # single element numeric series
            x = float(s)
            ```
            END
        end
        entry do
            name 'Convert a series to a list'
            notes <<-'END'
            ```python
            s.tolist()
            ```
            END
        end
        entry do
            name 'Convert a column to categorical type of specific ordering'
            notes <<-'END'
            ```python
            kinds = ["foo", "bar', "baz"]  # ordered list of categories
            df = ...
            df.kind = pd.Categorical(df.kind, categories=kinds, ordered=True)
            ```
            END
        end
    end

    category do
        id 'Manipulation'
        entry do
            name 'Map a function over a series'
            notes <<-'END'
            ```python
            ser.apply(func)
            ```
            END
        end
    end

    category do
        id 'Aggregation'
        entry do
            name 'Counts by column value'
            notes <<-'END'
            ```python
            byquarter = data.groupby('quarter').size()
            ```
            END
        end
        entry do
            name 'Summary stats for each columns'
            notes <<-'END'
            ```python
            data.groupby('quarter').describe()
            ```
            END
        end
        entry do
            name 'Summary stats for one column'
            notes <<-'END'
            ```python
            data.groupby('quarter')['widgets'].describe()
            ```
            END
        end
        entry do
            name 'Group by column value and apply function on each group'
            notes <<-'END'
            ```python
            import numpy as np

            data.groupby('quarter').agg({'mycol': np.sum})
            ```
            END
        end
    end

    category do
        id 'Dates and times'
        entry do
            name 'Documentation'
            notes <<-'END'
            [Time Series / Date functionality](http://pandas.pydata.org/pandas-docs/stable/timeseries.html)
            END
        end
        entry do
            name "Create a Pandas timestamp"
            notes <<-'END'
            ```python
            pd.Timestamp(datetime(2012, 5, 1))
            pd.Timestamp('2012-05-01')
            ```
            END
        end
        entry do
            name "Convert from unix epoch to datetime"
            notes <<-'END'
            ```python
            dates = pd.to_datetime(df['start'],unit='s')
            ```
            END
        end
        entry do
            name 'Check if datetimes are invalid (NaT)'
            notes <<-'END'
            ```python
            import numpy as np

            np
            np.isnat(df.start)
            ```
            END
        end
    end
    category do
        id 'Formatting'
        entry do
            name 'How numbers are displayed'
            notes <<-'END'
            ```python
            import pandas as pd

            # Display numbers to 3 decimal places
            pd.options.display.float_format = '{:,.3f}'.format
            ```
            END
        end
    end
    category do
        id 'Stats'
        entry do
            name 'Linear regression'
            notes <<-'END'
            ```python
            import statsmodels.api as sm

            y = ... #
            x = ... # assume series named "xvals"
            X = sm.add_constant(x)
            results = sm.OLS(y, X).fit()
            R2 = results.rsquared
            params = results.params
            slope = params['xvals']
            yint = params['const']
            ```
            END
        end
    end
    category do
        id 'Series'
        entry do
            name 'Negate a boolean seris'
            notes <<-'END'
            ```python
            ~ np.isnat(df.start)
            ```

            Use `~`, not `not`
            END
        end
    end
    category do
        id "db.py"
        entry do
            name "Table schema"
            notes <<-'END'
             ```python
             db.tables.tablename
             ```
             END
        end
    end 
end
