require 'simplecov'
SimpleCov.start

require 'rubygems'
require 'bundler'
Bundler.require :default, :development

# TODO: Why is this needed here? We expect it to be loaded with bundler above
require 'mister_bin'

# Sinatra testing with Rack::Test
require 'rack/test'
ENV['RACK_ENV'] = 'test'

# That's us!
include Madman

# Helpers
require_relative 'rspec_mixin'

RSpec.configure do |c|
  c.include RSpecMixin
  c.include RSpecHtmlMatchers
  c.include Rack::Test::Methods

  def app; described_class; end

  c.before(:suite) { Dir.mkdir 'tmp' unless Dir.exist? 'tmp' }
end
