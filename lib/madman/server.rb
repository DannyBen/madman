module Madman
  class Server < Sinatra::Base
    @@options = {}

    def self.options(opts)
      @@options = opts
      set :bind, @@options[:bind]
      set :port, @@options[:port]
    end

    def doc
      Madman::Document.from_file @@options[:file], rtl: @@options[:rtl]
    end

    get '/' do
      doc.to_html
    end
  end
end