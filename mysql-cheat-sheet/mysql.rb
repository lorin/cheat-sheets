cheatsheet do
    title 'mysql'
    docset_file_name 'mysql'
    keyword 'mysql'
    category do
        id 'json'
        entry do
            name 'Query a json field'
            notes <<-'END'
            ```sql
            select spec->"$.moniker" from active_resource where kind='titus/cluster@v1';
            ```
            END
        end
    end
    category do
        id 'admin / perf'
        entry do
            name 'Show the current status of processes / threads'
            notes <<-'END'
            ```
            -- As root
            show processlist
            ```
            END
        end
      entry do
          name 'Kill / terminate process'
          notes <<-'END'
          ```
          kill <id>
          ```
          END
      end
      entry do
          name 'See blocking / blocked queries'
          notes <<-'END'
          ```mysql
          SELECT
          r.trx_id waiting_trx_id,
          r.trx_mysql_thread_id waiting_thread,
          r.trx_query waiting_query,
          b.trx_id blocking_trx_id,
          b.trx_mysql_thread_id blocking_thread,
          b.trx_query blocking_query
          FROM       information_schema.innodb_lock_waits w
          INNER JOIN information_schema.innodb_trx b
            ON b.trx_id = w.blocking_trx_id
          INNER JOIN information_schema.innodb_trx r
            ON r.trx_id = w.requesting_trx_id;
          ```

          The column `waiting_thread` is the thread id for the blocked one.
          Column `blocking_thread` is for the thread that blocking others.
          END
      end
      entry do
          name 'Check all write operaitons'
          notes <<-'END'
          ```mysql
          select * from information_schema.innodb_trx\G
          ```

          The column `trx_state` would show "LOCK_WAIT" for blocked transactions.
          The `trx_mysql_thread_id` will identify the blocked thread.
          END
      end
    end
    category do
        id 'Basics'
        entry do
            name 'port'
            command '3306'
        end
        entry do
            name 'Connect to remote host (prompt for password)'
            notes <<-'END'
            ```
            mysql -u $USER -h $HOSTNAME [$DBNAME] -p
            ```
            END
        end
        entry do
            name 'Connect to local container on a port'
            notes <<-'END'
            ```
            mysql -h 127.0.0.1 -P 6603 -u root -psa
            ```
            END
        end
        entry do
            name 'Tables'
            notes <<-'END'
            ```
            mysql> show tables;
            ```
            END
        end
    end
    category do
        id 'Docker'
        entry do
            name 'Container info'
            notes <<-'END'
            https://hub.docker.com/_/mysql/
            END
        end
        entry do
            name 'Initialize a container'
            notes <<-'END'
            * Put .sh, .sql or .sql.gz in dir mounted at /docker-entrypoint-initdb.d

            Then do:

            ```
            docker run -v /path/to/sql:/docker-entrypoint-initdb.d ...
            ```

            END
        end
        entry do
            name 'Run inside a container'
            notes <<-'END'
            ```bash
            docker run --name mysql -d -e MYSQL_ROOT_PASSWORD=password -p3306:3306 mysql:5.6
            ```
            END
        end
        entry do
            name 'connect to container'
            notes <<-'END'
            If you use "localhost", mysql client defaults to unix domain sockets,
            so you must use (assumes password is "password"):

            ```bash
            mysql -h 127.0.0.1 -u root -ppassword
            ```

            Alternately, you can specify --protocol:

            ```bash
            mysql --protocol tcp -u root -ppassword
            ```

            END
        end
    end
    category do
        id 'Dates and times'
        entry do
            name 'Set the session time zone'
            notes <<-'END'
            ```
            SET time_zone=utc;
            ```
            END
        end
        entry do
            name 'Check the current time zone setting'
            notes <<-'END'
            ```sql
            SELECT @@global.time_zone, @@session.time_zone;
            ```
            END
		end
    end
    category do
        id 'Homebrew'
        entry do
            name 'Stop mysql'
            notes <<-'END'
            ```bash
            brew services stop mysql
            ```
            END
        end
    end
end
