require 'commonmarker'
require 'octokit'
require 'sinatra/base'
require 'sinatra/reloader'
require 'slim'
require 'string-direction'

require 'madman/cli'
require 'madman/injector'

require 'madman/directory'
require 'madman/document'
require 'madman/item'
require 'madman/renderers'
require 'madman/navigation'

require 'madman/server_base'
require 'madman/preview_server'
require 'madman/dir_server'


require 'byebug' if ENV['BYEBUG']