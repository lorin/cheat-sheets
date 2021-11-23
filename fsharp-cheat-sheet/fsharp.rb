cheatsheet do
    title 'fsharp'
    docset_file_name 'fsharp'
    keyword 'fsharp'
    category do
        id ''
        entry do
            name 'Scripting'
            notes <<-'END'
            ```fsharp
            #!/usr/bin/env dotnet fsi

            let getOddSquares xs =
                xs
                |> List.filter (fun x -> x % 2 <> 0)
                |> List.map (fun x -> x * x)

            printfn "%A" (getOddSquares [1..10])
            ```
            END
        end
    end
end
