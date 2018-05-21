require 'spec_helper'

describe Item do
  subject { described_class.new 'Root/Folder/Subfolder', :dir, 'Root' }

  describe '#label' do
    it "returns the basename" do
      expect(subject.label).to eq "Subfolder"
    end
  end

  describe '#href' do
    it "returns link path relative to base path" do
      expect(subject.href).to eq "Folder/Subfolder"
    end
  end

  describe '#dir?' do
    context "when type is dir" do
      it "returns true" do
        expect(subject.dir?).to be true
      end
    end

    context "when type is file" do
      subject { described_class.new 'Root/File.md', :file, 'Root' }

      it "returns false" do
        expect(subject.dir?).to be false
      end
    end
  end

  describe '#file?' do
    context "when type is dir" do
      it "returns false" do
        expect(subject.file?).to be false
      end
    end

    context "when type is file" do
      subject { described_class.new 'Root/File.md', :file, 'Root' }

      it "returns false" do
        expect(subject.file?).to be true
      end
    end
  end
end