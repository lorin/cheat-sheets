cheatsheet do
    title 'haskell'
    docset_file_name 'haskell'
    keyword 'haskell'
    category do
        id 'Running'
        entry do
            name 'Compile a binary'
            notes <<-'END'
            ```make
            f-algebra: f-algebra.hs
                ghc -o f-algebra f-algebra.hs
            ```
            END
        end
    end
    category do
        id 'ghci'
        entry do
            name 'Load a script'
            notes <<-'END'
            ```
            :load "script.hs"
            ```
            END
        end
        entry do
            name 'Show types'
            notes <<-'END'
            ```
            :set +t
            ```
            END
        end
        entry do
            name 'Show function'
            notes <<-'END'
            ```
            :m +Text.Show.Functions
            ```
            END
        end
    end
    category do
        id 'Functors'
        entry do
            name 'Define a functor'
            notes <<-'END'
            ```haskell
            data RingF a = RZeroF
                         | ROneF
                         | RAddF a a
                         | RMulF a a
                         | RNegF a
            instance Functor RingF where
                fmap f RZeroF      = RZeroF
                fmap f ROneF       = ROneF
                fmap f (RAddF x y) = RAddF (f x) (f y)
                fmap f (RMulF x y) = RMulF (f x) (f y)
                fmap f (RNegF a)   = RNegF (f a)
            ```
            END
        end
    end
    category do
        id 'Lists'
        entry do
            name 'Pattern match on car/cdr'
            notes <<-'END'
            ```haskell
            (x:xs)
            ```
            END
        end
    end
    category do
        id 'Scripting with Turtle'
        entry do
            name 'Docs'
            notes <<-'END'
            [Turtle-Tutorial](https://hackage.haskell.org/package/turtle-1.3.3/docs/Turtle-Tutorial.html)
            END
        end
        entry do
            name 'Configure ghci for turtle'
            notes <<-'END'
            Create a .ghci file

            ```
            :set -XOverloadedStrings
            import Turtle
            ```
            END
        end
    end
end
