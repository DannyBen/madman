module Madman
  # Represents a directory with markdown file sand subflders.
  class Directory
    attr_reader :dir, :basedir

    def initialize(dir, basedir=nil)
      @dir = dir
      @basedir = basedir || dir
    end
    
    def list
      @list ||= (dirs + files)
    end

    private

    def files
      result = Dir["#{dir}/*.md"]
      result.reject! { |f| File.basename(f) == 'README.md' }
      result.sort.map { |path| Item.new path, :file, basedir }
    end

    def dirs
      result = Dir["#{dir}/*"].select { |f| File.directory? f }
      result.reject! do |f| 
        basename = File.basename(f)
        basename =~ /^[a-z_\-0-9]+$/
      end
      result.sort.map { |path| Item.new path, :dir, basedir }
    end
  end
end
