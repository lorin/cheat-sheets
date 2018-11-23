cheatsheet do
    title 'chrome'
    docset_file_name 'chrome'
    keyword 'chrome'
    category do
        id ''
        entry do
            name 'Next / previous tab'
            notes <<-'END'
            ```
            ⌘  ⌥  →
            ⌘  ⌥  ←
            ```
            END
        end
        entry do
            name 'Dev tools keyboard shortcut'
            notes <<-'END'
            ```
            ⌘  ⌥  I

            CMD ALT I
            ```
            END
        end
        entry do
            name 'Examine cookies'
            notes <<-'END'
            1. Open Developer Tools
            2. Click Application tab
            3. In the left-hand pane, under Storage, click "Cookies"
            END
        end
        entry do
            name 'Disable PDF viewer'
            notes <<-'END'
            1. Open `chrome://settings/content`
            1. Scroll to the bottom
            1. Under "PDF Dcouments", check "Open PDF Files in the default PDF viewer application".
            END
        end
        entry do
            name 'Custom search engine'
            notes <<-'END'
            1. Chrome > Preferences
            2. Click "Manage search engines"
            3. Other search engines > ADD
            END
        end
    end
    category do
        id 'Video player'
        entry do
            name 'Skip to beginning'
            notes <<-'END'
            ```
            0
            ```

            Other numbers seem to work as percentages (e.g., `2` jumps to 20%).
            END
        end
    end
end
