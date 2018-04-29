cheatsheet do
    title 'tlaplus'
    docset_file_name 'tlaplus'
    keyword 'tlaplus'
    category do
        id 'tla+ basics'
        entry do
            name 'Keyboard shortcuts'
            notes <<-'END'
            * ⌘ Shift A - Switch between specs and models
            * ⌘-G - Bring up TLAPS menu
            * ⌘-G ⌘-G - Prove TLAPS step
            END
        end
        entry do
            name 'References'
            notes <<-'END'
            * [summary.pdf](http://lamport.azurewebsites.net/tla/summary.pdf)
            * [Sequences](https://github.com/jameshfisher/tlaplus/blob/master/org.lamport.tla.toolbox/StandardModules/Sequences.tla)
            END
        end
        entry do
            name 'Overall structure'
            notes <<-'END'
            ```
            ------------------------------ MODULE foo ------------------------------
            CONSTANTS A, B, C

            VARIABLES foo, bar, baz

            Init == /\ e1
                    /\ e2

            ------------------------------------------------------------------------

            Next == /\ e3
                    /\ e4
                    /\ e5

            Inv == e6

            ========================================================================
            ```
            END
        end
        entry do
            name 'Common operators'
            notes <<-'END'
            P(x) below means a predicate that contains x
            as a free variable.

            ```
            TRUE, FALSE
            not:         ~
            equality:    =
            not equal:   /= or #
            define:      ==
            and:         /\
            or:          \/
            implies:     =>
            in:          \in
            not in:      \notin
            empty set:   {}
            universal:   \A x \in S : P(x)
            existential: \E x \in S : P(x)
            subset:      x \in SUBSET(y)
            subseteq:    x \subseteq y 
            union:       \union
            intersect:   \intersect
            set diff:    \
            ```
            END
        end
        entry do
            name 'CASE'
            notes <<-'END'
            ```
            CASE x = 1 -> TRUE
              [] x = 2 -> TRUE
              [] x = 3 -> 7
              [] OTHER -> FALSE
            ```
            END
        end
        entry do
            name 'Cross product'
            notes <<-'END'
            ```
            pairs == {1..3} \X {1..2}
            ```
            END
        end
        entry do
            name 'Map & filter'
            notes <<-'END'
            Map (E is an expression):

            ```
            { E(x) : x \in S }
            ```

            Filter (P is a predicate):

            ```
            { x \in S : P(x) }
            ```
            END
        end
        entry do
            name 'CHOOSE'
            notes <<-'END'
            The choose operator must act on a bounded set.

            If the set S is empty, it will error.

            ```
            LET x == CHOOSE x \in S : P(x)
            IN ...
            ```
            END
        end
        entry do
            name 'Specify which variables shouldn\'t change'
            notes <<-'END'
            Specify a tuple that contains the variables.

            ```
            UNCHANGED <<foo, bar, baz>>
            ```

            If there's just one:

            ```
            UNCHANGED foo
            ```
            END
        end
    end
    category do
        id 'PlusCal'
        entry do
            name 'Docs'
            notes <<-'END'
            [A PlusCal User's Manual](http://lamport.azurewebsites.net/tla/p-manual.pdf)
            END
        end
        entry do
            name 'Assertions'
            notes <<-'END'
            ```
            assert x>0
            ```
            END
        end
        entry do
            name 'Overall structure (p-version)'
            notes <<-'END'
            ```
            ------------------------------ MODULE foo ------------------------------
            EXTENDS Naturals
            CONSTANTS N

            (*
            --algorithm MyAlgo

            variables
                foo = {};
                bar = "quux";
                x;

            define Helper(x) == E(x)
            end define

            process Proc \in 1..N
                variable baz;
            begin
                l1: foo := {"hello"}
                l2: bar := "done"
            end process

            process OtherProc = N+1 begin
                o1: x := self
                o2: with y \in 1..N do
                        foo := y;
                        goto o1;
                    end with;
                    
            end process

            end algorithm
            *)

            Inv == e

            ========================================================================
            ```
            END
        end
        entry do
            name 'While loop'
            notes <<-'END'
            ```
            l: while i \leq N do
                set: i := i+1;
                     temp := count;
                inc: count := temp+1;
               end while
            ```

            Note that the while loop needs a label, although the body doesn't.
            END
        end
        entry do
            name 'Process id'
            notes <<-'END'
            ```
            self
            ```
            END
        end
        entry do
            name 'No-op'
            notes <<-'END'
            ```
            skip
            ```
            END
        end
        entry do
            name 'Don\'t proceed until condition is met'
            notes <<-'END'
            ```
            await P
            ```
            END
        end
        entry do
            name 'Wait until a value is present in a set'
            notes <<-'END'
            ```
            with x \in S do
            ...
            end with;
            ```

            Also use this to randomly select an element in a set
            END
        end
        entry do
            name 'if/else'
            notes <<-'END'
            ```
            if ... then
                x := 0;
                ...
            elsif ... then
                ...
            elsif ... then
                ...
            else
                ..
            end if;
            ```
            END
        end
        entry do
            name 'either'
            notes <<-'END'
            You need to give it a line id:

            ```
            p0: 
                either
                    e1: history := Append(history, [method|->Enq, item|->item, process|->self, side|->Inv]);
                    e2: history := Append(history, [method|->Enq, item|->item, process|->self, side|->Res]);
                or
                    d1: history := Append(history, [method|->Deq, item|->item, process|->self, side|->Inv]);
                    d2: history := Append(history, [method|->Deq, item|->item, process|->self, side|->Res]);
                end either;
            ```
            END
        end
        entry do
            name 'with: combines await with CHOOSE'
            notes <<-'END'
            ```
            p1: with x \in S do
                    y := x;
                end with;
            ```

            Note: this acts liike a let, don't need to define a variable.
            END
        end
    end
    category do
        id 'Standard Modules'
        entry do
            name 'Code location'
            notes <<-'END'
            <https://github.com/tlaplus/tlaplus/tree/master/org.lamport.tla.toolbox/StandardModules>
            END
        end
        entry do
            name 'Modules'
            notes <<-'END'
            * Bags
            * FiniteSets
            * Integers
            * Naturals
            * RealTime
            * Reals
            * Sequences
            * TLC
            END
        end
        entry do
            name 'FiniteSets'
            notes <<-'END'
            ```
            EXTENDS FiniteSets

            isFiniteSet(s) 
            Cardinality(s) \leq 4

            
            ```
            END
        end
        entry do
            name 'Naturals'
            notes <<-'END'
            ```
            x \in Nat
            y \in 1..10
            ```
            Also defines mathematical operators (+,-,*,^,<,>,\leq,\geq,%,\div)
            END
        end
        entry do
            name 'Integers'
            notes <<-'END'
            Same as `Naturals`, but supports negative numbers (unary minus).
            END
        end
    end
    category do
        id 'Functions & records'
        entry do
            name 'Defining a single record'
            notes <<-'END'
            ```
            [side|->"left", process|->"p"]
            ```

            Note: record keys must be strings! Don't use model objects.
            END
        end
        entry do
            name 'Accessing record by key'
            notes <<-'END'
            ```
            e.side
            ```

            END
        end
        entry do
            name 'Set of records'
            notes <<-'END'
            ```
            [key1:SetOfVals1, key2:SetOfVals2]
            ```
            END
        end
        entry do
            name 'Define all values of a function'
            notes <<-'END'
            This sets all of the values to "init"

            ```
            f = [x \in S |->"init"]
            ```
            END
        end
        entry do
            name 'Update a function'
            notes <<-'END'
            ```
            f' = [f EXCEPT ![x] = y]
            ```
            END
        end
        entry do
            name 'Update a record'
            notes <<-'END'
            ```
            [e EXCEPT !.value=value]
            ```
            END
        end
        entry do
            name 'Invoke a function'
            notes <<-'END'
            ```
            f[x]
            ```
            END
        end
        entry do
            name 'Set of functions'
            notes <<-'END'
            ```
            f \in [S->T]
            ```

            f is a function whose domain is S and range is a subet of T.
            END
        end
        entry do
            name 'Domain'
            notes <<-'END'
            ```
            DOMAIN f
            ```
            END
        end
    end
    category do
        id 'Natural numbers'
        entry do
            name 'Import'
            notes <<-'END'
            ```
            EXTENDS Naturals
            ```
            END
        end
        entry do
            name 'Set of consecutive numbers'
            notes <<-'END'
            ```
            1..N
            ```
            END
        end
    end
    category do
        id 'Sequences'
        entry do
            name 'Notes'
            notes <<-'END'
            A sequence s, is a function with domain 1..Len(s).
            END
        end
        entry do
            name 'Import'
            notes <<-'END'
            ```
            EXTENDS Sequences
            ```
            END
        end
        entry do
            name 'Set of sequences'
            notes <<-'END'
            Given a set of elements S, create the (infinite) set of all
            sequences made up of those elements.

            ```
            Seq(S) == UNION {[1..n -> S] : n \in Nat}
            ```
            END
        end
        entry do
            name 'Empty sequence'
            notes <<-'END'
            ```
            <<>>
            ```
            END
        end
        entry do
            name 'Length of sequence'
            notes <<-'END'
            ```
            Len(seq)
            ```
            END
        end
        entry do
            name 'First element (car)'
            notes <<-'END'
            ```
            Head(seq)
            ```
            END
        end
        entry do
            name 'Rest of the elements (cdr)'
            notes <<-'END'
            ```
            Tail(seq)
            ```
            END
        end
        entry do
            name 'Append'
            notes <<-'END'
            ```
            Append(seq, value)
            ```
            END
        end
        entry do
            name 'Concatentate'
            notes <<-'END'
            ```
            seq \o seq2
            ```
            END
        end
        entry do
            name 'Subsequence'
            notes <<-'END'
            ```
            SubSeq(seq, 2, 8)
            ```

            This is `[2, 8]` (inclusive).
            END
        end
        entry do
            name 'Subsequence by filtering'
            notes <<-'END'
            ```
            SelectSeq(seq, pred)
            ```

            where pred is a one arg operator that takes an element of seq
            END
        end
    end
    category do
        id 'Running and Debugging'
        entry do
            name 'Evaluate an expression'
            notes <<-'END'
            1. Open the model.
            2. Click on "Model Checking Results" tab
            3. In "Evaluate Constant Expression", put in the expression
            4. Run the model
            END
        end
        entry do
            name 'Check a property'
            notes <<-'END'
            ```
            EXTENDS TLC

            assert P
            ```
            END
        end
        entry do
            name 'Print out a value'
            notes <<-'END'
            Use `PrintT(exp)` which evaluates to TRUE

            ```
            EXTENDS TLC

            PrintT(expr)
            ```
            END
        end
    end
    category do
        id 'TLA+ temporal syntax'
        entry do
            name '`[Next]_vars`'
            notes <<-'END'
            ```
            Next \/ (vars' = vars)
            ```

            This explicitly allows stuttering steps
            END
        end
        entry do
            name '`<<A>>_v`'
            notes <<-'END'
            ```
            A /\ (v` /= v)
            ```

            Use to assert that an action is enabled and that it actually causes some desired state change to occur.
            END
        end
    end
    category do
        id 'Miscellaneous'
        entry do
            name 'VIM bindings'
            notes <<-'END'
            Install the [Vrapper](http://vrapper.sourceforge.net/home/) plugin. 

            From https://groups.google.com/forum/#!topic/tlaplus/ZY2to27DhHU

            1. Start the toolbox from the command line with the two parameters  to activate its console:

                `/Applications/TLA+ Toolbox.app/Contents/MacOS/toolbox -console -consoleLog`

            2. In the console ("osgi>" prompt), activate the functionality to install plugins: 
            
                `start org.eclipse.equinox.p2.console`

            3. Add the p2 repository that contains the plugin: 

                `provaddrepo http://vrapper.sourceforge.net/update-site/stable`

            4. List the available "installation units" (IU) in the update site: 
            
                `provlg http://vrapper.sourceforge.net/update-site/stable`

            5. Install the top-level UI: 
            
                `provinstall net.sourceforge.vrapper.feature.group 0.72.0 DefaultProfile`

            6. Accept the modal dialog. 
            
            7. Restart the Toolbox.

            END
        end
    end
    category do
        id 'TLAPS'
        entry do
            name 'References'
            notes <<-'END'
            * [Tutorial website](https://tla.msr-inria.inria.fr/tlaps/content/Documentation/Tutorial/The_example.html)
            * [Tutorial slides](http://tla2014.loria.fr/slides/kriener.pdf)
            END
        end
        entry do
            name 'Top-level proof example'
            notes <<-'END'

            ```
            EXTENDS ..., TLAPS

            ...
 
            \* WithinLimit is the safety property we care about
            WithinLimit == ...

            TypeOK == /\ foo \in FooVals
                      /\ bar \in BarVals
                      /\ pc \in [ProcSet -> {"p1", "p2", "p3", "Done"}]
                      /\ \A x \in 1..NumWorkers : pc[x] \in {"p1", "p2", "p3", "Done"}

            \* Inv is our inductive invariant
            Inv == /\ TypeOK
                   /\ WithinLimit
                   /\ ... \* Needed for invariant to be inductive

            THEOREM Spec=>[]WithinLimit
            <1>1. Init => Inv
            <1>2. Inv /\ [Next]_vars => Inv'
            <1>3. Inv => WithinLimit
            <1>4. QED
                BY <1>1, <1>2, <1>3, PTL DEF Spec 
            ```
            END
        end
        entry do
            name 'Use a definition in all steps'
            notes <<-'END'
            ```<#> USE DEF Defn```

            Example:
            
            ```
            <1>1. Init => Inv
              <2> SUFFICES ASSUME Init
                           PROVE  Inv
                OBVIOUS
              <2> USE DEF Init
              <2>1. TypeOK
              ...
            
            ```
            END
        end
        entry do
            name 'Checking inductive invariant with TLC'
            notes <<-'END'
            * Choose: Initial predicate and next-state relation to check
            * Init: Inv
            * Next: Next

            END
        end
        entry do
            name 'Existing theorems'
            notes <<-'END'
            See `tlaps-1.4.3/tlapm/library`

            It doesn't seem to be on GitHub.
            END
        end
        entry do
            name 'Gotchas'
            notes <<-'END'
            When dealing with ranges, you may need to explicitly specify a constant is a natural number.

            ```
            ASSUME NIsInNat == N \in Nat \ {0}       

            ...

            <2>3. AtLeastOneYWhenDone
                BY NIsInNat DEF AtLeastOneYWhenDone, ProcSet
            ```
            END
        end
    end
    category do
        id 'Recursion'
        entry do
            name 'Recursive operators'
            notes <<-'END'

            Operator to sum a set of numbers:

            ```
            RECURSIVE Sum(_)
            Sum(S) == 
                IF S = {} THEN 0
                ELSE LET x == CHOOSE x \in S : TRUE IN
                    x + Sum(S \ {x})
            ```
            END
        end
        entry do
            name 'Recursive functions'
            notes <<-'END'
            Function to sum a set of naturals

            ```
            Sum[S \in SUBSET Nat] == 
                IF S = {} THEN 0
                ELSE LET x == CHOOSE x \in S : TRUE IN
                    x + Sum[S \ {x}]
            ```
            END
        end
    end
end
