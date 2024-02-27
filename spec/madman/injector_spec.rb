describe Injector do
  subject do
    Class.new do
      include Injector

      attr_accessor :text

      def initialize(text)
        @text = text
      end
    end.new text
  end

  let(:text) { 'header <!-- mark -->replaceable<!-- mark --> footer' }

  describe '#inject' do
    context 'when the marker is not found in the text' do
      it 'does nothing' do
        subject.inject 'new content', marker: 'no-such-mark'
        expect(subject.text).to eq text
      end

      context 'when force is used' do
        it 'appends the content to the end of the text' do
          subject.inject 'new content', marker: 'no-such-mark', force: true
          expect(subject.text).to match_approval('inkector/appended')
        end
      end
    end

    context 'when the marker is found only once in the text' do
      let(:text) { 'header <!-- mark --> footer' }

      it 'replaces it' do
        subject.inject 'new content', marker: 'mark'
        expect(subject.text).to match_approval('inkector/replaced-once')
      end
    end

    context 'when the marker is found twice in the text' do
      it 'replaces the markers and the content between them' do
        subject.inject 'new content', marker: 'mark'
        expect(subject.text).to match_approval('inkector/replaced')
      end
    end
  end
end
