cheatsheet do
    title 'spring'
    docset_file_name 'spring'
    keyword 'spring'
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
    end
end
