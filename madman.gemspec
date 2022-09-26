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
  s.required_ruby_version = ">= 2.7.0"

  s.add_runtime_dependency 'addressable', '~> 2.7'
  s.add_runtime_dependency 'coffee-script', '~> 2.4'
  s.add_runtime_dependency 'colsole', '~> 0.5'
  s.add_runtime_dependency 'commonmarker', '~> 0.23', '>= 0.23.4'
  s.add_runtime_dependency 'mister_bin', '~> 0.6'
  s.add_runtime_dependency 'octokit', '~> 5.2'
  s.add_runtime_dependency 'puma', '~> 5.1'
  s.add_runtime_dependency 'requires', '~> 0.1'
  s.add_runtime_dependency 'sassc', '~> 2.4'
  s.add_runtime_dependency 'sinatra', '~> 3.0'
  s.add_runtime_dependency 'slim', '~> 4.0'
  s.add_runtime_dependency 'string-direction', '~> 1.2'
end
