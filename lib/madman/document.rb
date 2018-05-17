module Madman
  class Document
    attr_reader :text, :opts

    def self.from_file(file, opts={})
      new File.read(file), opts.merge({ filename: file })
    end

    def initialize(text, opts)
      @text, @opts = text, opts
    end

    def render(outfile)
      File.write outfile, to_html
    end

    def to_html
      html = template
      content = CommonMarker.render_html text, :DEFAULT, [:table]
      
      replacements = {
        content: content,
        inline_css: css,
        body_attributes: ''
      }
      replacements[:body_attributes] = "dir='rtl'" if opts[:rtl]

      html %= replacements
    end

    private

    def template
      @template ||= File.read template_file
    end

    def css
      @css ||= File.read css_file
    end

    def template_file
      @template_file ||= File.expand_path('../templates/template.html', __dir__)
    end

    def css_file
      @css_file ||= File.expand_path('../templates/css.css', __dir__)
    end
  end
end