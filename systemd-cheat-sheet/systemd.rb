cheatsheet do
    title 'systemd'
    docset_file_name 'systemd'
    keyword 'systemd'
    category do
        id 'Logs'
        entry do
            name 'Find OOM in logs'
            notes <<-'END'
            ```bash
            sudo journalctl -k | grep "Out of memory"
            ```
            END
        end
    end
end
