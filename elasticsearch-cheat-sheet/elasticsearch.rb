cheatsheet do
    title 'ElasticSearch & Kibana'
    docset_file_name 'elasticsearch'
    keyword 'elasticsearch'
    category do
        id 'ElasticSearch queries'
        entry do
            name 'Specific entry, columns and number of hits'
            notes <<-'END'
            ```
            GET _search
            {
             "_source": ["color", "flavor", "size"],
             "size": 10
             "query": {
              "term": {"mycolumn": "foobar"}
            }
            
            ```
            You can leave out _source and size.

            "term" does an exact match.
            END
        end
    end
    category do
        id 'Kibana'
        entry do
            name 'Console for ElasticSearch queries'
            notes <<-'END'
            1. Click on "Dev Tools"
            END
        end
    end
end
