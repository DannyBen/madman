require 'mister_bin'
require 'madman/commands'

module Madman
  class CLI
    def self.runner
      runner = MisterBin::Runner.new version: Madman::VERSION

      runner.route 'nav',     to: Madman::Commands::Nav
      runner.route 'preview', to: Madman::Commands::Preview
      runner.route 'readme',  to: Madman::Commands::Readme
      runner.route 'render',  to: Madman::Commands::Render
      runner.route 'serve',   to: Madman::Commands::Serve

      runner
    end
  end

end
