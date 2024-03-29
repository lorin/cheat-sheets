cheatsheet do
    title 'spock'
    docset_file_name 'spock'
    keyword 'spock'
    category do
        id 'The basics'
        entry do
            name 'build.gradle'
            notes <<-'END'
            ```
            apply plugin: 'groovy'

            dependencies {
                ...

                testCompile 'org.spockframework:spock-core:1.1-groovy-2.4'
                testRuntime "net.bytebuddy:byte-buddy:1.6.5"          // allows mocking of classes (in addition to interfaces)
                testRuntime "org.objenesis:objenesis:2.5.1"    // allows mocking of classes without default constructor (together with CGLIB)
            }
            ```
            END
        end
        entry do
            name 'Overview'
            notes <<-'END'
            ```groovy
            import spock.lang.Specification
            import spock.lang.Subject

            class MyTest extends Specification {

                @Subject Widget widget

                def setup() {
                    def thing = Stub(Thing)
                    ...
                }

                def "when it foos then it should bar"() {
                    given: "something"
                    this.something()
                    
                    and: "something else"
                    that.somethingElse()

                    when: "thing does a foos"
                    def result = thing.foos()

                    then: "the result is bar"
                    result == "bar"

                }
            }
            
            ```
            END
        end
    end
    category do
        id 'Assertions'
        entry do
            name 'Simple assertions'
            notes <<-'END'
            ```groovy
            then:
            foo == 3
            ```
            END
        end
        entry do
            name 'Single invocation'
            notes <<-'END'
            ```groovy
            then:
            1 * foo.bar(3, 4)
            ```
            END
        end
        entry do
            name 'Checking invocation with return value'
            notes <<-'END'
            If your mock needs to return a value, and you want
            to check it was called, you have to specify it exactly once.

            FOr 

            ```
            ```
            END
        end
        entry do
            name 'Never called with any args'
            notes <<-'END'
            ```groovy
            then:
            0 * foo.bar(_, _)
            ```

            Alternatively:

            ```groovy
            then:
            0 * foo.bar(*_)
            ```
            END
        end
        entry do
            name 'Complex assertion on argument passed (argument capture)'
            notes <<-'END'
            ```groovy
            1 * foo.bar({ it.getCount() == 12 })
            ```

            The weakness of the above method is that you do not get a meaningful
            message if the assertion fails, you just get "it didn't get called".
            See below for even better.
            END
        end
        entry do
            name 'Even better assertions on argument capture'
            notes <<-'END'
            ```groovy
            1 * foo.baz(*_) >> { args ->
                // destructure
                // you can also do args[0], args[1]
                def (x,y) = args
                assert x.getCount() == 12
                assert y == "quux"
            }
            ```
            END
        end
    end
    category do
        id 'Mock & Stub behavior'
        entry do
            name 'Return one thing'
            notes <<-'END'
            ```groovy
            given:
            def widget = Stub(widget)
            widget.foo() >> "bar"
            ```
            END
        end
        entry do
            name 'Return one thing and ensure only called once'
            notes <<-'END'
            ```groovy
            given:
            def widget = Mock(widget)
            1 * widget.foo() >> "bar"

            ...
            ```
            END
        end
        entry do
            name 'Do not care about argument'
            notes <<-'END'
            ```
            // don't care about second arg
            widget.foo(4, _) >> "output"

            // don't care about any args
            widget.foo(_*) >> "output"
            
            ```
            END
        end
        entry do
            name 'Multiple calls return different things'
            notes <<-'END'
            ```
            widget.foo() >>> ["bar", "baz", "quux"]
            ```
            END
        end
    end
    category do
        id 'Kotlin'
        entry do
            name 'Mocking Kotlin classes'
            notes <<-'END'
            Mocked classes and methods must be marked `open`

            ```kotlin
            open class Foo {
                open fun bar(s : String) {
                    ...
                }
            }
            ```
            END
        end
    end
end
