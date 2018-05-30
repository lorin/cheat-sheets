cheatsheet do
    title 'ubuntu'
    docset_file_name 'ubuntu'
    keyword 'ubuntu'
    category do
        id 'Images'
        entry do
            name 'Amazon EC2 AMI Locator'
            notes <<-'END'
            <https://cloud-images.ubuntu.com/locator/ec2/>
            END
        end
        entry do
            name 'Example AMI image name'
            notes <<-'END'
            For us-west-1, xenial 64-bit hvm ebs-backed:

            ```
            ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20170202
            ```
            END
        end
    end
    category do
        id 'Packages'
        entry do
            name 'What package provides that file'
            notes <<-'END'
            ```
            $ dpkg -S /usr/bin/python
            python-minimal: /usr/bin/python
            ```
            END
        end
        entry do
            name 'Info about a package'
            notes <<-'END'
            Browse to `http://package.ubuntu.com/$release/$package`

            For example: <http://packages.ubuntu.com/xenial/python-minimal>

            END
        end
    end
    category do
        id 'Python'
        entry do
            name 'Install python2 in /usr/bin/python'
            notes <<-'END'
            ```
            apt-get install python-minimal
            ```

            This will install python2.7 as a dependency, and also puts the /usr/bin/python executable in the right place.
            END
        end
    end
endnd
