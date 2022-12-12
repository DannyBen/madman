module Madman
  module Renderers
    class Default
      def self.render(text, _opts = {})
        CommonMarker.render_html text, %i[DEFAULT UNSAFE], [:table]
      end
    end
  end
end
