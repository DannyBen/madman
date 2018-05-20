require 'commonmarker'
require 'octokit'
require 'sinatra/base'
require 'sinatra/reloader'
require 'slim'
require 'string-direction'

require 'madman/docdir'
require 'madman/document'
require 'madman/renderers'

require 'madman/server_base'
require 'madman/preview_server'
require 'madman/server'


require 'byebug' if ENV['BYEBUG']