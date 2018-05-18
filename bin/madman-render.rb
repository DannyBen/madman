require 'madman'

help "Render markdown to HTML"

usage "madman render INFILE [OUTFILE] [--rtl --github]"
usage "madman render (-h|--help|--version)"

option "--github", "Render using the GitHub API\nRequires setting the GITHUB_ACCESS_TOKEN environment variable"
option "--rtl", "Render text Right to Left"

param "INFILE", "The input markdown file"
param "OUTFILE", "The output HTML file\nIf not provided, the input filename will be used with .html extension"

environment "GITHUB_ACCESS_TOKEN", "Your GitHub API access token\nGenerate one here: https://github.com/settings/tokens"

example "madman render README.md"
example "madman render README.md --github"
example "madman render README.md out.html --rtl"

action do |args|
  infile = args['INFILE']
  outfile = args['OUTFILE'] || "#{infile}.html"
  renderer = args['--github'] ? :github : :default


  opts = {
    rtl: args['--rtl'],
    renderer: renderer
  }

  doc = Madman::Document.from_file infile, opts

  say "Rendering using the #{renderer} renderer"
  doc.render outfile
  say "Saved !txtgrn!#{outfile}"
end

