require 'madman/server_base'

module Madman
  class DirServer < ServerBase
    set :public_folder, -> { File.expand_path(settings.dir) }

    before do
      @renderer = settings.respond_to?(:renderer) ? settings.renderer : :default
    end

    not_found do
      content_type :text
      "4O4 Not Found"
    end

    get '/favicon.ico' do
      content_type :text
      '(oOo)'
    end
    
    get '/*' do
      path = params[:splat].first

      type, file = find_file(path)
      redirect "#{path}/" if type == :dir and path[-1] != '/'

      if File.exist? file
        @doc = Document.from_file file
        slim :template
      else
        halt 404
      end
    end

  private

    def find_file(path)
      type = :file
      file = File.expand_path path, settings.dir

      if File.directory? file
        type = path.empty? ? :root : :dir
        file ="#{file}/README.md"
      else
        file ="#{file}.md"
      end

      [type, file]
    end

  end
end