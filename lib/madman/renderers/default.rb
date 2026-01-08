module Madman
  module Renderers
    class Default
      def self.render(text, *)
        Commonmarker.to_html text,
          options: {
            render:    { unsafe: true },
            extension: { table: true },
          },
          plugins: {
            syntax_highlighter: { theme: 'InspiredGitHub' },
          }
      end
    end
  end
end
