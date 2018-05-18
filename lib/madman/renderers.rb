require 'madman/renderers/default'
require 'madman/renderers/github'

module Madman
  module Renderers
    def self.available_renderers
      {
        default: Renderers::Default,
        github: Renderers::GitHub,
      }
    end
  end
end
