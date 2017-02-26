# Test Kitchen / doker / ansible / serverspec
## Install all soft
    yum install gem docker git
    
    gem install test-kitchen
    gem install kitchen-ansible
    gem install kitchen-docker
    gem install kitchen-verifier-serverspec
    gem install net-ssh --version 3.2.0
    gem uninstall net-ssh --version 4.1.0
    
## Run test kitchen
    systemctl start docker
    systemctl enable docker
    
    git clone http://192.168.103.232/sstettc/testkitchen.git 
    or
    git clone https://github.com/Sviatik/testkitchen.git
    
    cd testkitchen
    kitchen create
    kitchen converge
    kitchen verify
    
    
    
    
    
    
    
    
    
    
    
    
    
    #trouble-shuting
    If you try run testkitchen on openstack instance you must do this step
        sudo groupadd docker
        sudo usermode $USER -aG docker
        Logout and login again
