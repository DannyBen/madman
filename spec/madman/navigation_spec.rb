describe Navigation do
  subject { described_class.new 'spec/workspace' }

  describe '#toc' do
    it 'returns an array representation of the table of contents' do
      expect(subject.toc.to_yaml).to match_approval('navigation/toc')
    end

    context 'when depth is limited' do
      subject { described_class.new 'spec/workspace', depth: 2 }

      it 'returns only items up to the limit' do
        expect(subject.toc.to_yaml).to match_approval('navigation/toc-depth-1')
      end
    end
  end

  describe '#markdown' do
    it 'returns a markdown table of contents' do
      expect(subject.markdown).to match_approval('navigation/markdown')
    end
  end
end
