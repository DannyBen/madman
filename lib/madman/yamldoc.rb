require 'madman/refinements/string'

module Madman
  class YAMLDoc
    using StringRefinements

    attr_reader :yaml, :title

    def initialize(yaml, title: nil)
      @yaml = yaml
      @title = title
    end

    def render
      slim.render self
    end

    def template
      File.expand_path '../views/yamldoc.slim', __dir__
    end

    def slim
      @slim ||= Slim::Template.new template, slim_options
    end

    def slim_options
      { pretty: true, disable_escape: true }
    end

    def tree
      @tree ||= tree!
    end

  private

    def counter
      @counter ||= 0
      @counter += 1
    end

    def tree!(data=nil, indent=0, caption=2)
      data ||= yaml
      result = []
      caption = 6 if caption > 6

      data.each do |key, value|
        result.push render_pair key, value, indent, caption
      end

      result.join "\n"
    end

    def render_pair(key, value, indent, caption)
      slug = "#{key.slug}-#{counter}"
      space = '  '
      result = []

      if key[0] == '_'
        result.push "#{space * indent}<div>"
      else
        result.push "#{space * indent}<h#{caption}><a href='##{slug}' class='clickable'>#{key}</a></h#{caption}>"
        result.push "#{space * indent}<div class='hidden' id='#{slug}'>"
      end

      if value.is_a? Hash
        result.push tree!(value, indent+1, caption+1)
      elsif value
        result.push "#{space * (indent+1)}#{value.to_html}"
      end

      result.push "#{space * indent}</div>"
      result
    end

  end
end
