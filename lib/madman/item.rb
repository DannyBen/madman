require 'addressable'

module Madman
  class Item
    attr_reader :path, :type, :basedir

    def initialize(path, type, basedir)
      @path = path
      @type = type
      @basedir = basedir
    end

    def label
      @label ||= File.basename(path_without_extension)
    end

    def href
      Addressable::URI.escape(path_without_extension.sub(%r{^#{basedir}/}, ''))
    end

    def dir?
      type == :dir
    end

    def file?
      type == :file
    end

  private

    def path_without_extension
      @path_without_extension ||= path.sub(/\.md$/, '')
    end
  end
end
