require 'spec_helper'

#describe 'ansible-$role::default' do

  ## serverspec tests go here
  #
  # describe package('ruby2.2') do
  #   it { should be_installed.by('yum') }
  # end

describe "Check nginx package" do
  describe package('nginx') do
    it { should be_installed }
  end
end

describe 'check nginx enabled' do
  describe service('nginx') do
    it { should be_enabled }
  end
end

describe "Check default conf file" do
  describe file('/etc/nginx/nginx.conf') do
    it { should exist }
  end
end

describe "Check current conf file" do
  describe file('/etc/nginx/sites-enabled/default') do
    it { should exist }
  end
end

describe "check nginx default config file" do
  describe command(
    'cat /etc/nginx/nginx.conf'
  ) do
    its(:stdout) { should match /include \/etc\/nginx\/conf.d\/\*\.conf;/ }
    its(:stdout) { should match /include \/etc\/nginx\/sites-enabled\/\*;/ }
  end
end

describe "check nginx current config file" do
  describe command(
    'cat /etc/nginx/sites-enabled/default'
  ) do
    its(:stdout) { should match /hash \$remote_addr;/ }
    its(:stdout) { should match /listen 80/ }
  end
end

describe 'check port' do
  describe port(80) do
    it { should be_listening.with('tcp') }
  end
end