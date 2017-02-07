# testkitchen
## Install

  gem install test-kitchen
  gem install kitchen-docker

## If you run test in docker you must install docker
  
  yum install docker
  
  systemctl start docker
  
## If you run test with serverspec you must install plugin

  gem install kitchen-verifier-serverspec


  gem 'serverspec'
  
  gem 'test-kitchen'
  
  gem 'kitchen-docker'
  
  gem 'kitchen-ansible'
  
  gem 'kitchen-verifier-serverspec'
