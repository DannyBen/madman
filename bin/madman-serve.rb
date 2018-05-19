require 'madman'

help "Run a webserver and serve the markdown file as HTML"

usage "madman serve INFILE [--port N --bind ADDRESS --rtl --github]"
usage "madman serve (-h|--help|--version)"

option "--github", "Render using the GitHub API\nRequires setting the GITHUB_ACCESS_TOKEN environment variable"
option "--rtl", "Render text Right to Left."
option "-p --port N", "Set server port [default: 3000]"
option "-b --bind ADDRESS", "Set server listen address [default: 0.0.0.0]"

param "INFILE", "The input markdown file"

environment "GITHUB_ACCESS_TOKEN", "Your GitHub API access token\nGenerate one here: https://github.com/settings/tokens"

example "madman serve README.md"
example "madman serve README.md --github"
example "madman serve README.md -p4000 --rtl"

action do |args|
  opts = { 
    file: args['INFILE'], 
    port: args['--port'], 
    bind: args['--bind'],
    rtl:  args['--rtl']
  }

  opts[:renderer] = :github if args['--github'] 

  Madman::Server.options opts
  Madman::Server.run!
end

