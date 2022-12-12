describe 'bin/madman readme' do
  subject { Madman::CLI.runner }

  context 'without arguments' do
    it 'shows short usage' do
      expect { subject.run %w[readme] }.to output_approval('bin/readme/usage')
    end
  end

  context 'with --help' do
    it 'shows long usage' do
      expect { subject.run %w[readme --help] }.to output_approval('bin/readme/help')
    end
  end

  context 'with a directory argument' do
    let(:argv) { %w[serve .] }
    let(:target_dir) { 'tmp/readme-spec' }

    before do
      system "rm -rf #{target_dir}" if File.directory? target_dir
      system "cp -R spec/workspace #{target_dir}"
    end

    it 'creates missing README files' do
      expect { subject.run %W[readme #{target_dir}] }.to output_approval('bin/readme/basic')
      expect(File).to exist "#{target_dir}/FolderWithoutReadme/README.md"
    end

    context 'with --dry' do
      it 'does not create missing README files' do
        expect { subject.run %W[readme #{target_dir} --dry] }.to output_approval('bin/readme/dry')
        expect(File).not_to exist "#{target_dir}/FolderWithoutReadme/README.md"
      end
    end
  end
end
