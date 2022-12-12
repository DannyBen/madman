require 'madman/renderers/default'
require 'madman/renderers/github'
require 'madman/renderers/yaml'

module Madman
  module Renderers
    def self.available_renderers
      {
        default: Renderers::Default,
        yaml:    Renderers::YAML,
        github:  Renderers::Github,
      }
    end
  end
end
