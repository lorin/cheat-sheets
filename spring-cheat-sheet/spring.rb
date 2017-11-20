cheatsheet do
    title 'spring'
    docset_file_name 'spring'
    keyword 'spring'
    category do
        id 'Controllers'
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
