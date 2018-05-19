require 'madman'

summary "Run a webserver and serve the markdown file as HTML"

help "This command will start a local server with two endpoints:\n  /         will render the markdown with the default renderer\n  /github   will render with the GitHub API"

usage "madman serve INFILE [--port N --bind ADDRESS --rtl]"
usage "madman serve (-h|--help|--version)"

option "--rtl", "Render text Right to Left."
option "-p --port N", "Set server port [default: 3000]"
option "-b --bind ADDRESS", "Set server listen address [default: 0.0.0.0]"

param "INFILE", "The input markdown file"

environment "GITHUB_ACCESS_TOKEN", "Your GitHub API access token\nRequired only if you wish to use the '/github' endpoint\nGenerate one here: https://github.com/settings/tokens"

example "madman serve README.md"
example "madman serve README.md -p4000 --rtl"

action do |args|
  opts = { 
    file: args['INFILE'], 
    port: args['--port'], 
    bind: args['--bind'],
    rtl:  args['--rtl']
  }

  say "Starting server at !undblu!localhost:#{opts[:port]}!txtrst!"
  if ENV['GITHUB_ACCESS_TOKEN']
    say "To view the GitHub API version go to !undblu!localhost:#{opts[:port]}/github!txtrst!"
  end
  say ''

  Madman::Server.options opts
  Madman::Server.run!
end

