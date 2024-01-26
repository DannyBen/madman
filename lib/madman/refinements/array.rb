module ArrayRefinements
  refine Array do
    def to_markdown
      map { |item| "- #{item}" }.join "\n"
    end

    def to_html
      Commonmarker.to_html to_markdown, options: { extension: { table: true } }
    end
  end
end
