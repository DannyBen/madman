describe 'bin/madman serve' do
  subject { Madman::CLI.runner }

  context 'without arguments' do
    it 'shows short usage' do
      expect { subject.run %w[serve] }.to output_approval('bin/serve/usage')
    end
  end

  context 'with --help' do
    it 'shows long usage' do
      expect { subject.run %w[serve --help] }.to output_approval('bin/serve/help')
    end
  end

  context 'with required arguments' do
    let(:infile) { 'spec/fixtures/hello.md' }
    let(:argv) { %w[serve .] }

    it 'calls the server' do
      expect(DirServer).to receive(:run!)
      expect { subject.run argv }.to output(/Starting server/).to_stdout
    end
  end
end
