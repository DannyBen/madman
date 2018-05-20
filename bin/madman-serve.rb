require 'madman'

summary "Serve a markdown folder using a local server"

usage "madman serve FOLDER [--port N --bind ADDRESS]"
usage "madman serve (-h|--help|--version)"

option "-p --port N", "Set server port [default: 3000]"
option "-b --bind ADDRESS", "Set server listen address [default: 0.0.0.0]"

param "FOLDER", "The folder containing markdown files"

environment "GITHUB_ACCESS_TOKEN", "Your GitHub API access token\nRequired only if you wish to use the '/github' endpoint\nGenerate one here: https://github.com/settings/tokens"

example "madman serve README.md"
example "madman serve README.md -p4000"

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

