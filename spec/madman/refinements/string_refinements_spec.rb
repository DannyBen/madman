describe StringRefinements do
  using described_class

  describe '#slug' do
    it 'converts a string to a slug' do
      expect('Hello World'.slug).to eq 'hello-world'
    end
  end

  describe '#to_html' do
    it 'converts a string to a slug' do
      expect('**Hello World**'.to_html).to eq "<p><strong>Hello World</strong></p>\n"
    end
  end
end
