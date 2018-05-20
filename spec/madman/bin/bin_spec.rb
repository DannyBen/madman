require 'spec_helper'

describe 'bin/madman' do
  subject { MisterBin::Runner.new 'madman', basedir: 'bin' }

  it "shows list of commands" do
    expect{ subject.run }.to output_fixture('bin/commands')
  end

  context "on exception" do
    it "errors gracefuly" do
      expect(`bin/madman render notfound 2>&1`).to match_fixture('bin/exception')
    end
  end
end
