require 'spec_helper'

#describe 'ansible-$role::default' do

  ## serverspec tests go here
  #
  # describe package('ruby2.2') do
  #   it { should be_installed.by('yum') }
  # end

describe "Check epel repositories" do
    describe yumrepo('epel') do
        it { should exist }
        it { should be_enabled }
    end
end

describe "Check mysql-server package" do
  describe package('mysql-server') do
    it { should be_installed }
  end
end

describe 'check mysql-server enabled' do
  describe service('mysqld') do
    it { should be_running }
  end
end

describe 'check port' do
  describe port(3306) do
    it { should be_listening.with('tcp') }
  end
end


#describe server(:db) do
#  describe mysql_query("SELECT 1 FROM mysql.user WHERE User='mysql'") do
#    it 'should include at least a user' do
#      expect(results.size).to be >= 1
#    end
#  end
#end

#describe server(:db) do
#  describe mysql_query("SELECT 1 FROM mysql.user WHERE User='cluster'") do
#    it 'should include at least a user' do
#      expect(results.size).to be >= 1
#    end
#  end
#end