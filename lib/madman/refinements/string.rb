module StringRefinements
  refine String do
    def slug
      downcase.strip.tr(' ', '-').gsub(/[^\w-]/, '')
    end

    def to_html
      CommonMarker.render_html self, :DEFAULT, [:table]
    end
  end
end
