cheatsheet do
    title 'Go'
    docset_file_name 'Go'
    keyword 'go'
    category do
        id 'Maps and slices'
        entry do
            name 'Length of slice'
            command 'len(x)'
        end
        entry do
            name 'Append to slice'
            command 'l = append(l, val)'
        end
        entry do
            name 'Make an empty slice with capacity 10'
            command 'make([]string, 0, 10)'
        end
        entry do
            name "Iterate over map"
            command 'for k, v := range mymap { ... }'
        end
    end
    category do
        id 'Channels'
        entry do
            name 'Create an unbuffered channel'
            command 'make(chan int)'
        end
        entry do
            name 'Create a buffered channel'
            command 'make(chan int, 5)'
        end
        entry do
            name 'Write'
            command 'ch <- 3'
        end
        entry do
            name 'Read'
            command 'val := <-ch'
        end
        entry do
            name 'Read-only'
            command 'var ch <-chan int'
        end
        entry do
            name 'Write-only'
            command 'var ch chan<- int'
        end
        entry do
            name 'Timeout'
            notes <<-'END'
            ```go
            select {
            case f = <-ch:
                // nothing to do
            case <-time.After(time.Second * 3):
                t.Fatal("timeout waiting for channel")
            }
            ```
            END
        end
    end
    category do
        id 'Errors'
        entry do
            name 'Semantic error values'
            notes <<-'END'
            ```
            var ErrNotFound = errors.New("not found")

            ...
            err = myfunc()
            if err == ErrNotFound {
            ...
            }
            ```
            END
        end
        entry do
            name 'Handling in a defer'
            notes <<-'END'
            ```
            func myfunc() (error err, ...) {

                defer func() {
                    if cerr := rows.Close(); cerr != nil && err == nil {
                        err = errors.Wrap(err, "rows.Close() failed")
                    }
                }()

            ```
            END
        end
    end
    category do
        id 'Type conversion'
        entry do
            name 'Convert from interface{} with checking'
            notes <<-'END'
            ```go
            var unknown interface{}
            unknown = ...
            s, valid := unknown.(string)
            if(!valid) {
              // Not a string!
            }
            ```
            END
        end
        entry do
            name 'Type swtich'
            notes <<-'END'
            ```go
            var t interface{}
            t = ...

            // You don't have to reuse var name, but you can
            switch t := t.(type) {
            default:
                return nil, errors.Errorf("unknown type %T", t)
            case string:
                // ...
            case int:
                // ...
            }
            ```
            END
        end
    end
    category do
        id 'File I/O'
        entry do
            name 'Read an entire file in one go'
            notes <<-'END'
            ```
            import io/ioutil
            ...
            fname := ...
            b, err := ioutil.ReadFile(fname)
            ```
            END

        end
        entry do
            name 'Write to a file in a temporary directory'
            notes <<-'END'
            ```
            import os
            ...
            dir, err := ioutil.TempDir("", "chaosmonkey")
            // check err
            err := ioutil.WriteFile(dir + "/myfile.txt", []byte("contents"), 0755)
            // check err
            ```
            END
        end
        entry do
            name 'Convert a string to an io.Reader'
            notes <<-'END'
            ```
            import bytes

            ...
            s := "this is a string"
            r := bytes.NewReader([]byte(s))
            ```
            END
            end
    end
    category do
        id 'Testing'
        entry do
            name 'Call one test function'
            notes <<-'END'
            ```
            go test github.com/org/project/package -run TestFunctionName
            ```

            Note: Even if the test is in `package_test` package, you still specify
            it as `package`.
            END
        end
        entry do
            name 'Always show logs in tests'
            notes <<-'END'
            ```
            go test ... -v
            ```
            END
        end
        entry do
            name "Suppress logging"
            notes <<-'END'
            ```go
            import (
                "io/ioutil"
                "log"
            )
                ...
            log.SetOutput(ioutil.Discard)
            ```
            END
        end
        entry do
            name 'TestMain'
            notes <<-'END'
            ```

            func TestMain(m *testing.M) {
                ...
                os.Exit(m.Run())
            }
            ```
            END
        end
        entry do
            name 'Table-driven tests'
            notes <<-'END'
            ```
            tests := []struct{
                i int
                s string
            }{
                {1, "one"},
                {2, "two"},
            }
            ```
            END
        end
    end
    category do
        id 'Function pointers'
        entry do
            name "Simple function pointer"
            command "var f func(int) string"
        end
        entry do
            name "Pointer to bound method"
            notes <<-"END"
            ```
            rex := &Dog{}
            var f func() string
            f = rex.Speak
            ```
            END
        end
        entry do
            name "Pointer to unbound method"
            notes <<-"END"
            For unbound methods, the first argument to the function is the method receiver type.

            ```
            var f func(*Dog) string
            f = (*Dog).Speak
            ```
            END
        end
        entry do
            name "Get name of method"
            notes <<-"END"
            ```
            func nameOf(f interface{}) string {
                return runtime.FuncForPC(reflect.ValueOf(f).Pointer()).Name()
            }
            ```
            END
        end
    end
    category do
        id 'networking'
        entry do
            name 'Listen on a random availabile port'
            notes <<-'END'
            ```go
            l, err := net.Listen("tcp", ":0")
            // check err
            port := l.Addr().(*net.TCPAddr).Port
            ```
            END
        end
        entry do
            name 'http server for testing'
            notes <<-'END'
            ```go
            func TestSomething(t *testing.T) {
                l, url ch := serve(t, map[string]string{"/foo": "abc", "/bar": "def"})
                defer l.Close()


                // Make calls against the url here
                ...
                var f interface{}

                select {
                case f = <-ch:
                    // nothing to do
                case <-time.After(time.Second * 3):
                    t.Fatal("timeout waiting for channel")
                }

            }

            func serve(t *testing.T, responses map[string]string, ch chan<- interface{}) (net.Listener, string) {
                l, err := net.Listen("tcp", ":0")
                if err != nil {
                    t.Fatal(err)
                }

                go func() {
                    sm := http.NewServeMux()

                    defaultPresent := false

                    for k, v := range responses {
                        if k == "/" {
                            defaultPresent = true
                        }
                        sm.HandleFunc(k, func(w http.ResponseWriter, r *http.Request) {
                            if r.Method != http.MethodPost {
                                ch <- errors.New("expected POST")
                                w.WriteHeader(http.StatusBadRequest)
                                return
                            }

                            dec := json.NewDecoder(r.Body)
                            var f interface{}
                            err := dec.Decode(&f)
                            if err != nil {
                                ch <- err
                                return
                            }

                            ch <- f

                            w.Write([]byte(v))
                        })
                    }

                    // default handler returns a 400 with an empty body
                    if !defaultPresent {
                        sm.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
                            w.WriteHeader(http.StatusBadRequest)
                        })
                    }

                    http.Serve(l, sm)

                }()

                return l, fmt.Sprintf("http://localhost:%d", l.Addr().(*net.TCPAddr).Port)
            }
            ```
            END
        end
    end
    category do
        id 'REST'
        entry do
            name 'GET'
            notes <<-'END'
            ```
            import "net/http"

            resp, err := http.Get("http://www.example.com")
            ```
            END
        end
        entry do
            name 'HTTP Client'
            notes <<-'END'
            Sometimes you need a client which can be configured different ways.

            Here's a trivial client, which you normally wouldn't use (e.g., you'd call http.Get instead)

            ```
            import "net/http"

            client := new(http.Client)
            ```
            END
        end
        entry do
            name 'Client-side TLS'
            notes <<-'END'
            ```go

            import (
                "crypto/tls"
                "encoding/pem"
                "io/ioutil"
                "net/http"

                "golang.org/x/crypto/pkcs12"
            )

            func main() {
                certPath := "/path/to/cert.p12"
                pfxData, err := ioutil.ReadFile(certPath)
                // check err
                client, err := getClient(pfxData, "password-for-p12-file")
                ...
            }

            func getClient(pfxData []byte, password string) (*http.Client, error) {
                blocks, err := pkcs12.ToPEM(pfxData, password)
                // check err

                // Assumes the first block is the cert and the last block is the private key
                certPEMBlock := pem.EncodeToMemory(blocks[0])
                keyPEMBlock := pem.EncodeToMemory(blocks[len(blocks)-1])

                cert, err := tls.X509KeyPair(certPEMBlock, keyPEMBlock)
                // check err

                tlsConfig := &tls.Config{
                    Certificates: []tls.Certificate{cert},
                }
                transport := &http.Transport{TLSClientConfig: tlsConfig}
                return &http.Client{Transport: transport}, nil
            }
            ```
            END
        end
    end
    category do
        id 'Processes'
        entry do
            name 'Run a process and block on completion'
            notes <<-'END'
            ```
            import exec

            cmd := exec.Command("myapp", "arg1", "arg2")
            err := cmd.Run()
            ```
            END
        end
        entry do
            name 'Run a process and capture the output'
            notes <<-'END'
            ```
            import exec

            cmd := exec.Command("myapp", "arg1", "arg2")
            output, err := cmd.Output()
            fmt.Sprintf("%s\n", string(output))
            ```
            END
        end
        entry do
            name 'Current working directory'
            notes <<-'END'
            ```
            import os

            dir, err := os.Getwd()
            ```
            END
        end
    end
    category do
        id 'JSON'
        entry do
            name 'Decode a string'
            notes <<-'END'
            ```
            import "encoding/json"

            s := `["foo", "bar", "baz"]`
            var vals []string
            err := json.Unmarshal([]byte(s), &vals)
            ```
            END
        end
        entry do
            name 'Decode unknown json object http response'
            notes <<-'END'
            ```
            import "encoding/json"

            resp, err := http.Get("http://www.example.com")
            // check err

            defer resp.Body.Close()

            dec := json.NewDecoder(resp.Body)

            var f interface{}
            err = dec.Decode(&f)
            // check err

            // Should be an object
            m, ok := f.(map[string]interface{})
            // check if !ok

            // If we know that "foo" is a key and value is a string
            val, ok := m["foo"].(string)

            ```
            END
        end
    end
    category do
        id 'godoc'
        entry do
            name 'Docs for github repo'
            notes <<-'END'
            `http://godoc.org/github.com/<org>/<repo>`
            END
        end
        entry do
            name 'Local doc server'
            notes <<-'END'
            Run the server:

            ```
            godoc -http=:6060
            ```

            Browse to: http://localhost:6060/pkg
            END
        end
    end
    category do
        id 'Error handling'
        entry do
            name 'Links'
            notes <<-'END'
            [Stack traces and the errors package](http://dave.cheney.net/2016/06/12/stack-traces-and-the-errors-package)
            END
        end
        entry do
            name 'New error'
            notes <<-'END'
            ```
            import "github.com/pkg/errors"

            errors.Errorf("not enough arguments, expected at least 3, got %d", len(args))
            errors.New("Error message goes here")
            ```
            END
        end
        entry do
            name 'Wrap an error from another package'
            notes <<-'END'
            ```
            import "github.com/pkg/errors"

            errors.Wrap(err, "failed to open file")
            errors.Wrapf(err, "failed to open %q", path)
            ```
            END
        end
        entry do
            name "Print stack trace"
            notes <<-'END'
            ```
            fmt.Printf("%+v\n", err)
            ```
            END
        end
    end
    category do
        id 'govendor'
        entry do
            name 'Getting started'
            notes <<-'END'
            Create the initial vendor directory and json file:

            ```bash
            govendor init
            ```
            END
        end
        entry do
            name 'Add a new dependency'
            notes <<-'END'
            1. Install it locally: `go get github.com/<org>/<repo>`
            2. Use it in your code
            3. Now you can vendor it: `govendor add +external`
            END
        end
        entry do
            name 'Update dependency'
            notes <<-'END'
            ```bash
            govendor update github.com/team/project
            ```
            END
        end
        entry do
            name 'Update all dependencies from GOPATH'
            notes <<-'END'
            ```bash
            govendor update +vendor
            ```
            END
        end
        entry do
            name 'Remove unused dependency'
            notes <<-'END'
            ```bash
            govendor remove +unused
            ```
            END
        end
    end
    category do
        id 'Templates'
        entry do
            name 'Render a text template to a file'
            notes <<-'END'
            ```
            import "text/template"
            ...

            f, err := os.Create("Makefile")
            // check error
            defer f.Close()

            text := `
            {{.Project}}.docset: {{.Project}}.rb
                cheatset generate $<
                open $@
            `
            tmpl, err := template.New("makefile").Parse(text)
            // check error

            err = tmpl.Execute(f, struct{ Project string }{"myproject"})
            // check error
            ```
            END
        end
    end
    category do
        id 'Static checking'
        entry do
            name 'GOFLAGS in examples below'
            notes <<-'END'
            For example, build tags:

            ```
            GOFLAGS=-tags mytag
            ```
            END
        end
        entry do
            name 'lint'
            notes <<-'END'
            ```
            go list $(GOFLAGS) ./... | grep -v /vendor/ | xargs -L1 golint
            ```
            END
        end
        entry do
            name 'vet'
            notes <<-'END'
            ```
            go vet $(GOFLAGS) `go list $(GOFLAGS) ./... | grep -v /vendor/`
            ```
            END
        end
        entry do
            name 'errcheck'
            notes <<-'END'
            ```
            errcheck $(GOFLAGS) -ignoretests `go list $(GOFLAGS) ./... | grep -v /vendor/`
            ```
            END
        end
        entry do
            name "Don't check return code when closing response body"
            notes <<-'END'
            ```
            command "errcheck -ignore 'io:Close' ..."
            ```
            END
        end
    end
    category do
        id 'Renaming & moving'
        entry do
            name 'Rename a function'
            notes <<-'END'
            ```bash
            gorename -tags mytag -from '"github.com/lorin/myproject/mypackage".OldName' -to NewName
            ```
            END
        end
        entry do
            name 'Rename a method'
            notes <<-'END'
            ```bash
            gorename -tags mytag -from '"github.com/lorin/myproject/mypackage".MyType.OldName' -to NewName
            ```
            END
        end
        entry do
            name 'Move a package'
            notes <<-'END'
            ```bash
            gomove github.com/lorin/project/old github.com/lorin/project/new
            ```
            END
        end
    end
    category do
        id 'Build tags'
        entry do
            name 'Add a custom build tag'
            notes <<-'END'
            ```go
            // +build mytag

            // Tag must be followed by a blankl ine!
            ```
            END
        end
        entry do
            name 'Build with tag'
            notes <<-'END'
            ```bash
            go build -o myapp-bin -tags mytag github.com/lorin/myapp
            ```
            END
        end
        entry do
            name 'Multiple tags'
            notes <<-'END'
            ```bash
            go build -o myapp-bin -tags 'mytag1 mytag2' github.com/lorin/myapp
            ```
            END
        end
    end
    category do
        id 'Database'
        entry do
            name 'Transaction'
            notes <<-'END'
            ```go
            import (
                "database/sql"
                _ "github.com/go-sql-driver/mysql"
            )

            func do() (err error) {

                db, err := sql.Open("mysql", "user:passwd@tcp(127.0.0.1:3306)/mydb")
                // check err

                tx, err := db.Begin()
                // check err

                defer func() {
                    switch err {
                    case nil:
                        err = tx.Commit()
                    default:
                        _ = tx.Rollback()
                    }
                }()

                _, err = tx.Exec(...)
                rows, err = tx.Query(...)
            }

            ```
            END
        end
        entry do
            name 'Get error number (MySQL)'
            notes <<-'END'
            ```go
            var errno int

            switch err := errors.Cause(err).(type) {
            case *mysql.MySQLError:
                errno = err.Number
            default:
                ...
            }
            ```

            Above assumes using github.com/pkg/errors

            Error message references:

             * [MySQL site](https://dev.mysql.com/doc/refman/5.6/en/error-messages-server.html)
             * [VividCortex/mysqlerror](https://github.com/VividCortex/mysqlerr/blob/master/mysqlerr.go)

            END
        end
    end
end

