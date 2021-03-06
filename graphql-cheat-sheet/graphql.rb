cheatsheet do
    title 'graphql'
    docset_file_name 'graphql'
    keyword 'graphql'
    category do
        id ''
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
