cheatsheet do
    title 'click'
    docset_file_name 'click'
    keyword 'click'
    category do
        id 'Basics'
        entry do
            name 'Simple (no subcommand)'
            notes <<-'END'
            ```python
            import click

            @click.command()
            @click.argument('foo')
            @click.argument('bar')
            @click.argument('baz')
            @click.option('-q', '--quux')
            def main(foo, bar, baz, quux):
                print(f"You passed: {foo}")


            if __name__ == "__main__":
                main()
            ```
            END
        end
    end
end
