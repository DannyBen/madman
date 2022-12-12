describe 'bin/madman preview' do
  subject { Madman::CLI.runner }

  context 'without arguments' do
    it 'shows short usage' do
      expect { subject.run %w[preview] }.to output_approval('bin/preview/usage')
    end
  end

  context 'with --help' do
    it 'shows long usage' do
      expect { subject.run %w[preview --help] }.to output_approval('bin/preview/help')
    end
  end

  context 'with required arguments' do
    let(:infile) { 'spec/fixtures/hello.md' }
    let(:argv) { %W[preview #{infile}] }

    it 'calls the server' do
      expect(PreviewServer).to receive(:run!)
      expect { subject.run argv }.to output(/Starting server/).to_stdout
    end
  end
end
