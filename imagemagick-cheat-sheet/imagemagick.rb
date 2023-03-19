cheatsheet do
    title 'imagemagick'
    docset_file_name 'imagemagick'
    keyword 'imagemagick'
    category do
        id ''
        entry do
            name 'crop an image'
            notes <<-'END'
            Crop to 500x360 pixels, with an x offset of 290 and a y offset of 100.

            ```
            convert blocks.jpg -crop "500x360^+290+100" 01.jpg
            ```
            END
        end
    end
end
