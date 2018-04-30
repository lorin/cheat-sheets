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
            [Bootstrap button docs](https://getbootstrap.com/docs/4.0/components/buttons/)

            Glyphicons are gone in Bootstrap 4, one alternative is [Open Iconic](https://useiconic.com/open),
            npm package [open-iconic](https://www.npmjs.com/package/open-iconic).

            This creates a link that looks like a button labelled "+ New".

            ```html
            <a href="/widgets/new" className="btn btn-dark" role="button">
                <span className="oi oi-plus"></span> New
            </a>
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
