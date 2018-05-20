module Madman
  class Server < ServerBase
    set :public_folder, -> { File.expand_path(settings.dir) }

    before do
      @renderer = settings.renderer
    end

    get '/*' do
      path = params[:splat].first

      file = File.expand_path path, settings.dir

      if File.directory? file
        redirect "#{path}/" if !path.empty? and path[-1] != '/'
        file ="#{file}/README.md"
      else
        file ="#{file}.md"
      end      

      @doc = Document.from_file file
      slim :template
    end
  end
end