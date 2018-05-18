require 'spec_helper'

describe 'bin/madness-render' do
  subject { MisterBin::Runner.new 'madman', basedir: 'bin' }

  context "without arguments" do
    it "shows short usage" do
      expect{ subject.run %w[render]}.to output_fixture('cli/render/usage')
    end
  end

  context "with --help" do
    it "shows long usage" do
      expect{ subject.run %w[render --help] }.to output_fixture('cli/render/help')
    end
  end

  context "with input file" do
    let(:infile) { 'spec/fixtures/hello.md' }
    let(:outfile) { 'spec/fixtures/hello.md.html' }
    let(:argv) { %W[render #{infile}] }

    before do 
      File.delete outfile if File.exist? outfile
      expect(File).not_to exist outfile
    end

    after do 
      File.delete outfile if File.exist? outfile
    end

    it "saves an HTML sibling" do
      expect{ subject.run argv }.to output_fixture('cli/render/basic')
      expect(File.read outfile).to match_fixture('hello.html')
    end
  end

  context "with outfile and --rtl" do
    let(:infile) { 'spec/fixtures/hello.md' }
    let(:outfile) { 'tmp/out.html' }

    let(:argv) { %W[render #{infile} #{outfile} --rtl] }

    before do 
      File.delete outfile if File.exist? outfile
      expect(File).not_to exist outfile
    end

    it "shows the HTML with RTL enabled" do
      expect{ subject.run argv }.to output_fixture('cli/render/outfile-rtl')
      expect(File.read outfile).to match_fixture('hello-rtl.html')
    end
  end
end
