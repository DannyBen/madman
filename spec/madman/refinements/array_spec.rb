require 'spec_helper'

describe ArrayRefinements do
  using ArrayRefinements

  subject { %w[Hello World] }

  describe '#to_markdown' do
    it "returns a markdown string" do
      expect(subject.to_markdown).to eq "- Hello\n- World"
    end    
  end

  describe '#to_html' do
    it "returns an HTML string" do
      expect(subject.to_html).to eq "<ul>\n<li>Hello</li>\n<li>World</li>\n</ul>\n"
    end    
  end
end