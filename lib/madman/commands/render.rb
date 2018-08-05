module Madman
  module Commands
    class Render < MisterBin::Command
      include Colsole

      help "Render markdown to HTML"

      usage "madman render FILE [--github --save OUTFILE]"
      usage "madman render (-h|--help)"

      option "--github", "Render using the GitHub API\nRequires setting the GITHUB_ACCESS_TOKEN environment variable"
      option "--save OUTFILE", "Save the output to a file"

      param "FILE", "The input markdown file"

      environment "GITHUB_ACCESS_TOKEN", "Your GitHub API access token\nGenerate one here: https://github.com/settings/tokens"

      example "madman render README.md"
      example "madman render README.md --github"
      example "madman render README.md --save out.html"

      def run(args)
        infile = args['FILE']
        outfile = args['--save']
        renderer = args['--github'] ? :github : :default

        doc = Madman::Document.from_file infile
        
        output = doc.render renderer

        if outfile
          File.write outfile, output    
          say "Saved !txtgrn!#{outfile}"
        else
          puts output
        end
      end

    end
  end
end

