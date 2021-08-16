cheatsheet do
    title 'minutest'
    docset_file_name 'minutest'
    keyword 'minutest'
    category do
        id ''
        entry do
            name 'Skip a test'
            notes <<-'END'
            ```kotlin
            // Can focus on one particular test (skip others), or skip a particular test


            // Apply the FOCUS annotation to a test
            FOCUS - test("this test is focused, only other focused things will be run") {}


            // apply the SKIP annotation to not run whatever
            SKIP - test("skip overrides the focus") {
                fail("should not have run")

            }

            SKIP - context("also applies to context") {
                    test("will not be run") {
                        fail("should not have run")
                    }
                }
            ```

            * [Focus and Skip](https://github.com/dmcg/minutest/blob/master/docs/focus-and-skip.md)
            * [SkipAndFocusExampleTests.kt](https://github.com/dmcg/minutest/blob/master/core/src/test/kotlin/dev/minutest/examples/experimental/SkipAndFocusExampleTests.kt)
            END
        end
    end
end
