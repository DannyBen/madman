module StringRefinements
  refine String do
    def slug
      downcase.strip.tr(' ', '-').gsub(/[^\w-]/, '')
    end

    def to_html
      Commonmarker.to_html self, options: { extension: { table: true } }
    end
  end
end
