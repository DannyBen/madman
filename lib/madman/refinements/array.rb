module ArrayRefinements
  refine Array do
    def to_markdown
      map { |item| "- #{item}" }.join "\n"
    end

    def to_html
      Renderers::Default.render to_markdown
    end
  end
end
