require 'madman/server_base'
require 'madman/document'

module Madman
  class PreviewServer < ServerBase
    set :public_folder, -> { File.expand_path(File.dirname(settings.file)) }

    before do
      @doc = Document.from_file settings.file
      @renderer = :default
    end

    get '/' do
      slim :template
    end

    get '/github' do
      @renderer = :github
      slim :template
    end
  end
end
