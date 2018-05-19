require 'spec_helper'

describe Document do
  let(:filename) { 'spec/fixtures/hello.md' }
  subject { described_class::from_file filename }

  describe '::from_file' do
    it "returns a new instance" do
      expect(subject).to be_a Document
    end

    it "loads the markdown into the instance" do
      expect(subject.text).to match_fixture('hello.md')
    end

    it "sets the instance filename" do
      expect(subject.filename).to eq filename
    end
  end

  describe '#render' do
    it 'returns HTML' do
      expect(subject.render).to match_fixture('document/hello.html')
    end
  end
end
