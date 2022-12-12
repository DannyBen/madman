module Madman
  module Renderers
    class YAML
      def self.render(yaml, opts = {})
        doc = YAMLDoc.new yaml, title: opts[:title]
        doc.render
      end
    end
  end
end
