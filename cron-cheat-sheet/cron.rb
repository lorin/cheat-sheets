cheatsheet do
    title 'cron'
    docset_file_name 'cron'
    keyword 'cron'
    category do
        id ''
        entry do
            name 'Format (/etc/cron.d)'
            notes <<-'END'
            ```
            ┌───────────── minute (0 - 59)
            │ ┌───────────── hour (0 - 23)
            │ │ ┌───────────── day of month (1 - 31)
            │ │ │ ┌───────────── month (1 - 12)
            │ │ │ │ ┌───────────── day of week (0 - 6) (Sunday to Saturday)
            │ │ │ │ │                                       
            │ │ │ │ │
            │ │ │ │ │
            M H d m w  user /command/to/execute
            ```

            Adapted from wikipedia page.
            cron.d incldues user that the other cron format doesn't.
            END
        end
    end
end
