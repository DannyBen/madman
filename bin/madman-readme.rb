require 'madman'
require 'lp'

summary "Create README.md in all qualified sub directories, and insert H1 with the name of the directory"

usage "madman readme DIR [--dry]"
usage "madman readme (-h|--help)"

option "-y --dry", "Only show what will be created, don't make any changes"

param "DIR", "The directory containing markdown files"

example "madman readme ."
example "madman readme path/to/docs --dry"

action do |args|
  dir = args['DIR']
  basedir = Madman::Directory.new dir, dir

  dirs = basedir.deep_list.select { |i| i.dir? }.map { |i| i.path }
  dirs.each do |dir|
    file = "#{dir}/README.md"
    
    if File.exist? file
      say "Skipping #{file}"
    else
      say "Creating !txtgrn!#{file}"
      h1 = "# #{File.basename dir}\n\n"
      File.write file, h1 unless args['--dry']
    end
  end

  say args['--dry'] ? "Done (dry mode, no changes were made)" : "Done"
end

