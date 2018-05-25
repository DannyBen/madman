require 'spec_helper'

describe Directory do
  subject { described_class.new 'spec/workspace/Folder' }

  describe '#list' do
    it "returns an array of Items" do
      expect(subject.list).to be_an Array
      expect(subject.list.count).to eq 2
      expect(subject.list.first).to be_an Item
    end
  end

  describe '#deep_list' do
    it "returns an array of Items including recursive folders" do
      expect(subject.deep_list).to be_an Array
      expect(subject.deep_list.count).to eq 3
      expect(subject.deep_list.first).to be_an Item
    end
  end
end