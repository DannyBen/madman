require 'madman'
require 'madman/version'

version Madman::VERSION

help "Run a webserver and serve the markdown file as HTML"

usage "madman serve INFILE [--port N --bind ADDRESS --rtl]"
usage "madman serve (-h|--help|--version)"

option "   --rtl", "Render text Right-to-Left"
option "-p --port N", "Set server port [default: 3000]"
option "-b --bind ADDRESS", "Set server listen address [default: 0.0.0.0]"

param "INFILE", "The input markdown file"

example "madman serve README.md"
example "madman serve README.md -p4000 --rtl"

action do |args|
  opts = { 
    file: args['INFILE'], 
    port: args['--port'], 
    bind: args['--bind'],
    rtl:  args['--rtl']
  }

  Madman::Server.options opts
  Madman::Server.run!
end

