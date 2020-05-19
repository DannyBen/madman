require 'spec_helper'

describe Renderers::GitHub do
  subject { described_class }

  describe '::render' do
    it 'calls Octokit::Client#markdown' do
      expect_any_instance_of(Octokit::Client).to receive(:markdown)
      with_env 'GITHUB_ACCESS_TOKEN', 'anything' do
        subject.render '# hello world'
      end
    end

    it 'returns HTML', if: ENV['GITHUB_ACCESS_TOKEN'] do
      expect(subject.render '# hello world').to match_approval('renderer/github')
    end

    context "when GITHUB_ACCESS_TOKEN is unset" do
      it 'raises ArgumentError' do
        without_env 'GITHUB_ACCESS_TOKEN' do
          expect{ subject.render '# hello world' }.to raise_error(ArgumentError, "Please set GITHUB_ACCESS_TOKEN")
        end
      end
    end
  end
end
