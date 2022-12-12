require 'madman/injector'
require 'madman/renderers'

module Madman
  class Document
    include Injector

    attr_reader :filename
    attr_accessor :text, :yaml_mode

    def self.from_file(file)
      if File.extname(file) == '.yml'
        result = new YAML.unsafe_load_file(file), file
        result.yaml_mode = true
        result
      else
        new File.read(file), file
      end
    end

    def initialize(text, filename = nil)
      @text = text
      @filename = filename
    end

    def render(renderer = :default)
      if yaml_mode
        renderers[:yaml].render text, title: File.basename(filename, '.yml')
      else
        renderers[renderer].render text
      end
    end

    def rtl?
      detector.direction(text[0..200]) == 'rtl'
    end

    def save(save_as = nil)
      save_as ||= filename
      raise ArgumentError, 'No filename provided' unless save_as

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
