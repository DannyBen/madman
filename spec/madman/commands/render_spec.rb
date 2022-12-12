describe 'bin/madman render' do
  subject { Madman::CLI.runner }

  context 'without arguments' do
    it 'shows short usage' do
      expect { subject.run %w[render] }.to output_approval('bin/render/usage')
    end
  end

  context 'with --help' do
    it 'shows long usage' do
      expect { subject.run %w[render --help] }.to output_approval('bin/render/help')
    end
  end

  context 'with input file' do
    let(:infile) { 'spec/fixtures/hello.md' }
    let(:argv) { %W[render #{infile}] }

    it 'prints HTML to stdout' do
      expect { subject.run argv }.to output_approval('bin/render/basic')
    end
  end

  context 'with input file and --save' do
    let(:infile) { 'spec/fixtures/hello.md' }
    let(:outfile) { 'tmp/out.html' }
    let(:argv) { %W[render #{infile} --save #{outfile}] }

    before do
      File.delete outfile if File.exist? outfile
      expect(File).not_to exist outfile
    end

    it 'saves HTML' do
      expect { subject.run argv }.to output_approval('bin/render/save')
      expect(File.read outfile).to match_approval('bin/render/basic')
    end
  end
end
