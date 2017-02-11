require 'spec_helper'

describe 'ansible-$role::default' do

  ## serverspec tests go here
  #
  # describe package('ruby2.2') do
  #   it { should be_installed.by('yum') }
  # end

   describe user('root') do
     it { should exist }
   end

   describe package('curl') do
     it { should be_installed }
   end


end
