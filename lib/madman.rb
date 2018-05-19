require 'commonmarker'
require 'octokit'
require 'sinatra/base'

require 'madman/document'
require 'madman/renderers'
require 'madman/server'
require 'madman/template'

require 'byebug' if ENV['BYEBUG']