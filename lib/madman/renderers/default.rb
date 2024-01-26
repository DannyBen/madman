module Madman
  module Renderers
    class Default
      def self.render(text, _opts = {})
        Commonmarker.to_html text, options: {
          render:    { unsafe: true },
          extension: { table: true },
        }
      end
    end
  end
end
