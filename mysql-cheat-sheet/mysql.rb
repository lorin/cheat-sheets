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
        id 'admin'
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
