module Madman
  class ServerBase < Sinatra::Base
    set :views, File.expand_path('../views', __dir__)
    
    Slim::Engine.set_options pretty: true
    
    configure :development do
      register Sinatra::Reloader
      also_reload "#{__dir__}/*.rb"
    end
  end
end