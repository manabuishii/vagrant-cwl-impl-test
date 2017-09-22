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
