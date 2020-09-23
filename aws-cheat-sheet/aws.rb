cheatsheet do
    title 'aws'
    docset_file_name 'aws'
    keyword 'aws'
    category do
        id ''
        entry do
            name 'Describe volume on an instance'
            notes <<-'END'
            ```
            aws ec2 describe-volumes --region us-west-2 --filters Name=attachment.instance-id,Values=i-13b9ccb68ad0bb1b2
            ```
            END
        end
    end
end
