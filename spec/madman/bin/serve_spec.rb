require 'spec_helper'

describe 'bin/madness-serve' do
  subject { MisterBin::Runner.new 'madman', basedir: 'bin' }

  context "without arguments" do
    it "shows short usage" do
      expect{ subject.run %w[serve]}.to output_fixture('cli/serve/usage')
    end
  end

  context "with --help" do
    it "shows long usage" do
      expect{ subject.run %w[serve --help] }.to output_fixture('cli/serve/help')
    end
  end

  context "with required arguments" do
    let(:infile) { 'spec/fixtures/hello.md' }
    let(:argv) { %W[serve #{infile}] }

    it "calls the server" do
      expect(Server).to receive(:options)
      expect(Server).to receive(:run!)
      expect{ subject.run argv }.to output_fixture('cli/serve/run')
    end
  end
end
