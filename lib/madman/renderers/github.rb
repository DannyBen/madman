module Madman
  module Renderers
    class Github
      def self.render(text, _opts = {})
        client.markdown text
      end

      def self.client
        Octokit::Client.new access_token: access_token
      end

      def self.access_token
        ENV['GITHUB_ACCESS_TOKEN'] or raise ArgumentError, 'Please set GITHUB_ACCESS_TOKEN'
      end
    end
  end
end
