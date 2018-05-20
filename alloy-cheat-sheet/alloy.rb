cheatsheet do
    title 'alloy'
    docset_file_name 'alloy'
    keyword 'alloy'
    category do
        id 'External cheat sheets'
        entry do
            name 'Thomas A. Alspaugh'
            notes <<-'END'
            <https://www.ics.uci.edu/~alspaugh/cls/shr/alloy.html#quick>
            END
        end
    end
    category do
        id 'Signatures'
        entry do
            name 'Simple case'
            notes <<-'END'
            ```alloy
            sig EventId {}

            sig Op {}

            sig HistoryEvent {
                id: EventId,
                op: Op
            }{
                // event ids are unique
                all h : HistoryEvent | (h.@id = id) => h = this
            }
            ```
            END
        end
        entry do
            name 'Disjoint, total subsets'
            notes <<-'END'
            ```alloy
            abstract sig Op {
                obj: Obj,
                val: Int
            }

            sig Read,Write extends Op {}
            ```
            END
        end
        entry do
            name 'Specifying disjoint subsets with multiple declarations'
            notes <<-'END'
            ```alloy
            abstract sig HEvent {
                id: EventId,
                op: Op,
            }{
                // event ids are distinct
                all h : HEvent | (h.@id = id) => h = this
            }

            sig REvent extends HEvent {
            }{
                op in Read
            }

            sig WEvent extends HEvent {
            }{
                op in Write
            }
            ```
            END
        end
        entry do
            name 'Specifying non-disjoint subsets'
            notes <<-'END'
            ```alloy
            sig A {}

            sig D in A {}
            sig E in A {}
            ```
            END
        end
        entry do
            name 'Multiplicity of relations'
            notes <<-'END'
            ```
            sig Foo {
              foo : A, // one
              bar : lone B, // zero or one
              baz : set C // many
            }
            ```
            END
        end
    end
    category do
        id 'Sets and operations'
        entry do
            name 'Quantifiers'
            notes <<-'END'
            ```alloy
            all
            some
            one
            lone
            ```
            END
        end
        entry do
            name 'Set-valued operators'
            notes <<-'END'
            * `+` - union
            * `&` - intersection
            * `-` - difference
            END
        end
        entry do
            name 'Boolean-valued operator'
            notes <<-'END'
            * `in` - subset
            * `not in` - not subset
            * `=` - equality
            END
        end
        entry do
            name 'Constants'
            notes <<-'END'
            * `none` - empty set
            * `univ` - universal set
            * `iden` - identity relation
            END
        end
    end
    category do
        id 'Predicate calculus'
        entry do
            name 'Build a set'
            notes <<-'END'
            ```alloy
            r' = {b: B, a:A, c: C | a->b->c in r}
            ```
            END
        end
        entry do
            name 'One-to-one'
            notes <<-'END'
            ```alloy
            all a : A | lone R.a
            ```
            END
        end
        entry do
            name 'Reflexive'
            notes <<-'END'
            ```alloy
            all a : A | a->a in R
            ```
            END
        end
        entry do
            name 'Irreflexive'
            notes <<-'END'
            ```alloy
            no iden & R
            ```
            END
        end
        entry do
            name 'Anti-symmettric'
            notes <<-'END'
            ```alloy
            no R & ~R
            ```
            END
        end
        entry do
            name 'Total'
            notes <<-'END'
            ```alloy
            all e1, e2 : E | e1!=e2 => e1->e2 in R or e2->e1 in R
            ```
            END
        end
    end
    category do
        id 'Relational examples'
        entry do
            name 'Total ordering'
            notes <<-'END'
            ```
            // po is a relation

            // irreflexive

            // antisymmetric
            no po & ~po

            // total
            ```
            END
        end
    end
    category do
        id 'Relational operations'
        entry do
            name 'Combining relations'
            notes <<-'END'
            * `->` - arrow product
            * `.` - dot join
            * `[]` - box join
            * `^` - transitive closure
            * `*` - reflexive transitive closure
            END
        end
        entry do
            name 'Box join example'
            notes <<-'END'
            ```
            sig H {
                id: EventId,
                op: Op
            }

            sig HEvent {
                x: Obj -> set H
            }

            // To get all of the ops
            HEvent.x[Obj].op 
            ```
            END
        end
        entry do
            name 'Arrow producct'
            notes <<-'END'
            Form a relation with all pairs from p,q

            ```
            p->q
            ```
            END
        end
        entry do
            name 'Reachability'
            notes <<-'END'
            * `^` - transitive closure
            * `*` - reflexive transitive closure
            END
        end
        entry do
            name 'Modifying relations'
            notes <<-'END'
            * `~` - transpose
            * `<:` - domain restriction
            * `:>` - range restriction
            * `++` - override
            END
        end
        entry do
            name 'Cardinality'
            notes <<-'END'
            Size of set s:

            ```
            #s
            ```
            END
        end
    end
    category do
        id 'Other'
        entry do
            name 'Markdown syntax'
            notes <<-'END'
            See <https://github.com/AlloyTools/org.alloytools.alloy/wiki/5.0.0-Change-List#markdown-syntax>
            END
        end
        entry do
            name 'Let'
            notes <<-'END'
            ```
            let x = foo | ...
            ```
            END
        end
    end
    category do
        id 'Running and verifying'
        entry do
            name 'Run'
            notes <<-'END'
            ```
            pred show() {}
            run show for 3 but 1 Book
            ```
            END
        end
        entry do
            name 'Assert and check'
            notes <<-'END'
            ```
            assert shouldAlwaysBeTrue {
                ....
                ....
            }

            check shouldAlwaysBeTrue for 3 but 1 Foo
            ```
            END
        end
    end
    category do
        id 'Ordering'
        entry do
            name ''
            notes <<-'END'
            ```
            open util/ordering[State]

            sig State { ... }
            ```
            END
        end
        entry do
            name 'first, next, last'
            notes <<-'END'
            * `first` returns the first State atom in the linear ordering.
            * `last` returns the last State atom in the linear ordering.
            * `next` maps each State atom (except the last atom) to the next State atom.
            * `lt`
            * `gt`
            * `lte`
            * `gte`
            * `larger`
            * `smaller`
            END
        end
        entry do
            name 'Disambiguating multiple ordered'
            notes <<-'END'
            Use `as <alias>` and do `<alias>/method`

            ```
            open util/ordering[State] as StateOrd
            open util/ordering[Process] as ProcessOrd

            ...

            StateOrd/first
            
            ```
            END
        end
    end
    category do
        id 'Behaviors'
        entry do
            name 'Modeling behaviors'
            notes <<-'END'
            The typical approach is to use ordering to model a sequence of states.

            There are two approaches:

            * predicate-based
            * event-based
            END
        end
        entry do
            name 'Predicate-based'
            notes <<-'END'
			Predicate-based is similar to the TLA+ approach.

			See [River crossing](http://alloy.mit.edu/alloy/tutorials/online/frame-RC-1.html) for an example.

			Here's a skeleton

			```
			open util/ordering[State] 

			sig State { ... }

			// True of the initial state
			pred init[s : State] {
				...
			}

			// True of transitions
			pred nextState[s, s': State] {
				...
			}

			fact traces {
				init[first]
				all s: State, s': s.next | nextState[s, s']
			}
			```
            END
        end
            entry do
            name 'Event-based'
            notes <<-'END'
            In the event-based approach, events are explicitly modelled.

            See <http://cs.brown.edu/courses/cs195y/2017/assignments/alloy-4.html> for an example.

            ```
            open util/ordering[State]

            // Event has a pre-state and a post-state
            abstract sig Event {
                pre, post: State
            }

            // Define custom events
            sig DoSomething extends Event {
            } {
                // define pre, post constraints
            }


            // True of the initial state
            pred init[s: State] {
                ...
            }

            fact traces {
                init[first]
                // All states are the preceding state of an event, except that last one
                all s: State - last | some pre.s
                }
            }
            ```
            END
        end
    end
    category do
        id 'Sequences'
        entry do
            name 'seq'
            notes <<-'END'
            `seq Foo` is shorthand for `Int -> Foo`

            See <http://alloy.mit.edu/alloy/documentation/quickguide/seq.html>
            
            ```
            sig Book { }
            sig Person {
                books: seq Book
            }
            ```
            END
        end
        entry do
            name 'seq helper functions'
            notes <<-'END'
            * `#s` - number of elements
            * `s.elems` - set of elements
            * `s.first`
            * `s.last`
            * `s.rest` - first element removed
            * `s.butlast` - last element removed
            * `s.isEmpty`
            * `s.hasDups`
            * `s.inds`
            * `s.lastIdx`
            * `s.afterLastIdx`
            * `s.idxOf[x]`
            * `s.indsOf[x]`
            * `s.add[x]`
            * `s.setAt[i, x]`
            * `s.insert[i, x]`
            * `s.delete[i]`
            * `s.append[b]`
            * `s.subseq[from, to]`
            END
        end
    end

end
