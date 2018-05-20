module Madman
  class Docdir
    attr_reader :dir

    def initialize(dir='.')
      @dir = dir
    end

    # Returns all markdown file paths, recursively
    def all
      Dir.chdir(dir) { Dir["**/*.md"] }
    end

    # Returns only subdirs that has markdown files + markdown files in the
    # base dir
    def index
      all.map { |item| item.split('/').first }.uniq.sort
    end

    def index_markdown
      index.map { |item| "- [#{item}](#{item})" }.join("\n")
    end

  end
end