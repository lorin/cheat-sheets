cheatsheet do
    title 'clojure'
    docset_file_name 'clojure'
    keyword 'clojure'
    category do
        id 'Basics'
        entry do
            name 'Docs'
            notes <<-'END'
            <https://clojuredocs.org/>
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
    end
end
