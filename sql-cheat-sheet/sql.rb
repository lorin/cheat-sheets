cheatsheet do
    title 'sql'
    docset_file_name 'sql'
    keyword 'sql'
    category do
        id 'Selections'
        entry do
            name 'Inner join'
            notes <<-'END'
            ```sql
            SELECT count(*) FROM widgets INNER JOIN widgets_colors r on widgets.id = r.widget_id;
            ```

            You can also leave out the `INNER`.
            END
        end
        entry do
            name 'Number of colors that each widget comes in'
            notes <<-'END'
            ```sql
            SELECT id, count(r.color_id) as colors FROM widgets INNER JOIN widgets_colors r on widgets.id = r.widget_id GROUP BY id;
            ```
            END
        end
    end
    category do
        id 'Insertions'
        entry do
            name 'Specify columns'
            notes <<-'END'
            ```sql
            INSERT INTO mytable (colour, flavour) VALUES ('green', 'chocolate');
            ```
            END
        end
    end
    category do
        id 'Updates'
        entry do
            name 'Basic update'
            notes <<-'END'
            ```sql
            update tags_tickets set tag_id=15 where tag_id=35;
            ```
            END
        end
    end
    category do
        id 'Deletions'
        entry do
            name 'Delete all entries'
            notes <<-'END'
            ```sql
            DELETE from mytable
            ```
            END
        end
        entry do
            name 'Delete entries'
            notes <<-'END'
            ```sql
            DELETE from mytable WHERE column=value;
            ```
            END
        end
    end
end
