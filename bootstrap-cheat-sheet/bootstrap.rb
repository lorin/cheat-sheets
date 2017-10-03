cheatsheet do
    title 'bootstrap'
    docset_file_name 'bootstrap'
    keyword 'bootstrap'
    category do
        id 'Basics'
        entry do
            name 'Starter example'
            notes <<-'END'
            * [Bootstrap starter template](http://getbootstrap.com/examples/starter-template/)
            * [Navbar docs](https://getbootstrap.com/components/#navbar)
            END
        end
        entry do
            name 'CDN links'
            notes <<-'END'
            See <https://www.bootstrapcdn.com/>
            END
        end
        entry do
            name 'basic navbar'
            notes <<-'END'

            ```
            <body>
             <nav class="navbar navbar-inverse navbar-static-top">
                <div class="container">
                    <a class="navbar-nav" href="#">Project name</a>
                </div>
                <div id="navbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="#about">About</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </div>
             </nav>
            </body>
            
            ```

            Notes:
             * Not fixed to the top of screen (use the `.navbar-fixed-top` class for that)
             * Does not collapse (see the starter template for an example that does)
            END
        end
        entry do
            name 'New Button'
            notes <<-'END'
            ```
            <button type="button" className="btn btn-default active">
                <span className="glyphicon glyphicon-plus"></span> New
            </button>
            ```
            END
        end
    end
    category do
        id 'Forms'
        entry do
            name 'Docs'
            notes <<-'END'
            [Horizontal forms](http://getbootstrap.com/css/#forms-horizontal)
            END
        end
    end
end
