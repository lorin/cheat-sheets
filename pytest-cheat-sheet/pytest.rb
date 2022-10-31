cheatsheet do
    title 'pytest'
    docset_file_name 'pytest'
    keyword 'pytest'
    category do
        id ''
        entry do
            name 'The basics'
            notes <<-'END'
            ```python
            import pytest

            def test_my_func():
                assert 1==1

            @pytest.mark.skip(reason="reason is optional")
            def test_skip_me():
                assert False

            pytest.main()

            ```
            END
        end
    end
end
