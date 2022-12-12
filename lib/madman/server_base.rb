module Madman
  class ServerBase < Sinatra::Base
    set :views, File.expand_path('../views', __dir__)

    Slim::Engine.set_options pretty: true

    # Reloader temporarily removed due to
    # https://github.com/sinatra/sinatra/issues/1587
    #
    # configure :development do
    #   register Sinatra::Reloader
    #   also_reload "#{__dir__}/*.rb"
    # end

    get '/favicon.ico' do
      ''
    end
  end
end
