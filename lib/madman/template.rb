module Madman
  class Template
    attr_reader :file, :options, :content

    def initialize(file, options=nil)
      @file = file.is_a?(Symbol) ? presets[file] : file
      @options = options || {}
    end

    def render(content)
      @content = content
      template % replacements
    end

    private

    def replacements
      result = {
        content: content,
        inline_css: css,
        body_attributes: ''
      }
      result[:body_attributes] = "dir='rtl'" if options[:rtl]
      result
    end

    def template
      @template ||= File.read file
    end

    def css
      @css ||= File.read css_file
    end

    def presets
      {
        default: File.expand_path('../templates/template.html', __dir__)
      }
    end

    def css_file 
      @css_file ||= File.expand_path('../templates/css.css', __dir__)
    end
  end
end