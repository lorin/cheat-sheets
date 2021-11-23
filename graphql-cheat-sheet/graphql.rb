cheatsheet do
    title 'graphql'
    docset_file_name 'graphql'
    keyword 'graphql'
    category do
        id ''
        entry do
          name 'Query with variables'
          notes <<-'END'

          Variables are declared at the top.

          ```graphql
          query($appName: String!) {
            application(appName: $appName) {
              environments {
                name,
                state {
                  resources {
                    kind
                    displayName
                  }
                }
              }
            }
          }
          ```

          Variable values are specified in the "query variables" in a json object.

          ```json
          {
            "appName": "acme"
          }
          ```
          END
        end
        entry do
          name 'Querying for multiple return types'
          notes <<-'END'
          ```
          query {
            md_application(appName: "kee") {
              ... on MD_Application {
                name
              }
              ... on MD_Error {
                message
              }
            }
          }
          ```
          END
        end
        entry do
            name 'Query for version info with verifications'
            notes <<-'END'
            ### Query

            ```
            query ($appName: String!, $statuses: [MdArtifactStatusInEnvironment!]) {
              application(appName: $appName) {
                name
                environments {
                  name
                  state {
                    artifacts {
                      name
                      type
                      versions(statuses: $statuses) {
                        ...detailedVersionFields
                      }
                    }
                    resources {
                      id
                      kind
                      displayName
                      location {
                        account
                        regions
                      }
                    }
                  }
                }
              }
            }

            fragment detailedVersionFields on MdArtifactVersionInEnvironment {
                version
                status
                verifications {
                  id
                  status
                }
              }
            ```

            ###  Query variables

            ```json
            {
              "appName": "myappname",
              "statuses": ["CURRENT"]
            }
            ```
            END
        end
    end
end
