module Madman
  module Injector
    def inject(content, marker:, force: false)
      marker = "<!-- #{marker} -->"
      found_markers = text.scan(marker).size

      content = [marker, content, marker].join "\n"

      if found_markers == 0 and force
        self.text += "\n\n#{content}"
      elsif found_markers == 1
        text.gsub! /#{marker}/im, content
      elsif found_markers == 2
        text.gsub! /#{marker}.*#{marker}/im, content
      end
    end
  end
end