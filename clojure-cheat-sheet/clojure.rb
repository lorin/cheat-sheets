cheatsheet do
    title 'clojure'
    docset_file_name 'clojure'
    keyword 'clojure'
    category do
        id 'Functional'
        entry do
            name 'lambda'
            notes <<-'END'
            ```clojure
            #(+ % 1)
            ```

            The `%` is the argument. For multi-args:

            ```clojure
            #(+ %1 %2)
            ```
            END
        end
    end
    category do
        id 'Data structures'
        entry do
            name 'Insert an item'
            notes <<-'END'
            ```clojure
            (conj [1 2] 3) ; -> [1 2 3]
            (conj '(1 2) 3) ; -> (3 1 2)
            ```
            END
        end
    end
    category do
        id 'Maps'
        entry do
            name 'Get an entry'
            notes <<-'END'
            ```
            (def x {:color blue :flavor lemon})
            ```
            END
        end
        
    end
    category do
        id 'lein'
        entry do
            name 'Connect to a running repl'
            notes <<-'END'
            ```
            lein repl :connect 65400
            ```
            END
        end
        entry do
            name 'New project'
            notes <<-'END'
            ```
            lein new app my-appname
            ```

            Note: this will create a new directory named my-appname
            and put the files in there.

            The main file is: `myappname/src/myap_appname/core.clj`

            The main function is `-main`.
            END
        end
        entry do
            name 'Specify an alternate entrypoint'
            notes <<-'END'
            In `project.clj`, specify an entry point like this:

            ```
            :main myproj.core/myfunc
            ```
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
        id 'Basics'
        entry do
            name 'Size/length of a collection'
            notes <<-'END'
            ```
            count
            ```
            END
        end
    end
    category do
        id 'namespaces'
        entry do
            name 'Example'
            notes <<-'END'
            ```
            (ns foo
              (:require [clj-http.client :as client]
                        [clojure.data.json :as json]
                        [korma.db :refer [postgres defdb]]
                        [korma.core :refer [defentity select insert values]])
              (:refer-clojure))
            ```
            END
        end
    end
    category do
        id 'Testing'
        entry do
            name 'Define and execute a test'
            notes <<-'END'
            ```clojure
            (with-test
                (defn myfunc [x] (inc x))
                (is (= 3 (myfunc 1))))

            (test #'myfunc)
            ```
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
        id 'Java interop'
        entry do
            name 'Method call'
            notes <<-'END'
            ```clojure
            (.method obj arg)
            ```
            END
        end
        entry do
            name 'New object'
            notes <<-'END'
            ```
            (MyClass.)
            ```
            END
        end
        entry do
            name 'Static method'
            notes <<-'END'
            ```clojure
            (.MyClass/method arg1)
            ```
            END
        end
        entry do
            name 'Static inner class'
            notes <<-'END'
            ```clojure
            (ns myns
                (:import com.example.Outer$Inner))

            (Outer$Inner.)

            
            ```
            END
        end
    end
    category do
        id 'HTTP client'
        entry do
            name 'Docs'
            notes <<-'END'
            <https://github.com/dakrone/clj-http#get>
            END
        end
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
            ```clojure
            (ns myns
              (:require [clj-http.client :as client]
                        [clojure.data.json :as json]
              )
              (:refer-clojure))

            ; query and converrt keys to keywrods
            (-> "http://www.example.com" client/get :body (json/read-str :key-fn keyword))
            ```
            END
        end
        entry do
            name 'Basic auth'
            notes <<-'END'
            ```clojure
            (client/get "url" {:basic-auth ["user" "pass"]})

            ; alternately
            (client/get "url" :basic-auth ["user:pass"])
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
        id 'core.async'
        entry do
            name 'Complete-ish example'
            notes <<-'END'
            ```clojure
            (ns asyncset
              (:require [clojure.core.async
                         :as a
                         :refer [>! <! >!! <!! go chan buffer close! thread
                                 alts! alts!! timeout]])
              (:refer-clojure))

            ;; We want to create a process with two channels

            ;; Use this to write a value to teh set
            (def write-chan (chan))

            ;; Use this to check for set membership
            (def req-chan (chan))

            ;; The result comes back on the response channel
            (def resp-chan (chan))

            (defn start-set
              "Launches the thread that allows for writing in a set and checking membership, args are channels"
              [write req resp]
              (go
                (loop [acc #{}]
                    (let [[value channel] (alts!! [write req])]
                      (condp = channel
                        write (recur (conj acc value))
                        req  (do
                               (>! resp (contains? acc value))
                               (recur acc)))))))


            (defn remember [value]
              "Remember a value"
              (>!! write-chan value))

            (defn in?
              "Check if that value was defined"
              [value]
              (>!! req-chan value)
              (<!! resp-chan))


            (start-set write-chan req-chan resp-chan)

            ; Check for membership
            (in? 3)

            ; Remember a value
            (remember 3)

            ; Check again, should be there
            (in? 3)
            ```
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
            name 'Evaluate buffer'
            notes <<-'END'
            ```
            SPC m e b
            ```
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
        id 'vim-fireplace'
        entry do
            name 'Prereq: start a repl'
            notes <<-'END'
            ```
            lein repl
            ```
            END
        end
        entry do
            name 'Evaluate at cursor'
            notes <<-'END'
            ```
            cqq
            ```
            END
        end
        entry do
            name 'Blank input'
            notes <<-'END'
            ```
            cqc
            ```
            END
        end
        entry do
            name 'Evaluate a range'
            notes <<-'END'
            ```
            :Eval
            ```
            END
        end
        entry do
            name 'Doc lookup under cursor'
            notes <<-'END'
            ```
            K
            ```
            END
        end
        entry do
            name 'Doc lookup supplying arg'
            notes <<-'END'
            ```
            :Doc <arg>
            ```
            END
        end
    end
end
