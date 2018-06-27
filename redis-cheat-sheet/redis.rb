cheatsheet do
    title 'redis'
    docset_file_name 'redis'
    keyword 'redis'
    category do
        id 'Basics'
        entry do
            name 'Port'
            notes <<-'END'
            6379
            END
        end
    end
    category do
        id 'Homebrew'
        entry do
            name 'Start up once'
            notes <<-'END'
            ```
             redis-server /usr/local/etc/redis.conf
            ```
            END
        end
        entry do
            name 'Start up on boot'
            notes <<-'END'
            ```
            brew services start redis
            ```
            END
        end
    end
end
