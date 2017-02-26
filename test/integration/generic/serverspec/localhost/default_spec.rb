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

describe "Check wget package" do
  describe package('wget') do
    it { should be_installed }
  end
end