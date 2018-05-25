require 'madman'
require 'io/console'

summary "Add site-wide navigation links to README files"

help "This command generates a Table of Contents for a directory, and injects it to a file. In addition, it supports recursive execution, which will add a Table of Contents to all README files (or a filename of your choice) in all the subfolders, creating nagigation pages for an entire Markdown site."

usage "madman nav DIR [options]"
usage "madman nav (-h|--help)"

option "-f --force", "Inject TOC to all README files, even if they do not have a marker"
option "-m --marker TEXT", "Look for an HTML comment with <!-- TEXT --> [default: nav]"
option "-d --depth N", "The depth of the table of contents [default: 1]"
option "-v --verbose", "Show the updated README content"
option "-t --target NAME", "Set the target filename to look for. [default: README.md]"
option "-r --recursive", "Inject to all target files"
option "-y --dry", "Do not save the updated files, just show what will happen"

param "DIR", "The directory containing markdown files"

example "madman nav"
example "madman nav path/to/docs --force --marker toc"
example "madman nav path/to/docs --dry -v -d2"

action do |args|
  @args = args

  if recursive?
    Dir["#{dir}/**/#{target}"].each { |file| update_file file }
  else
    update_file "#{dir}/#{target}"
  end

  say dry? ? "Done (dry mode, no changes were made)" : "Done"
end

def update_file(file)
  say "Updating !txtgrn!#{file}"
  file_dir = File.dirname file
  toc = Madman::Navigation.new file_dir, depth: depth
  doc = Madman::Document.from_file file
  doc.inject toc.markdown, marker: marker, force: force?

  if verbose?
    say word_wrap "  !txtblu!#{doc.text}"
    say ""
  end

  doc.save unless dry?
end

# CLI Arguments

def args;         @args; end
def dir;          args['DIR'] || '.'; end
def depth;        args['--depth'].to_i; end
def marker;       args['--marker']; end
def target;       args['--target']; end
def force?;       args['--force']; end
def dry?;         args['--dry']; end
def verbose?;     args['--verbose']; end
def recursive?;   args['--recursive']; end
