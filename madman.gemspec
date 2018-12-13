lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'date'
require 'madman/version'

Gem::Specification.new do |s|
  s.name        = 'madman'
  s.version     = Madman::VERSION
  s.date        = Date.today.to_s
  s.summary     = "The Markdown Swiss Army Knife"
  s.description = "A command line utility for markdown fun"
  s.authors     = ["Danny Ben Shitrit"]
  s.email       = 'db@dannyben.com'
  s.files       = Dir['README.md', 'lib/**/*.*']
  s.executables = ['madman']
  s.homepage    = 'https://github.com/dannyben/madman'
  s.license     = 'MIT'
  s.required_ruby_version = ">= 2.4.0"

  # we are locking sinatra to 2.0.3 due to this issue:
  # https://github.com/sinatra/sinatra/issues/1476
  s.add_runtime_dependency 'sinatra', '2.0.3'
  s.add_runtime_dependency 'requires', '~> 0.1'
  s.add_runtime_dependency 'commonmarker', '~> 0.17'
  s.add_runtime_dependency 'mister_bin', '~> 0.6'
  s.add_runtime_dependency 'puma', '~> 3.11'
  s.add_runtime_dependency 'sinatra-contrib', '~> 2.0'
  s.add_runtime_dependency 'slim', '~> 4.0'
  s.add_runtime_dependency 'colsole', '~> 0.5'
  s.add_runtime_dependency 'string-direction', '~> 1.2'
  s.add_runtime_dependency 'octokit', '~> 4.9'
  s.add_runtime_dependency 'sass', "~> 3.6"
  s.add_runtime_dependency 'coffee-script', '~> 2.4'
end
