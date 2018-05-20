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
      expect(subject.render).to match_fixture('document/render')
    end
  end

  describe '#rtl' do
    context "for an English document" do
      it "returns false" do
        expect(subject.rtl?).to be false
      end
    end

    context "for a Hebrew document" do
      let(:filename) { 'spec/fixtures/rtl.md' }

      it "returns true" do
        expect(subject.rtl?).to be true
      end
    end
  end
end
