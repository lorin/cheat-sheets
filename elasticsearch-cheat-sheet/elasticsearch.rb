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
        entry do
            name 'Find the query for a Kibana graph'
            notes <<-'END'
            1. Select the graph
            2. Click on the little circle at the bottom with a caret (up-arrow thing) in it.
            3. Click "Request" button

            You'll now see query. 

            To get more real estate:

            1. Maximize the graph (double arrows on a graph)
            2. Click edit at the top
            3. Click the pencil at the top right
            4. Click the circle with the caret/up-arrow at the bottom of the screen
            5. Click the "Request" button
            END
        end
    end
end
