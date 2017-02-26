require 'spec_helper'

#describe 'ansible-$role::default' do

  ## serverspec tests go here
  #
  # describe package('ruby2.2') do
  #   it { should be_installed.by('yum') }
  # end

describe "Check java package" do
  describe package('java-1.7.0-openjdk-devel') do
    it { should be_installed }
  end
end





describe "'appuser' mysql user is created for localhost and all other hosts" do
  describe command(
    'java -version'
  ) do
    its(:stderr) { should match /java version \"1.7/ }
  end
end


describe "Check tomcat package" do
  describe package('tomcat') do
    it { should be_installed }
  end
end

describe 'check tomcat enabled' do
  describe service('tomcat') do
    it { should be_running }
  end
end

describe 'check port' do
  describe port(8080) do
    it { should be_listening.with('tcp') }
  end
end