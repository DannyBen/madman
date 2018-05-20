require 'madman'

summary "Serve a markdown folder using a local server"

usage "madman serve [FOLDER] [--port N --bind ADDRESS --github]"
usage "madman serve (-h|--help|--version)"

option "--github", "Use the GitHub API renderer instead of the default one"
option "-p --port N", "Set server port [default: 3000]"
option "-b --bind ADDRESS", "Set server listen address [default: 0.0.0.0]"

param "FOLDER", "The folder containing markdown files. If not provided, the current directory will be used"

environment "GITHUB_ACCESS_TOKEN", "Your GitHub API access token\nRequired only if you wish to use the '/github' endpoint\nGenerate one here: https://github.com/settings/tokens"

example "madman serve"
example "madman serve path/to/docs -p4000 --github"

action do |args|
  dir = args['FOLDER'] || '.'
  port = args['--port']
  bind = args['--bind']
  renderer = args['--github'] ? :github : :default

  say "Starting server at !undblu!localhost:#{port}!txtrst! using the !txtgrn!#{renderer}!txtrst! renderer\n"

  Madman::Server.set bind: bind, port: port, dir: dir, renderer: renderer
  Madman::Server.run!
end

