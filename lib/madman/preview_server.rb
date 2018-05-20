module Madman
  class PreviewServer < ServerBase
    set :public_folder, -> { File.expand_path(File.dirname(settings.file)) }

    get '/' do
      slim :template
    end

    get '/github' do
      @renderer = :github
      slim :template
    end

    def renderer
      @renderer ||= :default
    end

    def doc
      Madman::Document.from_file settings.file
    end
  end
end