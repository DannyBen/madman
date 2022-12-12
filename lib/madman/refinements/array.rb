module ArrayRefinements
  refine Array do
    def to_markdown
      map { |item| "- #{item}" }.join "\n"
    end

    def to_html
      CommonMarker.render_html to_markdown, :DEFAULT, [:table]
    end
  end
end
