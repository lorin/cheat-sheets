cheatsheet do
    title 'Java'
    docset_file_name 'Java'
    keyword 'java'
    category do
        id 'Time'
        entry do
            name 'Gist with conversions'
            notes <<-'END'
            <https://gist.github.com/mscharhag/9195718>
            END
        end
        entry do
            name 'Convert time interval to milliseconds'
            notes <<-'END'
            ```java
            import java.util.concurrent.TimeUnit;

            long millis = TimeUnit.MINUTES.toMillis(5);
            ```
            END
        end
        entry do
            name 'Convert datetime to epoch milis'
            notes <<-'END'
            ```java
            ZonedDateTime time = ...;
            long timestamp = time.toInstant().toEpochMilli();
            ```
            END
        end
        entry do
            name 'Instantiate from year/month/date'
            notes <<-'END'
            ```java
            ZonedDateTime time = ZonedDateTime.of(year, month, day, hour, minute, second, nanoOfSecond, ZoneOffset.UTC);
            ```
            END
        end
        entry do
            name 'Convert from epoch milis to UTC or PT'
            notes <<-'END'
            ```java
            long timestamp = ...;
            Instant i = Instant.ofEpochMilli(timestamp);
            ZonedDateTime t = i.atZone(ZoneOffset.UTC);

            ZonedDateTime pt = i.atZone(ZoneId.of("US/Pacific"));
            ```
            END
        end
        entry do
            name 'Convert from epoch millis to local datetime string'
            notes <<-'END'
            ```java
            long timestamp = ...; LocalDateTime dateTime = Instant.ofEpochMilli(timestamp).atZone(ZoneId.systemDefault()).toLocalDateTime();
            String local = dateTime.format(DateTimeFormatter.ISO_LOCAL_DATE_TIME);
            ```

            Check out the DateTimeFormatter docs for predefined formatters.
            END
        end
        entry do
            name 'strftime: Convert from epoch millis to HH:mm:ss string in local time'
            notes <<-'END'
            ```java
            long timestamp = ...; LocalDateTime dateTime = Instant.ofEpochMilli(timestamp).atZone(ZoneId.systemDefault()).toLocalDateTime();
            DateTimeFormatter df = DateTimeFormatter.ofPattern("HH:mm:ss");
            String hoursMinSec = dateTime.format(df);

            // Another example: MM/dd/yyyy HH:mm a
            ```
            END
        end
    end
    category do
        id 'File I/O'
        entry do
            name 'Write to a text file'
            notes <<-'END'
            ```java
            try(PrintWriter os = new PrintWriter(new FileWriter("myfile.txt"))) {
                os.println("I'm writing to a file!");
            }
            ```
            END
        end
    end
    category do
        id 'Generics'
        entry do
            name 'Define a generic method'
            notes <<-'END'
            ```java
            static <T,U> Optional<U> get(Map<T,U> map, T key) {
                return Optional.ofNullable(map.get(key));
            }
            ```
            END
        end
    end
    category do
        id 'JDBC'
        entry do
            name 'Library for mysql (build.gradle)'
            notes <<-'END'
            ```groovy
            dependencies {
                ...
                compile "mysql:mysql-connector-java:5.1.44"
            
            ```
            END
        end
        entry do
            name 'Setting up a mysql connection'
            notes <<-'END'
            ```java
            import java.sql.Connection;
            import java.sql.DriverManager;
            import java.util.Properties;

            // Assumptions:
            //  * SSL is enabled
            //  * Cert of server is trusted in keystore file
            //  * Keystore file has been saved to src/main/resources
            private Connection getConnection(String hostname, String database, String user, String password, String keystoreFilename, keystorePassword) throws SQLException {
                String url = String.format("jdbc:mysql://%s/%s", hostname, database);
                Properties props = new Properties();
                props.setProperty("user", user);
                props.setProperty("password", password);
                props.setProperty("verifyServerCertificate", "true");
                props.setProperty("useSSL", "true");
                props.setProperty("requireSSL", "true");
                props.setProperty("trustCertificateKeyStoreUrl", getClass().getClassLoader().getResource(keystoreFilename).toString());
                props.setProperty("trustCertificateKeyStorePassword", keystorePassword);
                return DriverManager.getConnection(url, props);
            }
            
            ```
            END
        end
        entry do
            name 'Basic query'
            notes <<-'END'
            ```java
            private void query(Connection conn) throws SQLException {
                try (Statement stmt = conn.createStatement()) {
                    String sql = "SELECT `key`, `value` FROM test";
                    try (ResultSet rs = stmt.executeQuery(sql)) {

                        while (rs.next()) {
                            String key = rs.getString("key");
                            String value = rs.getString("value");
                            System.out.println(String.format("key=%s, value=%s", key, value));
                        }
                    }
                }
            }
            
            ```
            END
        end
    end
    category do
        id 'RxJava'
        entry do
            name 'Consume an observable'
            notes <<-'END'
            ```java
            Observable<Event> obs = ...;
            obs.subscribe(e -> {
                doSomethingWithEvent(e);
                ...
            });
            ```
            END
        end
        entry do
            name 'flatMap'
            notes <<-'END'
            flatMap is like Haskell's bind. Recall that bind works like:

            ```
            T a -> (a -> T b) -> T b
            ```

            In Rx, flatMap takes:

            1. an `Observable<T>`
            2. a function that takes `T` and returns `Observable<R>`.

            It returns `Observable<R>`.

            It works by calling the function on the elements of `Observable<A>`, and
            then merging the resulting observables together to form a single observable.
            END
        end
        entry do
            name 'Observable to list'
            notes <<-'END'
            ```java
            Observable<T> obs = ...;
            List<T> l = obs.toList().toBlocking().single();
            ```
            END
        end
        entry do
            name 'Un-nest observables'
            notes <<-'END'
            ```java
            Observable<Observable<Event>> nested = ...;
            Obserable<Event> obs = nested.flatMap(x->x);
            ```
            END
        end
        entry do
            name 'List to observable'
            notes <<-'END'
            ```java

            List<Event> l = ...;
            Observable<Event> = Observable.from(l);

            // Using flatMap
            Observable<List<Event>> ole = ...;
            Observable<Event> obs = ole.flatMap(Observable::from);
            ```
            END
        end
    end
    category do
        id 'Streams'
        entry do
            name 'List of maps to single map, clobbering duplicate keys'
            notes <<-'END'
            ```java
            List<Map<String, Long>> input = ...;
            output = input.stream().reduce(new HashMap<>(), (x, y) -> {
                Map<String, Long> result = new HashMap<>(x);
                result.putAll(y);
                return result;
            });
            ```
            END
        end
    end
    category do
        id 'Mocking'
        entry do
            name 'Deep mocking'
            notes <<-'END'
            ```
            MyClass x= mock(MyClass.class, Mockito.RETURN_DEEP_STUBS);
            ```
            END
        end
        entry do
            name 'Set method behavior of mock object'
            notes <<-'END'
            ```java
            import static org.mockito.Mockito.mock;
            import static org.mockito.Mockito.when;

            MyClass x = mock(MyClass.class);
            when(x.myFunc()).thenReturn("dummy value");
            ```
            END
        end
        entry do
            name 'Multiple calls that do different things'
            notes <<-'END'
            ```
            import static org.mockito.Mockito.mock;
            import static org.mockito.Mockito.when;

            MyClass x = mock(MyClass.class);
            when(x.myFunc())
                .thenReturn("first dummy value")
                .thenReturn("second dummy value");
            ```
            END
        end
        entry do
            name 'Match any argument'
            notes <<-'END'
            ```java

            import static org.mockito.Mockito.mock;
            import static org.mockito.Matchers.any;

            MyClass x = mock(MyClass.class);

            when(x.foo(any())).thenReturn(12);

            ```

            When matching primitives (e.g., boolean, long), you'll get an NPE
            unless you use specific functions: `anyBoolean`, `anyLong`
            END
        end
        entry do
            name 'Check that a mock was called'
            notes <<-'END'
            ```java
            import static org.mockito.Mockito.mock;
            import static org.mockito.Matchers.any;

            MyClass x = mock(MyClass.class);
            ...
            verify(x).foo(any());

            ```
            END
        end
        entry do
            name 'Check some arguments but not all'
            notes <<-'END'
            If you want to use `any()` on some args,
            you need to use `eq` to match other ones exactly.

            ```
            verify(x).foo(eq("one"), any());
            ```
            END
        end
        entry do
            name 'Check that a mock was never called'
            notes <<-'END'
            ```java
            import static org.mockito.Matchers.any;
            import static org.mockito.Mockito.mock;
            import static org.mockito.Mockito.never;

            MyClass x = mock(MyClass.class);
            ...
            verify(x, never()).foo(any());

            ```
            END
        end
        entry do
            name 'Capture an argument'
            notes <<-'END'
            ```java
            import org.mockito.ArgumentCaptor;

            import static org.mockito.Mockito.mock;
            import static org.mockito.Mockito.when;

            // Setup
            Client client = mock(Client.class);
            Response response = mock(Response.class);

            // Argument capture logic here
            ArgumentCaptor<URI> url = ArgumentCaptor.forClass(URI.class);
            when(client.get(url.capture())).thenReturn(response);

            // Code under test, expects to call client.get
            myClass.doTheThing(client);

            assertEquals("http://www.example.com", url.getValue().toString());
            ```
            END
        end
        entry do
            name 'Capture a generic argument with custom runner'
            notes <<-'END'
            ```java
            import org.mockito.Captor;
            import org.mockito.runners.MockitoJUnitRunner;

            @RunWith(MockitoJUnitRunner.class)
            public class MyTest {

                @Captor
                ArgumentCaptor<List<Foo>> arg;

                ...

            }

            ```
            END
        end
        entry do
            name 'Capture a generic argument with unsafe cast'
            notes <<-'END'
            ```java
            ArgumentCaptor<List<Foo>> arg = ArgumentCaptor.forClass((Class) List.class);
            ```
            END
        end
        entry do
            name 'Capture an argument with a method that returns void'
            notes <<-'END'
            ```java
            ArgumentCaptor<URI> url = ArgumentCaptor.forClass(URI.class);
            doNothing().when(client).get(url.capture()));

            assertEquals("http://www.example.com", url.getValue().toString());
            ```
            END
        end
        entry do
            name 'Mock a single method with spy'
            notes <<-'END'
            ```java
            import org.mockito.Mockito;
            import static org.mockito.Mockito.spy;

            MyClass x = spy(new MyClass());
            Mockito.doReturn("hello").when(x).foo();
            ```
            END
        end
        entry do
            name 'Unmock a single method'
            notes <<-'END'
            ```java
            when(myobj.foo(any())).thenCallRealMethod();
            ```
            END
        end
        entry do
            name 'Unmock a single method that returns void'
            notes <<-'END'
            ```
            doCallRealMethod().when(myobj).foo(any());
            ```
            END
        end
        entry do
            name 'Annotation-based mocking'
            notes <<-'END'
            ```
            @RunWith(MockitoJUnitRunner.class)
            public class MyTest {

                @Mock
                Foo foo;

                @Mock
                Bar bar;

                @Mock(answer = Answers.RETURNS_DEEP_STUBS)
                Baz baz;

                // tests go here
            ```
            END
        end
    end
    category do
        id 'AssertJ matchers'
        entry do
            name 'Docs / examples'
            notes <<-'END'
            * <http://joel-costigliola.github.io/assertj/index.html>
            * <https://github.com/joel-costigliola/assertj-examples/blob/master/assertions-examples/src/test/java/org/assertj/examples>
            END
        end
        entry do
            name 'Basics'
            notes <<-'END'
            ```java
            import static org.assertj.core.api.Assertions.*;

            assertThat(frodo.getName()).isEqualTo("Frodo");
            ```
            END
        end
        entry do
            name 'Lists'
            notes <<-'END'
            <https://github.com/joel-costigliola/assertj-examples/blob/master/assertions-examples/src/test/java/org/assertj/examples/IterableAssertionsExamples.java>

            ```java
            import static org.assertj.core.api.Assertions.assertThat;

            assertThat(result).isEmpty();
            assertThat(result).isNotEmpty();
            assertThat(result).hasSize(1);

            assertThat(result).contains("foo");

            // Must contain them all, and only those, but order doesn't matter
            assertThat(result).containsOnly("foo", "bar")

            assertThat(result).hasOnlyOneElementSatisfying(object -> {
                assertThat(object)...;
            });
            ```
            END
        end
        entry do
            name 'Check an optional'
            notes <<-'END'

            See  <https://github.com/joel-costigliola/assertj-examples/blob/master/assertions-examples/src/test/java/org/assertj/examples/OptionalAssertionsExamples.java>

            ```java
            Optional<String> result = Optional.of("foo");

            assertThat(result).isPresent();

            assertThat(result).isPresent()
                              .contains("foo");

            assertThat(result).hasValueSatisfying(x -> {
                assertThat(x).isEqualTo("foo");
            });
            ```
            END
        end
    end
    category do
        id 'Hamcrest matchers'
        entry do
            name 'Check collection is empty'
            notes <<-'END'
            ```java
            import static org.hamcrest.Matchers.empty;
            import static org.hamcrest.Matchers.is;
            import static org.junit.Assert.assertThat;

            ...
            assertThat(list, is(empty()));

            ```

            From <http://stackoverflow.com/a/5569842/742>
            END
        end
        entry do
            name 'Check that a collection contains the exact entries'
            notes <<-'END'
            ```
            assertThat(collection, contains("foo", "bar", "baz"));
            ```
            END
        end
        entry do
            name 'Check that a collection contains an item or multiple items'
            notes <<-'END'
            ```
            assertThat(collection, hasItem("foo"))
            assertThat(collection, hasItems("foo", "bar", "baz"))
            ```
            END
        end
        entry do
            name 'Check that one of a list of maps has specific entries'
            notes <<-'END'
            ```java
            List<Map<String, String>> listOfMaps = ...;
            assertThat(listOfMaps, hasItem(allOf(
                    IsMapContaining.hasEntry("key1", "value1"),
                    IsMapContaining.hasEntry("key2", "value2")
            )));
            ```
            END
        end
    end
    category do
        id 'Parameterized tests'
        entry do
            name 'Official docs'
            notes <<-'END'
            <https://github.com/junit-team/junit4/wiki/Parameterized-tests>
            END
        end
        entry do
            name 'Only one variable changes'
            notes <<-'END'
            ```java
            import java.util.Arrays;

            import org.junit.runner.RunWith;
            import org.junit.runners.Parameterized;
            import org.junit.runners.Parameterized.Parameter;
            import org.junit.runners.Parameterized.Parameters;

            @RunWith(Parameterized.class)
            public class MyTest {
                @Parameters
                public static Iterable<? extends Object> data() {
                    return Arrays.asList("foo", "bar");
                }
            }

                @Parameter
                public String value;
            ...
            ```
            END
        end
        entry do
            name 'Multiple variables change'
            notes <<-'END'
            ```java
            import java.util.Arrays;

            import org.junit.runner.RunWith;
            import org.junit.runners.Parameterized;
            import org.junit.runners.Parameterized.Parameter;
            import org.junit.runners.Parameterized.Parameters;

            @RunWith(Parameterized.class)
            public class MyTest {
                @Parameters
                public static Collection<Object[]> data() {
                    return Arrays.asList(new Object[][] {
                     {1, 2, 4}, {3, 5, 12}
                    });
               }

               @Parameter
               public int x;

               @Parameter(value=1)
               public int y;

               @Parameter(value=2)
               public int z;
            }
            ```
            END
        end
        entry do
            name 'Some tests paramterized, some not'
            notes <<-'END'
            Need an outer test class annotated with

            ````
            @RunWith(Enclosed.class)
            ```

            Then have public inner static test classes, annotate the parameterized one.
            END
        end
    end
    category do
        id 'JSON'
        entry do
            name 'Populate JsonNode'
            notes <<-'END'
            ```java
            import com.fasterxml.jackson.map.ObjectMapper;
            import com.fasterxml.jackson.JsonNode;

            String json = "{\"foo\": 12}";

            JsonNode data = new ObjectMapper().readTree(json);
            ```
            END
        end
        entry do
            name 'JSON to Java object'
            notes <<-'END'
            ```
            import com.fasterxml.jackson.databind.ObjectMapper

            ObjectMapper mapper = new ObjectMapper()
            MyClass myClass = mapper.readValue('{"id": "e9d1e87a-ea6d-11e6-b413-a45e60df95f9"}', MyClass.class)
            ```
            END
        end
        entry do
            name 'Map to Java object'
            notes <<-'END'
            ```
            Map<String, String> bag = ...;
            MyClass myClass = mapper.convertValue(bag, Run.class)
            ```
            END
        end
        entry do
            name 'JSON list to Java list'
            notes <<-'END'
            ```
            import com.fasterxml.jackson.databind.ObjectMapper;
            ...
            // Event is any user-defined class
            public static List<Event> convert(String str) throws IOException {
               ObjectMapper objectMapper = new ObjectMapper();
               TypeReference<List<Event>> eventListType = new TypeReference<List<Event>>(){};
               return objectMapper.readValue(str, eventListType);
            }
            ```
            END
        end
        entry do
            name 'Convert millis in JSON to date'
            notes <<-'END'
            Just use java.util.Date, and Jackson will do the right thing.

            ```
            import java.util.Date;
            public class Event {
                ...
                public Date date;
            }
            ```
            END
        end
    end
    category do
        id 'Miscellaneous stuff'
        entry do
            name 'Load a resource'
            notes <<-'END'
            ```java
            import com.google.common.io.Resources;
            import java.io.IOException;
            import java.net.URL;
            import java.nio.charset.Charset;

            public class TestClass {

                ...

                /**
                 * Load a fixture file from "/src/test/resources"
                 * @param fname name of the file to load
                 * @return contents of the file
                 */
                String loadFixture(String fname) throws IOException {
                    URL url = this.getClass().getResource("/" + fname);
                    return Resources.toString(url, Charset.forName("UTF-8"));
                }
            }
            ```
            END
        end
    end
    category do
        id 'Enums'
        entry do
            name 'Declare an enum'
            notes <<-'END'
            ```java
            public enum State {ON, OFF, HALFWAY}
            ```
            END
        end
        entry do
            name 'To string'
            notes <<-'END'
            ```java
            assertThat(State.ON.name()).isEqualTo("ON");
            ```

            END
        end
        entry do
            name 'From string'
            notes <<-'END'
            ```java
            assertThat(State.valueOf("HALFWAY")).isEqualTo(State.HALFWAY);
            ```
            END
        end
    end
    category do
        id 'Gradle'
        entry do
            name 'Execute from the command-line'
            notes <<-'END'
            In build.gradle

            ```groovy
            apply plugin: 'application'
            mainClassName = "org.example.packagename.MyClass"
            ```

            To execute:

            ```bash
            gradlew run
            ```

            END
        end
    end
    category do
        id 'Logging'
        entry do
            name 'Create a logger'
            notes <<-'END'
            ```java
            import org.slf4j.Logger;
            import org.slf4j.LoggerFactory;

            class MyClass {
                private final Logger logger = LoggerFactory.getLogger(this.getClass());
            }
            
            ```
            END
        end
    end
    category do
        id 'JUnit theories'
        entry do
            name 'Docs'
            notes <<-'END'
            <https://github.com/junit-team/junit4/wiki/Theories>
            END
        end
    end
end

