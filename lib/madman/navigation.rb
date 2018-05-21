module Madman
  # Generate a markdown Table of Contents
  class Navigation
    attr_reader :dir, :depth

    def initialize(dir='.', depth: 10)
      @dir, @depth = dir, depth
    end

    def toc
      @toc ||= toc!
    end

    def markdown
      @markdown ||= markdown!
    end

    private

    def markdown!
      result = []
      toc.each do |item|
        indent = item[:level] * 4
        result.push "#{' ' * indent}1. [#{item[:item].label}](#{item[:item].href})"
      end
      result.join "\n"
    end

    def toc!(path=dir, level=0)
      return [] unless level < depth
      list = Directory.new(path, dir).list

      result = []
      list.each do |item|
        if item.type == :dir
          result.push level: level, item: item
          result += toc! item.path, level+1
        elsif item.type == :file
          result.push level: level, item: item
        end
      end
      result
    end
  end
end
