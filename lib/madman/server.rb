module Madman
  class Server < Sinatra::Base
    @@options = {}

    def self.options(opts)
      @@options = opts
      set :bind, @@options[:bind]
      set :port, @@options[:port]
      set :public_folder, File.expand_path(File.dirname(@@options[:file]))
    end

    def doc(doc_options={})
      Madman::Document.from_file @@options[:file], doc_options
    end

    get '/' do
      doc(rtl: @@options[:rtl]).to_html
    end

    get '/github' do
      doc(rtl: @@options[:rtl], renderer: :github).to_html
    end
  end
end