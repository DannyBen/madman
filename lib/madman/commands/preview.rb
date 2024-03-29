module Madman
  module Commands
    class Preview < MisterBin::Command
      include Colsole

      summary 'Serve a markdown or YAML file using a local server'

      help <<~USAGE
        This command will start a local server with two endpoints:
          /         will render the markdown with the default renderer
          /github   will render with the GitHub API
      USAGE

      usage 'madman preview FILE [--port N --bind ADDRESS]'
      usage 'madman preview (-h|--help)'

      option '-p --port N', 'Set server port [default: 3000]'
      option '-b --bind ADDRESS', 'Set server listen address [default: 0.0.0.0]'

      param 'FILE', 'The input markdown or YAML file'

      environment 'GITHUB_ACCESS_TOKEN',
        "Your GitHub API access token\nRequired only if you wish to use the '/github' endpoint\nGenerate one here: https://github.com/settings/tokens"

      example 'madman preview README.md'
      example 'madman preview README.md -p4000'
      example 'madman preview file.yml'

      def run
        file = args['FILE']
        port = args['--port']
        bind = args['--bind']

        say "Starting server at bu`localhost:#{port}`"
        if ENV['GITHUB_ACCESS_TOKEN']
          say "To view the GitHub API version go to bu`localhost:#{port}/github`"
        end
        say ''

        Madman::PreviewServer.set bind: bind, port: port, file: file
        Madman::PreviewServer.run!
      end
    end
  end
end
