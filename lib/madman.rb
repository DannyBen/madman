require 'commonmarker'
require 'octokit'
require 'sinatra/base'

require 'madman/document'
require 'madman/server'
require 'madman/renderers'

require 'byebug' if ENV['BYEBUG']