cheatsheet do
    title 'clojure'
    docset_file_name 'clojure'
    keyword 'clojure'
    category do
        id 'Basic examples'
        entry do
            name 'Example'
            notes <<-'END'
            ```clojure
            (ns foo
              (:require [clj-http.client :as client]
                        [clojure.data.json :as json]
                        [korma.db :refer [postgres defdb]]
                        [korma.core :refer [defentity select insert values]])
              (:refer-clojure :exclude [get]))

            (import 'java.awt.Toolkit)
            (import 'java.awt.datatransfer.DataFlavor)

            ```
            END
        end
    end
    category do
        id 'Babashka'
        entry do
            name 'References'
            notes <<-'END'
            * [Babashka book](https://book.babashka.org/)
            * [main repo](https://github.com/babashka/babashka)
            * [babashka/curl](https://github.com/babashka/babashka.curl)
            END
        end
        entry do
            name 'Example'
            notes <<-'END'
            ```clojure
            #!/usr/bin/env bb
            (ns myscript
                (:require [babashka.curl :as curl])
                (:require [cheshire.core :as json])
                (:require [clojure.pprint :as pprint])
                (:require [clojure.java.shell :refer [sh]]))

            (defn get-clipboard-contents
                []
                (-> "pbpaste" sh :out))

            (defn parse-clipboard-contents
                []
                (-> (get-clibpard-contents) (json/parse-string true))


            (def url "http://www.example.com/contents.json)

            (->
                (curl/get url)
                :body
                (json/parse-string true) ; true means convert keys to symbols
                pprint/pprint
            )
            ```
            END
        end
        entry do
            name 'Detect if executed'
            notes <<-'END'
            ```clojure

            (when
                (= *file* (System/getProperty "babashka.file"))
                (main *command-line-args*))
            ```
            END
        end

    end
    category do
        id 'Dispatching'
        entry do
            name 'condp'
            notes <<-'END'
            ```clojure
            (defn main
              [[cmd & args]]
              (condp = cmd
                "apps" (list-apps)
                "validate" (validate args)
                "publish" (publish args)
                "status" (status args)
                "zap" (zap args)
                (print-usage)))
            ```
            END
        end
        entry do
            name 'multimethods'
            notes <<-'END'
            ```clojure
            (defmulti command first)

            (defmethod command "apps" [_] (list-apps))
            (defmethod command "validate" [[_ args]] (validate args))
            (defmethod command "status" [[_ args]] (status args))
            (defmethod command "zap" [[_ args]] (zap args))
            (defmethod command :default [_] (print-usage))

            (defn main [args]
                (command args))
            ```
            END
        end
    end
    category do
        id 'Destructuring'
        entry do
            name 'Destructure a map'
            notes <<-'END'
            ```clojure
            (let [{:keys [foo bar baz]} m] ... )
            ```
            END
        end
    end
    category do
        id 'REPL'
        entry do
            name 'CLI'
            notes <<-'END'
            ```
            clj - clojure REPL with rlwrap
            ```
            END
        end
        entry do
            name 'Switch namespaces'
            notes <<-'END'
            ```
            (in-ns 'timeline.core)
            ```
            END
        end
        entry do
            name 'Use doc in repl'
            notes <<-'END'
            ```clojure
            (use 'clojure.repl)
            ```
            END
        end
        entry do
            name 'Bring in a namespace'
            notes <<-'END'
            ```clojure

            ; Simplest way, like import *
            (use 'clojure.java.io)

            (require 'clojure.data.json)
            (require '[clojure.data.json :as json])
            ```
            END
        end
        entry do
            name 'Reload namespace'
            notes <<-'END'
            ```clojure
            (use 'the.namespace :reload)

            ;; This seems to work
            (use (symbol (str *ns*)) :reload)
            ```
            END
        end
        entry do
            name 'Current namespace'
            notes <<-'END'
            ```clojure
            (str *ns*) ; name of ns as a string
            ```
            END
        end
        entry do
            name 'Last three values'
            notes <<-'END'
            ```clojure
            *1
            *2
            *3
            ```
            END
        end
        entry do
            name 'Help info (doc)'
            notes <<-'END'
            The `doc` function does not get loaded by default into the calva REPL.

            Command palette:  Require REPL utilities, like (doc) etecetera, into current namespace

            Or, manually:

            ```clojure
            (use 'clojure.repl)
            ```
            END
        end
    end
    category do
        id 'CLI tooling'
        entry do
            name 'deps.edn'
            notes <<-'END'
            ```clojure
            {:deps
             {clojure.java-time/clojure.java-time {:mvn/version "0.3.2"}
              babashka/babashka.curl {:mvn/version "0.1.1"}
              cheshire/cheshire {:mvn/version "5.10.1"}}}
            ```
            END
        end
        entry do
            name 'Launch a repl'
            notes <<-'END'
            ```
            clj
            ```
            END
        end
        entry do
            name 'Source organization and execution'
            notes <<-'END'
            File organization:

            ```
            .
            ├── deps.edn
            └── src
            └── hello.clj
            ```

            hello.clj

            ```clojure
            (ns hello
             ... )

            (defn run [opts]
               ... )
            ```


            Running the run function in the hello namespace:

            ```bash
             clj -X hello/run
            ```
            END
        end

    end
    category do
        id "Leiningen"
        entry do
            name 'Launch a repl'
            notes <<-'END'
            ```
            lein repl
            ```
            END
        end
        entry do
            name 'Connect to a running repl'
            notes <<-'END'
            ```
            lein repl :connect 65400
            ```
            END
        end
    end
    category do
        id 'Java interop'
        entry do
            name 'Import'
            notes <<-'END'
            ```clojure
            ; a single class
            (import 'java.class.goes.here)

            ; multiple classes from the sample namespace
            (import '(package.name Class1 Class2))
            ```
            END
        end
        entry do
            name 'Call regular method'
            notes <<-'END'
            ```clojure
            (.method obj arg1 )
            ```
            END
        end
        entry do
            name 'Call static method'
            notes <<-'END'
            ```clojure
            (import 'java.awt.Toolkit)

            ;; Either of these works:
            (Toolkit/getDefaultToolkit)
            (. Toolkit getDefaultToolkit)
            ```
            END
        end

    end
    category do
        id 'Functions'
        entry do
            name 'Multiple arity'
            notes <<-'END'
            ```clojure
            (defn myfunc
            ([x]
              (println "You called myfunc with one arg"))
            ([x y]
              (println "You called myfunc with two args")))
            ```
            END
        end
        entry do
            name 'Named parameters (keyword args)'
            notes <<-'END'
            ```clojure
            (defn job-info
              [& {:keys [name job income] :or {job "unemployed" income "$0.00"}}]
              (if name
                [name job income]
                (println "No name specified")))

            ; invoking
            (job-info :name "me" :job "coder" :income "$1")
            ```
            Example from <http://clojure-doc.org/articles/language/functions.html>
            END
        end
        entry do
            name 'Single map as argument'
            notes <<-'END'
            ```clojure
            (defn myfunc
            [{:keys [foo bar baz]}] ... )

            ; invoking
            (myfunc {:foo 1 :bar 2 :baz 3})

            ```
            END
        end

    end
    category do
        id 'I/O (files and directories)'
        entry do
            name 'Read a whole file'
            notes <<-'END'
            ```clojure
            (slurp "file.txt")
            ```
            END
        end
        entry do
            name 'Write a whole file'
            notes <<-'END'
            ```clojure
            (spit "file.txt" "contents of file")
            ```
            END
        end
        entry do
            name 'Create a directory'
            notes <<-'END'
            ```clojure
           (defn create-dir
             [name]
             (.mkdir (java.io.File. name)))
            ```
            END
        end
        entry do
            name 'Get name of directory'
            notes <<-'END'
            ```clojure
            (defn get-directory-name
             [path]
             (-> path java.io.File. .getCanonicalFile .getName))
            ```
            END
        end
        entry do
            name 'Example'
            notes <<-'END'
            ```clojure
          (ns myns.core
            (:require clojure.java.io)
            (:gen-class))

            (defn write-dot [fname]
              (with-open [w (clojure.java.io/writer fname)]
                (binding [*out* w]
                  (println "digraph {")
                  (println "a -> b;")
                  (println "b -> c;")
                  (println "c -> d;")
                  (println "d -> a;")
                  (println "}"))))
            ```
            END
        end

    end
    category do
        id 'Functional'
        entry do
            name 'zip'
            notes <<-'END'
            Call `map` using a function that takes multiple args,
            and then pass each seq as a separate arg.

            ```
            > (map vector '(1 2 3) '("a" "b" "c"))
            ([1 "a"] [2 "b"] [3 "c"])
            ```

            If you have a collection of collections, use apply

            ```
            > (apply map vector [[1 2 3]
                                 [4 5 6]])
            ([1 4] [2 5] [3 6])
            ```
            END
        end
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
        entry do
            name 'Apply args to function'
            notes <<-'END'
            ```
            (apply f args)  ; like (f *args) where * is Python
            (apply + '[1 2 3]) ; (+ 1 2 3) -> 6

            ```
            END
        end
        entry do
            name 'Filter out nils'
            notes <<-'END'
            ```clojure
            (filter some? coll)
            ```
            END
        end
        entry do
            name 'Invert a predicate'
            notes <<-'END'
            ```clojure
            (complement pred?)

            ```
            END
        end
        entry do
            name 'Filter non-empty collections'
            notes <<-'END'
            ```clojure
            (filter seq coll-of-colls)
            ```
            END
        end
    end
    category do
        id 'Sequences'
        entry do
            name '1,2,3,...'
            notes <<-'END'
            ```
            (take 5 (range))
            ```
            END
        end

    end
    category do
        id 'Collections'
        entry do
            name 'Element by index'
            notes <<-'END'
            ```clojure
            (nth mycoll 4)
            ```
            END
        end
        entry do
            name 'First and remaining elements'
            notes <<-'END'
            ```clojure
            (first [1 2 3]) ; 1
            (rest [1 2 3]) ; [2 3]
            ```
            END
        end
        entry do
            name 'Insert an item'
            notes <<-'END'
            ```clojure
            (conj [1 2] 3) ; -> [1 2 3]
            (conj '(1 2) 3) ; -> (3 1 2)
            ```
            END
        end
        entry do
            name 'Insert multiple items'
            notes <<-'END'
            ```clojure
            (into [1 2 3] [4 5 6]) ; [1 2 3 4 5 6]
            ```
            END
        end
        entry do
            name 'Size/length of a collection'
            notes <<-'END'
            ```
            (count s)
            ```
            END
        end
    end
    category do
        id 'Maps'
        entry do
            name 'Get an entry'
            notes <<-'END'
            ```clojure
            (def x {:color "blue" :flavor "lemon"})
            (x :color) ; "blue"
            (:color x) ; "blue" (only works for keywords, not strings as keys)
            ```
            END
        end
        entry do
            name 'Add / modify a field'
            notes <<-'END'
            ```clojure
            (assoc x :size "small") ; {:color "blue", :flavor "lemon", :size "small"}
            (assoc x :color "red") ; {:color "red", :flavor "lemon"}
            ```
            END
        end
        entry do
            name 'Create a map from two lists of equal size'
            notes <<-'END'
            ```clojure
            (zipmap [:a, :b, :c] [1, 2, 3]) ; {:a 1, :b 2, :c 3}
            ```
            END
        end
        entry do
            name 'Retrieve (get) a nested field'
            notes <<-'END'
            ```clojure
            (get-in task [:execution :stages 0])
            ```
            END
        end
        entry do
            name 'Add / modify a nested field'
            notes <<-'END'
            ```clojure
            (def x {:foo {:bar "baz"}})
            (assoc-in x [:foo :bar] "quux") ; {:foo {:bar "quux"}}
            ```
            END
        end
        entry do
            name 'Update a field using a function'
            notes <<-'END'
            ```clojure
            (def x {:count 5})
            (update x :count #(* % 2) ; {:count 10}
            ```

            `update-in` works like `assoc-in`
            END
        end
        entry do
            name 'Remove a field'
            notes <<-'END'
            ```clojure
            (dissoc x :color) ; {:flavor "lemon"}
            ```
            END
        end
    end
    category do
        id 'Sets'
        entry do
            name 'Set as function'
            notes <<-'END'
            ```clojure
            (#{ "a" "b" "c"} "b") ; "b"
            (#{ "a" "b" "c"} "d") ; nil
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

            The main function is `-main`.
            END
        end
        entry do
            name 'Download dependencies'
            notes <<-'END'
            ```
            lein deps
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
            name 'Specify an alternate entrypoint'
            notes <<-'END'
            In `project.clj`, specify an entry point like this:

            ```
            :main myproj.core/myfunc
            ```
            END
        end
    end
    category do
        id 'Strings'
        entry do
            name 'Join a collection of strings'
            notes <<-'END'
            ```clojure
            (clojure.string/join coll)
            ```
            END
        end
        entry do
            name 'Check for substring'
            notes <<-'END'
            ```clojure
            (clojure.string/includes? s "us-east-1")
            ```
            END
        end
    end
    category do
        id 'namespaces'
        entry do
            name 'Require: create a namespace with library dependencies'
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
        entry do
            name 'Require: import a namespace in the REPL'
            notes <<-'END'
            ```clojure
            (require 'clojure.data.json)
            (require '[clojure.data.json :as json])
            ```
            END
        end
        entry do
            name 'Reload namespace in the REPL'
            notes <<-'END'
            ```clojure
            (use 'the.namespace :reload)

            ;; This seems to work
            (use (symbol (str *ns*)) :reload)
            ```
            END
        end
        entry do
            name 'Current namespace (REPL)'
            notes <<-'END'
            ```clojure
            (str *ns*) ; name of ns as a string
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
        id 'Control flow'
        entry do
            name 'do'
            notes <<-'END'
            ```clojure
            (do
            (println "Hello")
            (println ("World")))
            ```
            END
        end
        entry do
            name 'when'
            notes <<-'END'
            ```clojure
            (when (= s "foo")
              (println "s is")
              (println "foo!"))
            ```
            END
        end
        entry do
            name 'cond'
            notes <<-'END'
            ```clojure
            (cond
              (= x 1) "1"
              (= x 2) "2"
              :else "not 1 or 2")
            ```
            END
        end
    end
    category do
        id 'Exceptions'
        entry do
            name 'try/catch'
            notes <<-'END'
            ```clojure
            (try
              (myfunc 1 2)
              (catch ArithmeticException e (println ("arithmetic error")))
              (catch SomeOtherException e (println("something else happened)))
            ```
            END
        end
        entry do
            name 'Throw'
            notes <<-'END'
            ```
            (throw (ex-info "Badness!" {:more-details "here"}))
            ```
            END
        end
    end
    category do
        id 'JSON parsing'
        entry do
            name 'Read JSON from a file'
            notes <<-'END'
            ```clojure
            ; cheshire
            (ns ... (:require [cheshire.core :as json]))

            (-> "file.json" slurp (json/parse-string true)))


            ; clojure.data.json
            (ns ... (:require [clojure.data.json :as json]))

            (-> "file.json" slurp (json/read-str :key-fn keyword)))
            ```



            END
        end
        entry do
            name 'Dump json to stdout'
            notes <<-'END'
            ```clojure
            (ns myns.core
                (:require [clojure.data.json :as json])

            (json/pprint obj)
            ```
            END
        end
        entry do
            name 'Dependency'
            notes <<-'END'
            ```clojure
            :dependencies [[org.clojure/clojure "1.10.1"]
                           [org.clojure/data.json "1.0.0"]]
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
            name 'lein dependencies'
            notes <<-'END'
            ```
            :dependencies [[org.clojure/clojure "1.10.1"]
                           [org.clojure/data.json "1.0.0"]
                           [clj-http "3.10.1"]]
            ```
            END
        end
        entry do
            name 'build.gradle'
            notes <<-'END'
            ```
            dependencies {
              compile 'org.clojure:clojure:1.8.0'
              compile 'org.clojure:data.json:1.0.0'
              compile "clj-http:clj-http:3.10.1"
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

            ; query and converrt keys to keywords
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
        id 'VSCode (Calva)'
        entry do
            name 'Evaluate in Calva'
            notes <<-'END'
            ```
            ALT ENTER  - evals the expression
            ^ ENTER  - evals the sub-expression at the cursor
            ESC - clears the inline expression
            ```
            END
        end
        entry do
            name 'Move between panes'
            notes <<-'END'
            ```
            CMD 1
            CMD 2
            ```
            END
        end
        entry do
            name 'Paredit'
            notes <<-'END'
            ```
            ^ L - move the close paren to the right (slurp)
            ^ H - move the close paren to the left (barf)
            ^ ALT S - delete paren
            ```

            I remapped slurp and barf.

            See <https://calva.io/paredit/>
            END
        end
        entry do
            name 'Plugins'
            notes <<-'END'
            I use the Calva plugin.

            To make Calva happy, I use the Neovim plugin instead of the Vim plugin.
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
            name 'Loops/tail recursion with loop/recur'
            notes <<-'END'
            ```clojure
            (defn sum [x]
              (loop [x x acc 0]
                  (if (= x 0)
                    acc
                    (recur (- x 1) (+ acc x)))))
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
        id 'Scripting with planck'
        entry do
            name 'shebang and slurp'
            notes <<-'END'
            ```
            #!/usr/local/bin/planck

            (require '[planck.core :refer [slurp]])

            (def data
                (slurp "myfile.txt"))
            ```
            END
        end

    end
    category do
        id 'Time'
        entry do
            name 'Convert an ISO8601 timestamp to a different string'
            notes <<-'END'
            ```clojure
            (ns myns.foo
             (:import (java.time Instant ZoneId)
                      (java.time.format DateTimeFormatter)))

            (defn iso8601->local
            "Convert in iso8601 string to local date time

            > (iso8601-local \"2020-12-05T01:22:38.107432Z\")
            #object[java.time.ZonedDateTime 0x3e251c97 \"2020-12-04T17:22:38.107432-08:00[America/Los_Angeles]\"]
            "
            [timestamp]
            (let [instant (Instant/parse timestamp)
                  zone (ZoneId/systemDefault)]
                (.atZone instant zone)))


            (defn human-readable-time
            "Convert a time string from ISO-8601 to a specific human-readable format

            > (human-readable-time \"2020-12-05T01:22:38.107432Z\"))
            \"12/04 05:22PM\"
            "
            [timestamp]
            (let [pattern "MM/dd hh:mma"
                  formatter (DateTimeFormatter/ofPattern pattern)
                  local-time (iso8601->local timestamp)]
                (.format local-time formatter)))
            ```
            END
        end

    end
    category do
        id 'Using libraries'
        entry do
            name 'Specifying and downloading jars'
            notes <<-'END'
            Add the dependences to project.clj, for example:

            ```clojure
            :dependencies [[org.clojure/clojure "1.10.1"]
                           [org.clojure/data.json "1.0.0"]]

            ```
            From gradle style:

            `org.example:lib:1.2.3 -> org.example/libname "1.2.3"`

            Tell lein to download dependencies:

            ```
            lein deps
            ```
            END
        end
        entry do
            name 'refer example with pretty-print (pprint)'
            notes <<-'END'
            ```clojure
            (ns parse-csv.core
            (:require [clojure.data.csv :as csv]
                      [clojure.java.io :as io]
                      [clojure.pprint :refer [pprint]])
              (:gen-class))

            (pprint ...)
            ```
            END
        end
    end
    category do
        id 'spec'
        entry do
            name 'Clojure spec basics'
            notes <<-'END'
            ```clojure
            (ns my-ns
                (:require [clojure.spec.alpha :as s]))


            (s/def ::server-groups (s/coll-of ::server-group))
            (s/def ::server-group
                (s/keys :req-un
                        [::name
                         ::region ...]))
            (s/def ::region string?)

            (s/def ::instance-common (s/keys ...))
            (s/def ::instance-titus-specific
                (s/keys :req-un [...]))
            (s/keys ::instance-ec2-specific (s/keys ...))

            (s/def ::instance
                (s/and ::instance-common
                    ; NB. or specs have a tag for each branch!
                    (s/or :titus ::instance-titus-specific
                          :ec2  ::instance-ec2-specific)))

            ```
            END
        end
    end
    category do
        id 'Parsers (instaparse)'
        entry do
            name 'Example grammar'
            notes <<-'END'
            ```clojure
            ; deps.edn
            {:deps
                {instaparse/instaparse {:mvn/version "1.4.10"}}}

            ; actual code

            (ns myns
                (:require [instaparse.core :as insta]))

            ; a buildInfo/image is of the form "proj/app:v1.2.3-h123.abc1234"
            ; sometimes the version string isn't there
            (def buildInfo-image-parser
               (insta/parser
                "S = project '/' app ':' version?
                 project = word
                 app = word
                 word = #'[a-zA-Z]+'
                 version = semver '-' buildNumber '.' shortSha
                 semver = 'v' number '.' number '.' number
                 buildNumber = 'h' number
                 number = #'[0-9]+'
                 shortSha = #'[0-9a-f]{7}'"
                ))

            ; I use it in a spec like this:
            (s/def :buildInfo/image #(not (insta/failure? (buildInfo-image-parser %))))


            ```
            END
        end

    end
end
