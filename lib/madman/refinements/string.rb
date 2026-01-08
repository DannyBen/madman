module StringRefinements
  refine String do
    def slug
      downcase.strip.tr(' ', '-').gsub(/[^\w-]/, '')
    end

    def to_html
      Renderers::Default.render self
    end
  end
end
