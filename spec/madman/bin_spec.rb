require 'spec_helper'

describe 'bin/madman' do
  subject { Madman::CLI.runner }

  it "shows list of commands" do
    expect{ subject.run }.to output_approval('bin/commands')
  end

  context "on exception" do
    it "errors gracefuly" do
      expect(`bin/madman render notfound 2>&1`).to match_approval('bin/exception')
    end
  end
end
