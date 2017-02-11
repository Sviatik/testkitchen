require '/tmp/kitchen/roles/common/spec/spec_helper.rb'

describe package( 'curl' ) do
    it { should be_installed }
end
