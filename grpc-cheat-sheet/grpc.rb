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
            name 'Generate client stubs into api dir'
            notes <<-'END'
            ```
            protoc -I root/dir/of/prot/files --gofast_out=\
            Mgoogle/protobuf/empty.proto=github.com/gogo/protobuf/types,\
            Mgoogle/protobuf/any.proto=github.com/gogo/protobuf/types,\
            Mgoogle/protobuf/duration.proto=github.com/gogo/protobuf/types,\
            Mgoogle/protobuf/struct.proto=github.com/gogo/protobuf/types,\
            Mgoogle/protobuf/timestamp.proto=github.com/gogo/protobuf/types,\
            Mgoogle/protobuf/wrappers.proto=github.com/gogo/protobuf/types,\
            plugins=grpc:api \
            foo/bar/baz.proto \
            foo/bar/quux.proto
            ```
            END
        end
    end
end
