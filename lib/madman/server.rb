module Madman
  class Server < Sinatra::Base
    @@options = {}

    def self.options(opts)
      @@options = opts
      set :bind, @@options[:bind]
      set :port, @@options[:port]
      set :public_folder, File.expand_path(File.dirname(@@options[:file]))
    end

    def doc
      doc_options = {
        rtl: @@options[:rtl],
        renderer: (@@options[:renderer] || :default)
      }
      Madman::Document.from_file @@options[:file], doc_options
    end

    get '/' do
      doc.to_html
    end
  end
end