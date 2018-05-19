module Madman
  class Server < Sinatra::Base
    @@options = {}

    def self.options(opts)
      @@options = opts
      set :bind, @@options[:bind]
      set :port, @@options[:port]
      set :public_folder, File.expand_path(File.dirname(@@options[:file]))
    end

    get '/' do
      template.render doc.render
    end

    get '/github' do
      template.render doc.render(:github)
    end

    private

    def doc
      Madman::Document.from_file @@options[:file]
    end

    def template
      Madman::Template.new :default, rtl: @@options[:rtl]
    end
  end
end