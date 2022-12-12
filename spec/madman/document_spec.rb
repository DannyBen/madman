describe Document do
  subject { described_class.from_file filename }

  let(:filename) { 'spec/fixtures/hello.md' }

  describe '::from_file' do
    it 'returns a new instance' do
      expect(subject).to be_a described_class
    end

    it 'loads the markdown into the instance' do
      expect(subject.text).to match_approval('hello.md')
    end

    it 'sets the instance filename' do
      expect(subject.filename).to eq filename
    end

    context 'with a yaml file' do
      let(:filename) { 'spec/fixtures/hello.yml' }

      it 'loads the YAML hash into the instance text' do
        expect(subject.text).to be_a Hash
        expect(subject.text).to have_key 'Caption'
      end
    end
  end

  describe '#render' do
    it 'returns HTML' do
      expect(subject.render).to match_approval('document/render')
    end

    context 'with a YAML file' do
      let(:filename) { 'spec/fixtures/hello.yml' }

      it 'also returns HTML' do
        expect(subject.render).to match_approval('document/render_yaml')
      end
    end
  end

  describe '#rtl' do
    context 'with an English document' do
      it 'returns false' do
        expect(subject.rtl?).to be false
      end
    end

    context 'with a Hebrew document' do
      let(:filename) { 'spec/fixtures/rtl.md' }

      it 'returns true' do
        expect(subject.rtl?).to be true
      end
    end
  end

  describe '#save' do
    subject { described_class.from_file subject_file }

    let(:subject_file) { 'tmp/save_target.md' }

    before do
      system "cp spec/fixtures/hello.md #{subject_file}"
    end

    context 'without arguments' do
      context 'when filename is known' do
        it 'saves the file' do
          subject.text = 'new text'
          subject.save
          expect(File.read subject_file).to eq 'new text'
        end
      end

      context 'when filename is unknown' do
        subject { described_class.new '# some markdown without filename' }

        it 'raises ArgumentError' do
          expect { subject.save }.to raise_error(ArgumentError, 'No filename provided')
        end
      end
    end

    context 'with a save_as argument' do
      let(:target_file) { 'tmp/save_as_target.md' }

      before do
        system "rm #{target_file}" if File.exist? target_file
      end

      it 'saves' do
        subject.save target_file
        expect(File.read target_file).to eq File.read subject_file
      end
    end
  end
end
