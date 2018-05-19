module Madman
  class Document
    attr_reader :text, :filename

    def self.from_file(file)
      new File.read(file), file
    end

    def initialize(text, filename=nil)
      @text = text
      @filename = filename
    end

    def render(renderer=:default)
      renderers[renderer].render text
    end

    private

    def renderers
      Renderers.available_renderers
    end
  end
end