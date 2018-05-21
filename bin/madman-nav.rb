require 'madman'

summary "Add site-wide navigation links to README files"

help "This command will add a table of contents to all README files in the folder. The table of contents will link to all the pages and folders that are in the same folder as each README file."

usage "madman nav FOLDER [--marker TEXT --force --dry --verbose --depth N]"
usage "madman nav (-h|--help|--version)"

option "-f --force", "Add to all README files, even if they do not have a marker"
option "-m --marker TEXT", "Look for an HTML comment with <!-- TEXT --> [default: nav]"
option "-d --depth N", "The depth of the table of contents [default: 1]"
option "--dry", "Do not save the updated files, just show what will happen"
option "-v --verbose", "Show the updated README content"

param "FOLDER", "The folder containing markdown files"

example "madman nav"
example "madman nav path/to/docs --force --marker toc"
example "madman nav path/to/docs --dry -v -d2"

action do |args|
  dir     = args['FOLDER'] || '.'
  force   = args['--force']
  marker  = args['--marker']
  dry     = args['--dry']
  verbose = args['--verbose']
  depth   = args['--depth'].to_i

  candidates = Dir["#{dir}/**/README.md"]
  candidates.each do |candidate|
    say "Updating !txtgrn!#{candidate}"
    candidate_dir = File.dirname candidate
    toc = Madman::Navigation.new candidate_dir, depth: depth
    doc = Madman::Document.from_file candidate
    doc.inject toc.markdown, marker: marker, force: force

    if verbose
      say word_wrap "  !txtblu!#{doc.text}"
      say ""
    end

    doc.save unless dry
  end

  say dry ? "Done (dry mode, nothing changed)" : "Done"
end

