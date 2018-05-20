module Madman
  class Document
    include Injector

    attr_reader :filename
    attr_accessor :text

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

    def rtl?
      detector.direction(text[0..200]) == 'rtl'
    end

    def save(save_as=nil)
      save_as ||= filename
      raise ArgumentError, "No filename provided" unless save_as
      File.write save_as, text
    end

    private

    def detector
      @detector ||= StringDirection::Detector.new :dominant
    end

    def renderers
      Renderers.available_renderers
    end
  end
end