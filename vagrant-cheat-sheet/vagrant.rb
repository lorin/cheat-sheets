cheatsheet do
    title 'vagrant'
    docset_file_name 'vagrant'
    keyword 'vagrant'
    category do
        id 'Boxes'
        entry do
            name 'Vagrant boxes'
            notes <<-'END'
            https://atlas.hashicorp.com/boxes/search
            END
        end
    end
    category do
        id 'Vagrantfile'
        entry do
            name 'Minimal Vagrantfile with fixed IP'
            notes <<-'END'
            ```
            VAGRANTFILE_API_VERSION = "2"
            Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
              config.vm.box = "ubuntu/trusty64"
              config.vm.network "private_network", ip: "192.168.33.10"
            end
            ```
            END
        end
        entry do
            name 'Multiple boxes'
            notes <<-'END'
            ```
            Vagrant.configure("2") do |config|
                config.vm.define "postgres" do |postgres|
                    postgres.vm.box = "trusty"
                    postgres.vm.network "private_network", ip: "192.168.33.9"
                end
                config.vm.define "ghost" do |ghost|
                    ghost.vm.box = "trusty"
                    ghost.vm.network "private_network", ip: "192.168.33.10"
                end
            end
            ```
            END
        end
        entry do
            name 'Multiple boxes with vagrant provisioner'
            notes <<-'END'
            ```
            VAGRANTFILE_API_VERSION = "2"
            Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
              # Use the same key for each machine
              config.ssh.insert_key = false
              config.vm.define "vagrant1" do |vagrant1|
                vagrant1.vm.box = "ubuntu/trusty64"
              end
              config.vm.define "vagrant2" do |vagrant2|
                vagrant2.vm.box = "ubuntu/trusty64"
              end
              config.vm.define "vagrant3" do |vagrant3|
                vagrant3.vm.box = "ubuntu/trusty64"
                vagrant3.vm.provision "ansible" do |ansible|
                  ansible.limit = 'all'
                  ansible.playbook = "playbook.yml"
                  ansible.groups = {
                    "web"  =>  ["vagrant1"],
                    "task" =>  ["vagrant2"],
                    "redis" => ["vagrant3"]
                  }
                end
              end
            end
            ```
            END
        end
    end
end
