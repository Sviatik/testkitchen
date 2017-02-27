# Test Kitchen / doker / ansible / serverspec
## Install all soft
    sudo yum install gem docker git
    
    sudo gem install test-kitchen
    sudo gem install kitchen-ansible
    sudo gem install kitchen-docker
    sudo gem install kitchen-verifier-serverspec
    sudo gem install net-ssh --version 3.2.0
    sudo gem uninstall net-ssh --version 4.1.0
    
## Run test kitchen
    sudo systemctl start docker
    sudo systemctl enable docker
    
    git clone http://192.168.103.232/sstettc/testkitchen.git 
    or
    git clone https://github.com/Sviatik/testkitchen.git
    
    cd testkitchen
    kitchen destroy
    kitchen create
    kitchen converge
    kitchen verify
    
    
    
    
    
    
    
    
    
    
    
    
    
# Trouble-shuting
    If you try run testkitchen on openstack instance you must do this step
        sudo groupadd docker
        sudo usermod $USER -aG docker
        Logout and login again
        
    If you have problem with usermod (command not found) run this
        sudo chmod +x /usr/sbin/usermod    
        



## Ansible Test Kitchen Example

We can use [test-kitchen](https://github.com/test-kitchen/test-kitchen) with [serverspec](http://serverspec.org/) to run some basic tests for our ansible roles.

Test kitchen allows us to do the following

```
1. spin up docker container
2. provision container using ansible role
3. test that our ansible role did everything we wanted it to
```

The files contained in this repo should be enough to get you easily started with testing ansible roles using serverspec.

##### 0. `requirements.yml`

This are the dependencies listed in meta/main of your ansible role. If there are no dependecies, remove `requirements_path:` from `.kitchen.yml`

##### 1. `.travis.yml`

Describes how to run everything on travis-ci. If you are not using travis-ci, you can omit this file.

##### 2. `.kitchen.yml`

Describes what to run our serverspec tests on (docker, vagrant, ec2), and how to provision our hosts.

##### 3. `/test/integration/serverspec/default.yml`

This is the ansible playbook we run to provision our hosts. The most basic function is just installing our ansible role on the host machine.

##### 4. `/test/integration/serverspec/localhost/default_spec.rb`

This is the serverspec file that contains the tests to run against our hosts. For resource types see the [documentation](http://serverspec.org/resource_types.html).

