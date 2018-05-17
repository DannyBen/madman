require 'madman'
require 'madman/version'

version Madman::VERSION
help "Render markdown to HTML"

usage "madman render INFILE [OUTFILE] [--rtl]"

option "--rtl", "Render text Right-to-Left"

param "INFILE", "The input markdown file"
param "OUTFILE", "The output HTML file. If not provided, the input filename will be used with .html extension"

example "madman render README.md"
example "madman render README.md out.html --rtl"

action do |args|
  infile = args['INFILE']
  outfile = args['OUTFILE'] || "#{infile}.html"
  doc = Madman::Document.from_file infile, rtl: args['--rtl']
  doc.render outfile
  say "Saved !txtgrn!#{outfile}"
end

