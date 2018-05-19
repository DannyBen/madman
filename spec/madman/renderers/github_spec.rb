require 'spec_helper'

describe Renderers::GitHub do
  subject { described_class }

  describe '::render' do
    it 'calls Octokit::Client#markdown' do
      expect_any_instance_of(Octokit::Client).to receive(:markdown)
      subject.render '# hello world'
    end

    it 'returns HTML', if: ENV['GITHUB_ACCESS_TOKEN'] do
      expect(subject.render '# hello world').to match_fixture('renderer/github')
    end
  end
end
