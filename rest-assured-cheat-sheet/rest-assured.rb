cheatsheet do
    title 'rest-assured'
    docset_file_name 'rest-assured'
    keyword 'rest-assured'
    category do
        id 'Body'
        entry do
            name 'Elements in a list'
            notes <<-'END'
            If the returned body has a field that looks like:

            ```json
            {
                "tags": [{"id":1, "name":"foo"}]
            }
            ```

            You can assert like this

            ```java
            // Update the incident
            given().port(port)
                    .when()
                    .get(url)
                    .then().assertThat()
                    .statusCode(200)
                    .and().body("tags.id", hasItem(1))
                    .and().body("tags.name", hasItem("foo"));
            ```
            END
        end
    end
end
