module Madman
  module Renderers
    class GitHub
      def self.render(text, opts={})
        self.client.markdown text
      end

      private

      def self.client
        Octokit::Client.new access_token: access_token
      end

      def self.access_token
        ENV['GITHUB_ACCESS_TOKEN'] or raise ArgumentError, "Please set GITHUB_ACCESS_TOKEN"
      end
    end
  end
end