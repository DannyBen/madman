# Octokit sometimes contaminates the terminal with warnings. Make it stop.
# ref: https://github.com/octokit/octokit.rb/blob/main/lib/octokit/warnable.rb
ENV['OCTOKIT_SILENT'] = '1'

require 'commonmarker'
require 'mister_bin'
require 'octokit'
require 'requires'
require 'sinatra/base'
# require 'sinatra/reloader'
require 'slim'
require 'string-direction'
require 'yaml'

requires 'madman'
