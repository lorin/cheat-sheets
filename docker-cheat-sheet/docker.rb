cheatsheet do
    title 'docker'
    docset_file_name 'docker'
    keyword 'docker'
    category do
        id 'Building and running'
        entry do
            name 'Build and tag an image'
            notes <<-'END'
            ```
            docker build --tag keel-build --file Dockerfile.compile .
            ```
            END
        end
        entry do
            name 'Run gradle tests'
            notes <<-'END'
            ```
            docker run -v $PWD:/keel -w /keel -t keel-build ./gradlew test
            ```
            END
        end
    end
    category do
        id 'Basics'
        entry do
            name 'Port order'
            notes <<-'END'
            ```
            <host>:<container>
            ```

            For example, to map port 80 inside of the container to 8080 in the host:

            ```
            docker run -p 8080:80
            ```
            END
        end
        entry do
            name 'Get info about a running container'
            notes <<-'END'
            ```
            docker inspect <id> > data.json
            ```
            END
        end
        entry do
            name 'Find public images'
            notes <<-'END'
            <https://store.docker.com>
            END
        end
        entry do
            name 'Registry'
            notes <<-'END'
            <https://hub.docker.com>
            END
        end
        entry do
            name 'Pull an image'
            notes <<-'END'
            ```bash
            docker pull mysql:5.6
            ```
            END
        end
        entry do
            name 'Mount directory'
            notes <<-'END'
            Host directory might need to be absolute.

            ```bash
            docker run -v /hostdir:/containerdir ...
            ```
            END
        end
        entry do
            name 'Ports'
            notes <<-'END'
            ```bash
            docker run -p hostport:containerport ...
            ```
            END
        end
        entry do
            name 'Shell in a container'
            notes <<-'END'
            ```bash
            docker exec -ti <container name> bash
            ```
            END
        end
        entry do
            name 'Remove dangling images'
            notes <<-'END'
            ```
            docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
            ```

            From <http://stackoverflow.com/a/32723127/742>
            END
        end
    end
    category do
        id 'Docker Run'
        entry do
            name 'Shell'
            notes <<-'END'
            ```
            docker run -t -i ubuntu:xenial bash
            ```
            END
        end
        entry do
            name 'Override the entrypoint'
            notes <<-'END'
            ```
            docker run -t -i --entrypoint=/bin/bash myimage
            ```
            END
        end
        entry do
            name 'Override the entrypoint with args'
            notes <<-'END'
            ```
            docker run --entrypoint /bin/echo myimage hello world
            ```

            Note that the args go *after* the image name.
            END
        end
    end
    category do
        id 'Cleanup'
        entry do
            name 'Stop all running containers'
            notes <<-'END'
            ```
            docker ps -q | xargs docker kill
            ```
            END
        end
        entry do
            name 'Clean up all stopped containers'
            notes <<-'END'
            ```
            docker ps -aq | xargs docker rm
            ```
            END
        end
        entry do
            name 'Clean up unused images'
            notes <<-'END'

            This will try to remove all images, but won't remove used ones

            ```
            docker images -q | uniq | xargs docker rmi
            ```
            END
        end
    end
    category do
        id 'Config'
        entry do
            name 'Get the mounts for a container'
            notes <<-'END'
            ```bash
            docker inspect <name> | jq '.[0].Mounts'
            ```
            END
        end
    end

    category do
        id 'mysql'
        entry do
            name 'Run'
            notes <<-'END'
            ```bash
            docker run --name mysql -d -e MYSQL_ROOT_PASSWORD=password -p3306:3306 mysql:5.6
            ```
            END
        end
    end
    category do
        id 'Compose'
        entry do
            name 'Simple example'
            notes <<-'END'
            This is right from the [docs](https://docs.docker.com/compose/networking/):

            ```yaml
            version: '2'

            services:
              web:
                build: .
                ports:
                  - "8000:8000"
              db:
                image: postgres
            ```
            END
        end
        entry do
            name 'Reference docs for file format'
            notes <<-'END'
            <https://docs.docker.com/compose/compose-file/>
            END
        end
    end
    category do
        id 'Registry'
        entry do
            name 'docs'
            notes <<-'END'
            * Deploying: https://docs.docker.com/registry/deploying/
            * API: https://docs.docker.com/registry/spec/api/
            END
        end
        entry do
            name 'Start it up'
            notes <<-'END'
            ```bash
            docker run -d -p 5000:5000 --restart=always --name registry registry:2
            ```

            I sometimes use port 5001 because I use corectl which runs another registry at 5000 that I can't use because of issue [#35][1].

            [1]: https://github.com/TheNewNormal/corectl.app/issues/35
            END
        end
        entry do
            name 'Upload an image'
            notes <<-'END'
            ```bash
            docker pull ubuntu && docker tag ubuntu localhost:5001/ubuntu
            docker push localhost:5001/ubuntu
            ```
            END
        end
        entry do
            name 'Hit the API'
            notes <<-'END'
            ```
            $ http get localhost:5000/v2/

            HTTP/1.1 200 OK
            Content-Length: 2
            Content-Type: application/json; charset=utf-8
            Date: Sun, 05 Feb 2017 19:06:05 GMT
            Docker-Distribution-Api-Version: registry/2.0
            X-Content-Type-Options: nosniff

            {}
            ```
            END
        end
        entry do
            name 'Get manifest for an image'
            notes <<-'END'
            ```
            http get localhost:5000/v2/ansiblebook/nginx-ghost/manifests/latest
            ```
            END
        end
    end
    category do
        id 'Docker for Mac'
        entry do
            name 'Disk image'
            notes <<-'END'
            Image location:

            ```
            ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
            ```

            To reclaim all of your space, you can delete it and restart Docker (you'll lose all of your local images).
            END
        end
    end
end
