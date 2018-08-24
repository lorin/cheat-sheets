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
            name 'Show/hide types'
            notes <<-'END'
            ```
            :set +t
            :unset +t
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
        entry do
            name 'Change the prompt'
            notes <<-'END'
            ```
            :set prompt  "λ "
            ```
            END
        end
        entry do
            name 'Define a multi-line function'
            notes <<-'END'
            ```haskell
            let {different [] = True; different (x:xs) = not (elem x xs) && different xs}
            ```
            END
        end
    end
    category do
        id 'Booleans'
        entry do
            name 'The basics'
            notes <<-'END'
            ```haskell
            True
            False
            True && True
            True || False
            not False
            ```
            END
        end
    end
    category do
        id 'Imports'
        entry do
            name 'Unqualified (all functions)'
            notes <<-'END'
            ```
            import Control.Monad
            ```
            END
        end
        entry do
            name 'Unqualified (some functions)'
            notes <<-'END'
            ```
            import Data.Set (size, fromList)
            ```
            END
        end
    end
    category do
        id 'Lists'
        entry do
            name 'cons'
            notes <<-'END'
            ```
            3:[4]
            ```
            END
        end
        entry do
            name 'Check presence of element'
            notes <<-'END'
            ```haskell
            elem x xs
            
            ```
            END
        end
        entry do
            name 'Concat'
            notes <<-'END'
            ```
            [3] ++ [4]
            ```
            END
        end
        entry do
            name 'Range (finite)'
            notes <<-'END'
            ```
            [1..5]
            ```
            END
        end
        entry do
            name 'Range (infinite)'
            notes <<-'END'
            ```
            [1..]
            ```
            END
        end
        entry do
            name 'Reverse'
            notes <<-'END'
            ```
            reverse
            ```
            END
        end
        entry do
            name 'First n'
            notes <<-'END'
            ```
            take 5 
            ```
            END
        end
        entry do
            name 'First'
            notes <<-'END'
            ```
            head
            ```
            END
        end
        entry do
            name 'Last'
            notes <<-'END'
            ```
            tail
            ```
            END
        end
        entry do
            name 'Pattern match'
            notes <<-'END'
            ```haskell
            different :: Eq a => [a] -> Bool
            different     [] = True
            different (x:xs) = not (elem x xs) && different xs
            ```
            END
        end
        entry do
            name 'Destructuring (with guards, and as syntax)'
            notes <<-'END'
            From Richard Bird's Thinking Functionally with Haskell:

            ```haskell
            merge xs'@(x:xs) ys'@(y:ys)
            | x <= y    = x:merge xs ys'
            | otherwise = y:merge xs' ys
            ```

            Note how `x:xs` destructures a list, and `xs'` is the non-destructured version of it.
            END
        end
    end
    category do
        id 'Pairs'
        entry do
            name 'Left'
            notes <<-'END'
            ```
            fst
            ```
            END
        end
        entry do
            name 'Right'
            notes <<-'END'
            ```
            snd
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
