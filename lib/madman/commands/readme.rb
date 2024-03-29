module Madman
  module Commands
    class Readme < MisterBin::Command
      include Colsole

      summary 'Create README in all qualified sub directories'

      help 'This command generates README.md files in all subdirectories. Each file will receive ' \
        'an H1 caption with the name of the folder it resides in. This command is designed to ' \
        'assist in preparing a folder for table of contents injection.'

      usage 'madman readme DIR [--dry]'
      usage 'madman readme (-h|--help)'

      option '-y --dry', "Only show what will be created, don't make any changes"

      param 'DIR', 'The directory containing markdown files'

      example 'madman readme .'
      example 'madman readme path/to/docs --dry'

      def run
        basedir = Madman::Directory.new args['DIR']

        dirs = basedir.deep_list.select(&:dir?).map(&:path)
        dirs.each do |dir|
          file = "#{dir}/README.md"

          if File.exist? file
            say "Skipping #{file}"
          else
            say "Creating g`#{file}`"
            h1 = "# #{File.basename dir}\n\n"
            File.write file, h1 unless args['--dry']
          end
        end

        say args['--dry'] ? 'Done (dry mode, no changes were made)' : 'Done'
      end
    end
  end
end
