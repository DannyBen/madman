module Madman
  module Renderers
    class Default
      def self.render(text, opts={})
        CommonMarker.render_html text, [:DEFAULT, :UNSAFE], [:table]
      end
    end
  end
end