cheatsheet do
    title 'spring'
    docset_file_name 'spring'
    keyword 'spring'
    category do
        id 'Config'
        entry do
            name 'Read a property'
            notes <<-'END'
            From <https://stackoverflow.com/questions/30528255/how-to-access-a-value-defined-in-the-application-properties-file-in-spring-boot>

            By injection:

            ```java
            @Value("${userBucket.path}")
            private String userBucketPath;
            ```

            By method call:

            ```java
            @Autowired
            private Environment env;
            ....

            public void method() {
                .....  
                String path = env.getProperty("userBucket.path");
                .....
            }
            ```
            END
        end
        entry do
            name 'Custom config file for test'
            notes <<-'END'
            Use the `@ActiveProfiles` annotation.

            Example: src/main/resources/application-smoketest.yml

            ```yaml
            spring:
              datasource:
                url: jdbc:h2:mem:test
            ```

            Invoked like this:

            ```java
            import org.junit.Test;
            import org.junit.runner.RunWith;
            import org.springframework.boot.test.context.SpringBootTest;
            import org.springframework.test.context.ActiveProfiles;
            import org.springframework.test.context.junit4.SpringRunner;

            @RunWith(SpringRunner.class)
            @SpringBootTest
            @ActiveProfiles("smoketest")
            public class SmokeTest {

                @Test
                public void mytest() { ... }
            }
            ```
            END
        end
    end
    category do
        id 'Controllers'
        entry do
            name 'Serve index.html from a rendered template'
            notes <<-'END'
            Add thymeleaf to build.gradle:

            ```groovy
            dependencies {
                compile "org.springframework.boot:spring-boot-starter-thymeleaf"
            }
            ```

            Create a controller that returns the name of the template

            ```java
            import org.springframework.stereotype.Controller;
            import org.springframework.web.bind.annotation.RequestMapping;

            @Controller
            public class IndexController {
                @RequestMapping("/")
                // This returns the name of the template, without the extension
                // In this case: index.html
                public String index() {
                    return "index";
                }
            }
            ```

            Create src/main/resources/templates/index.html

            END
        end
        entry do
            name 'Hello, world controller at /'
            notes <<-'END'
            ```java
            import org.springframework.web.bind.annotation.RequestMapping;
            import org.springframework.web.bind.annotation.RestController;

            @RestController
            public class HelloController {
                @RequestMapping("/")
                public String index() {
                    return "Hello, world!";
                }
            }
            ```
            END
        end
        entry do
            name 'Path parameter'
            notes <<-'END'
            ```kotlin
            @RestController
            class DebugController constructor () {

                @GetMapping("/debug/{arg}")
                fun param(@PathVariable arg : String) : String {
                    System.out.println(arg)
                    return arg
                }
            }
            ```
            END
        end
    end
    category do
        id 'Miscellaneous'
        entry do
            name 'Run something on startup'
            notes <<-'END'
            Create a bean that returns a CommandLineRunner, have the code just return
            a lambda with the desired code.

            ```java
            @Bean
            public CommandLineRunner helloWorld() {
                return args -> System.out.println("Hello, world!!!");
            }
            ```
            END
        end
    end
end
