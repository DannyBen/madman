require 'spec_helper'

describe Document do
  subject { described_class::from_file 'spec/fixtures/hello.md', any: 'thing' }

  describe '::from_file' do
    it "returns a new instance" do
      expect(subject).to be_a Document
    end

    it "loads the markdown into the instance" do
      expect(subject.text).to match_fixture('hello.md')
    end

    it "forwards all options to the instance" do
      expect(subject.options[:any]).to eq 'thing'
    end

    it "sets the instance filename" do
      expect(subject.options[:filename]).to eq 'spec/fixtures/hello.md'
    end
  end

  describe '#set' do
    it 'adds and overwrites one or more options' do
      expect(subject.options[:any]).to eq 'thing'      
      subject.set any: 'and all'
      expect(subject.options[:any]).to eq 'and all'
    end
  end

  describe '#render' do
    let(:outfile) { 'tmp/out.html' }
    
    before do
      File.delete outfile if File.exist? outfile
      expect(File).not_to exist outfile
    end

    it "saves HTML to file" do
      subject.render outfile
      expect(File).to exist outfile
      expect(File.read outfile).to match_fixture('hello.html')
    end
  end

  describe '#to_html' do
    it 'returns an HTML document' do
      expect(subject.to_html).to match_fixture('hello.html')
    end
  end
end
