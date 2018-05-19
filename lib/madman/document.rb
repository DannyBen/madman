module Madman
  class Document
    attr_reader :text, :options

    def self.from_file(file, opts=nil)
      opts ||= {}
      new File.read(file), opts.merge({ filename: file })
    end

    def initialize(text, options=nil)
      @text = text
      options ||= {}
      @options = default_options.merge options
    end

    def set(new_opts)
      @options = options.merge new_opts
    end

    def render(outfile)
      File.write outfile, to_html
    end

    def to_html
      html = template
      content = renderer.render text
      
      replacements = {
        content: content,
        inline_css: css,
        body_attributes: ''
      }
      replacements[:body_attributes] = "dir='rtl'" if options[:rtl]

      html %= replacements
    end

    private

    def renderer
      Renderers.available_renderers[options[:renderer]]
    end

    def default_options
      { renderer: :default }
    end

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