cheatsheet do
    title 'time'
    docset_file_name 'time'
    keyword 'time'
    category do
        id 'UTC offset'
        entry do
            name 'Show offset'
            notes <<-'END'
            ```
            date "+%z"
            ```
            END
        end
        entry do
            name 'Offsets from PT'
            notes <<-'END'
            * PST: -8
            * PDT: -7
            END
        end
        entry do
            name "Today's date"
            notes <<-'END'
            ```
            date -u "+%F"
            ```
            END
        end
        entry do
            name 'Convert to local time zone'
            notes <<-'END'
            ```
            $ dateconv --zone "America/Los_Angeles" -f "%I:%M:%S %p" "2021-02-19T22:02:34.126Z"
            02:02:34 PM
            ```
            END
        end
        entry do
            name '60 days from today'
            notes <<-'END'
            ```
            dateadd $(date -u "+%F") +60
            d
            ```
            END
        end
    end
    category do
        id 'RFC3339'
        entry do
            name 'Go reference time'
            notes <<-'END'
            ```
            2006-01-02T15:04:05Z07:00
            ```
            END
        end
        entry do
            name 'Now in UTC (macOS)'
            notes <<-'END'
            ```
            date -u "+%FT%TZ"
            ```

            Example:

            ```
            2016-09-04T06:27:50Z
            ```
            END
        end
        entry do
            name 'Now with timezone offset (macOS)'
            notes <<-'END'
            ```
            date "+%FT%T%z"
            ```

            Example:

            ```
            2016-09-03T23:28:10-0700
            ```

            Except you need to add a colon to the offset, so manually edit to:

            ```
            2016-09-03T23:28:10-07:00
            ```
            END
        end
        entry do
            name "Convert to Unix epoch time in Python (arrow)"
            notes <<-'END'
            ```
            import arrow
            s = "2006-01-02T15:04:05.000-0700"
            ts = arrow.get(s).timestamp
            ts
            ```

            Output:
            ```
            1136239445
            ```
            END
        end
    end
    category do
        id 'Epoch time'
        entry do
            name 'Now in epoch time (macOS terminal)'
            notes <<-'END'
            ```bash
            date "+%s"
            ```

            I have this zsh alias for epoch to show epoch millis

            ```
            alias epoch="echo -n `date '+%s'`000 | tee >(pbcopy) && echo"
            ```
            END
        end
        entry do
            name 'Date to epoch millis (macOS terminal)'
            notes <<-'END'
            ```
            $ gdate -d "08-Aug-2018 09:00" +%s%3N
            1533744000000
            ```

            You need to `brew install coreutils` to get gdate
            END
        end
        entry do
            name 'Epoch millis to date (macOS terminal)'
            notes <<-'END'
            ```
            MILLIS=...
            date -r ${MILLIS%???}
            ```

            Thu Aug  1 15:42:22 PDT 2019
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
            name 'Millis to local time (arrow)'
            notes <<-'END'
            ```
            import arrow

            def to_pst(millis):
               return arrow.get(millis / 1000).to('US/Pacific') 

            >>> to_pst(1487193135000)
            <Arrow [2017-02-15T13:12:15-08:00]>
            ```
            END
        end
        entry do
            name 'Non-UTC to epoch'
            notes <<-'END'
            ```
            >>> import arrow
            >>> tz = 'US/Pacific'
            >>> arrow.get('2017-02-22 14:18').replace(tzinfo=tz).timestamp
            1487801880
            ```
            END
        end
    end
    category do
        id 'Python'
        entry do
            name 'Parse ISO-8601'
            notes <<-'END'
            ```
            import datetime

            ts = "2020-03-05T18:04:58.576+00:00"
            t = datetime.datetime.fromisoformat(ts)
            ```
            END
        end
        entry do
            name 'Time zones'
            notes <<-'END'
            ```
            import pytz

            utc = pytz.timezone('UTC')
            pst = pytz.timezone('America/Los_Angeles')
            ```
            END
        end
    end
    category do
        id 'ISO 8601 durations'
        entry do
            name 'General syntax'
            notes <<-'END'
            ```
            P[n]Y[n]M[n]DT[n]H[n]M[n]S
            ```

            * P is the duration designator (for period) placed at the start of the duration representation.
            * Y is the year designator that follows the value for the number of years.
            * M is the month designator that follows the value for the number of months.
            * W is the week designator that follows the value for the number of weeks.
            * D is the day designator that follows the value for the number of days.
            * T is the time designator that precedes the time components of the representation.
            * H is the hour designator that follows the value for the number of hours.
            * M is the minute designator that follows the value for the number of minutes.
            * S is the second designator that follows the value for the number of seconds.

            Taken from Wikipedia ISO 8601 entry.
            END
        end
        entry do
            name 'Example'
            notes <<-'END'
            `PT20m` - 20 minute duration
            END
        end
    end
end
