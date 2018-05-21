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
end