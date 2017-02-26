require 'spec_helper'

#describe 'ansible-$role::default' do

  ## serverspec tests go here
  #
  # describe package('ruby2.2') do
  #   it { should be_installed.by('yum') }
  # end


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


describe "Check packages" do
  describe package('curl') do
    it { should be_installed }
  end
end

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


describe 'check port' do
  describe port(80) do
    it { should be_listening.with('tcp') }
  end
end