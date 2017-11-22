cheatsheet do
    title 'clojure'
    docset_file_name 'clojure'
    keyword 'clojure'
    category do
        id 'spacemacs'
        entry do
            name 'Docs'
            notes <<-'END'
            <http://spacemacs.org/layers/+lang/clojure/README.html>
            END
        end
        entry do
            name 'Jump back from doc buffer'
            notes <<-'END'
            ```
            SPC 1
            ```
            END
        end
        entry do
          name 'Connect to existing repl'
          notes <<-'END'
          ```
          SPC m s c
          localhost
          9999
          ```
          END
        end
        entry do
            name 'Open repl'
            notes <<-'END'
            ```
            SPC m s s
            
            ```
            END
        end
        entry do
            name 'Start new repl'
            notes <<-'END'
            ```
            SPC m s i
            ```

            Note: expects the file to be in a lein project (see above).
            END
        end
        entry do
            name 'Evaluate expression'
            notes <<-'END'
            ```
            SPC m e e
            ```
            END
        end
        entry do
            name 'Evaluate region'
            notes <<-'END'
            ```
            <space> m e r
            ```
            END
        end
        entry do
            name 'Help on function'
            notes <<-'END'
            ```
            <space> m h h 
            ```

            * `SPC 1` to switch buffers 
            * `q` to close help
            END
        end
    end
    category do
        id 'Basic stuff'
        entry do
            name 'zip'
            notes <<-'END'
            Call `map` using a function that takes multiple args,
            and then pass each seq as a separate arg:

            ```
            > (map vector '(1 2 3) '("a" "b" "c"))
            ([1 "a"] [2 "b"] [3 "c"])
            ```
            END
        end
    end
    category do
        id 'HTTP client'
        entry do
            name 'build.gradle'
            notes <<-'END'
            ```
            dependencies {
              compile 'org.clojure:clojure:1.8.0'
              compile 'org.clojure:data.json:0.2.3'
              compile "clj-http:clj-http:3.7.0"
            }
            ```

            It's just the clj-http, but you'll always want clojure and data.json
            END
        end
        entry do
            name 'Return the body of a request'
            notes <<-'END'
            ```
            (ns myns
              (:require [clj-http.client :as client])
              (:refer-clojure))

            (:body client/get "http://www.example.com")
            
            ```
            END
        end
    end
    category do
        id 'lein'
        entry do
            name 'New project'
            notes <<-'END'
            ```
            lein new app my-appname
            ```

            Note: this will create a new directory named my-appname
            and put the files in there.

            The main file is: `myappname/src/myap_appname/core.clj`
            END
        end
        entry do
            name 'Run'
            notes <<-'END'
            ```
            lein run
            ```
            END
        end
        entry do
            name 'repl'
            notes <<-'END'
            ```
            lein repl
            ```
            END
        end
    end
    category do
        id 'IntelliJ'
        entry do
            name 'Plugin'
            notes <<-'END'
            ```
            Preferences -> Plugins -> Browse repositories ... -> Cursive
            ```
            END
        end
        entry do
            name 'Run a REPL'
            notes <<-'END'
            ```
            (Run configurations) -> Edit configurations... -> + -> Clojure REPL -> Local
            ```
            END
        end
    end
    category do
        id 'Defining things'
        entry do
            name 'Function: defn'
            notes <<-'END'
            ```
            (defn foo [x] (+ x 1))
            ```
            END
        end
        entry do
            name 'Anonymous function: fn'
            notes <<-'END'
            ```
            (fn [x] (+ x 2))
            ```
            END
        end
        entry do
            name 'Anonymous function: #(%)'
            notes <<-'END'
            ```
            #(+ % 3)
            ```
            END
        end
        entry do
            name 'Local name: def'
            notes <<-'END'
            ```
            (def myfunc (fn [x] (+ x 2)))
            ```
            END
        end
    end
    category do
        id ''
        entry do
            name 'Loops with loop/recur'
            notes <<-'END'
            ```
            ; sum numbers from 1 to 10

            (loop [x 10 running_total 0]
                (if (= x 0)
                    running_total
                    (recur (- x 1) (+ running_total x))))
            ```
            END
        end
    end
    category do
        id 'Collections'
        entry do
            name 'Add one element to a collection: conj'
            notes <<-'END'
            ```
            (conj coll elt)
            ```
            END
        end
        entry do
            name 'Add many elements to a collection: into'
            notes <<-'END'
            ```
            (into coll elts)
            ```
            END
        end
    end
    category do
        id 'Destructuring'
        entry do
            name 'Lists'
            notes <<-'END'
            ```
            (let [[elt & remaining] entries])
            ```

            If entries is empty, `elt` will be `nil`.
            END
        end
    end
    category do
        id 'deps'
        entry do
            name 'Specify deps'
            notes <<-'END'
            In project.cls.


            ```
            :dependencies [[org.clojure/clojure "1.8.0"]
                           [org.example/libname "1.2.3"]

            ```

            From gradle style:

            `org.exmaple:lib:1.2.3 -> org.example/libname "1.2.3"`
            END
        end
        entry do
            name 'Download deps'
            notes <<-'END'
            ```
            lein deps
            ```
            END
        end
    end
end
