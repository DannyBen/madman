require 'spec_helper'

describe Template do
  let(:content) { '<h1>SOME HTML</h1>' }
  subject { described_class.new 'lib/templates/template.html' }

  describe '#render' do
    it "stores @content" do
      subject.render content
      expect(subject.content).to eq content
    end

    it "returns full html" do
      expect(subject.render content).to match_fixture('template/hello')
    end
  end
end
