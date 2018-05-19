require 'spec_helper'

describe Renderers::Default do
  subject { described_class }

  describe '::render' do
    it 'returns HTML' do
      expect(subject.render '# hello world').to match_fixture('renderer/default')
    end
  end
end
