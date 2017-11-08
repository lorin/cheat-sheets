cheatsheet do
    title 'grpc'
    docset_file_name 'grpc'
    keyword 'grpc'
    category do
        id 'Go (regular)'
        entry do
            name 'Prereqs'
            notes <<-'END'
            ```
            brew install protobuf
            go get google.golang.org/grpc
            ```
            END
        end
        entry do
            name 'Genreate client stubs'
            notes <<-'END'
            ```
            protoc --go_out=. -I root/dir/of/prot/files foo/bar/baz.proto
            ```
            END
        end

        entry do
            name 'Go with Gadgets'
            notes <<-'END'
            ```
            go get github.com/gogo/protobuf/protoc-gen-gofast
            ```
            END
        end
        entry do
            name 'Generate client stubs'
            notes <<-'END'
            ```
            protoc --gofast_out=. -I root/dir/of/prot/files foo/bar/baz.proto
            ```
            END
        end
    end
end
