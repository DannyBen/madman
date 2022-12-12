describe 'bin/madman nav' do
  subject { Madman::CLI.runner }

  context 'without arguments' do
    it 'shows short usage' do
      expect { subject.run %w[nav] }.to output_approval('bin/nav/usage')
    end
  end

  context 'with --help' do
    it 'shows long usage' do
      expect { subject.run %w[nav --help] }.to output_approval('bin/nav/help')
    end
  end
end
