cheatsheet do
    title 'cassandra'
    docset_file_name 'cassandra'
    keyword 'cassandra'
    category do
        id 'Basics'
        entry do
            name 'Shell'
            notes <<-'END'
            ```
            cqlsh
            
            ```
            END
        end
        entry do
            name 'Keyspaces'
            notes <<-'END'
            ```
            describe keyspaces
            ```
            END
        end
    end
    category do
        id 'CQL queries'
        entry do
            name 'Delete rows'
            notes <<-'END'
            ```
            DELETE FROM tablename WHERE id = 79dfb128-3a63-11e7-9ef0-784f438fef77;

            DELETE FROM mykeyspace.mytable WHERE mycolumn='value';
            ```
            END
        end
        entry do
            name 'delete all rows'
            notes <<-'END'
            ```
            TRUNCATE mykeyspace.mytable
            ```
            END
        end
        entry do
            name 'Update'
            notes <<-'END'
            ```
            UPATE keyspace.tablename SET flavour='chocolate' WHERE id = 79dfb128-3a63-11e7-9ef0-784f438fef77;
            ```
            END
        end
        entry do
            name 'Get writetime'
            notes <<-'END'
            Use the writetime function, which you can't use on primary keys or indexes

            ```
            SELECT id,writetime("flavor") FROM mykeyspace.mytable;
            ```
            END
        end
    end
    category do
        id 'Alter schema'
        entry do
            name 'Add a column'
            notes <<-'END'
            ```
            alter table mytable add mycolumn int;
            ```
            END
        end
        entry do
            name 'Drop a column'
            notes <<-'END'
            ```
            alter table mytable drop mycolumn;
            ```
            END
        end
    end
    category do
        id 'System introspection'
        entry do
            name 'Verify schema change has converged'
            notes <<-'END'
            ```
            SELECT schema_version from system.local;
            ```

            There should be only one uuid.
            END
        end
    end
    category do
        id 'QueryBuilder quries'
        entry do
            name 'Select all'
            notes <<-'END'
            ```
            import com.datastax.driver.core.*;
            import com.datastax.driver.core.querybuilder.QueryBuilder;

            Session session = ...;
            Statement statement = QueryBuilder.select().all().from("mytable")
                    .where(QueryBuilder.eq("flavour", "chocolate"))
                    .setConsistencyLevel(ConsistencyLevel.LOCAL_QUORUM);

            ResultSet resultSet = session.execute(statement);

            for(Row row : resultSet) {
                String colour = row.getString("colour");
                ...
            }

            // Can also stream process like
            // resultSet.all().stream();
            ```
            END
        end
        entry do
            name 'Select one'
            notes <<-'END'
            ```java
            import com.datastax.driver.core.*;
            import com.datastax.driver.core.querybuilder.QueryBuilder;

            Session session = ...;
            Statement statement = QueryBuilder.select().all().from("tablename").where(QueryBuilder.eq("id", id));
            ResultSet resultSet = session.execute(statement);
            Row row = resultSet.one();
            ```
            END
        end
    end
    category do
        id 'Running (locally)'
        entry do
            name 'Port'
            notes <<-'END'
            ```
            9042
            ```
            END
        end
        entry do
            name 'Start in foreground'
            notes <<-'END'
            ```
            cassandra -f
            ```
            END
        end
        entry do
            name 'As a service (homebrew)'
            notes <<-'END'
            ```
            brew services start cassandra
            ```
            END
        end
        entry do
            name 'Taking up lots of space'
            notes <<-'END'
            See `/usr/local/var/lib/cassandra/commitlog`
            END
        end
    end
    category do
        id 'Running (Docker)'
        entry do
            name 'Start the container'
            notes <<-'END'
            ```
            docker run -p 9042:9042 --name cass cassandra
            ```
            END
        end
        entry do
            name 'Start cqlsh'
            notes <<-'END'
            ```
            docker exec -ti cass cqlsh
            ```
            END
        end
    end
end
