require 'spec_helper'

describe 'bin/madman' do
  subject { MisterBin::Runner.new 'madman', basedir: 'bin' }

  it "shows list of commands" do
    expect{ subject.run }.to output_fixture('cli/commands')
  end

  context "on exception" do
    it "errors gracefuly" do
      expect(`bin/madman render notfound 2>&1`).to match_fixture('cli/exception')
    end
  end
end
