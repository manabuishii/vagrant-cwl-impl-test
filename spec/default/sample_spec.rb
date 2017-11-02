require 'spec_helper'

describe package('screen') do
  it { should be_installed }
end

describe command('which cwltool') do
  its(:stdout) { should match '/usr/local/bin/cwltool' }
end

describe command('which cwl-runner') do
  its(:stdout) { should match '/usr/local/bin/cwl-runner' }
end

describe 'cwltool hello.cwl'  do
  describe file('/tmp/cwltool/response.txt') do
    let(:pre_command) { 'rm -rf /tmp/cwltool ; mkdir /tmp/cwltool ;cd /tmp/cwltool ; cwltool /home/vagrant/workflows/workflows/hello/hello.cwl' }
    its(:content) { should match /Hello World/ }
  end
end

#describe 'cwl-runner hello.cwl'  do
#  describe file('/tmp/cwl-runner/response.txt') do
#    let(:pre_command) { 'rm -rf /tmp/cwl-runner ; mkdir /tmp/cwl-runner ;cd /tmp/cwl-runner ; cwl-runner /home/vagrant/workflows/workflows/hello/hello.cwl' }
#    its(:content) { should match /Hello World/ }
#  end
#end


describe 'cwltoil hello.cwl'  do
  describe file('/tmp/cwltoil/response.txt') do
    let(:pre_command) { 'rm -rf /tmp/cwltoil/response.txt ; mkdir /tmp/cwltoil ;cd /tmp/cwltoil ; cwltoil --defaultMemory 512M /home/vagrant/workflows/workflows/hello/hello.cwl' }
    its(:content) { should match /Hello World/ }
  end
end
