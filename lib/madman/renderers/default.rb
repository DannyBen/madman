module Madman
  module Renderers
    class Default
      def self.render(text, opts={})
        CommonMarker.render_html text, :DEFAULT, [:table]
      end
    end
  end
end