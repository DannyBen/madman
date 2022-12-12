describe Renderers::Default do
  subject { described_class }

  describe '::render' do
    it 'returns HTML' do
      expect(subject.render '# hello world').to match_approval('renderer/default')
    end

    it 'allows arbitrary html' do
      expect(subject.render "# hello\n\n<p style='background: #fff'></p>")
        .to match_approval('renderer/default-htmlcode')
    end
  end
end
