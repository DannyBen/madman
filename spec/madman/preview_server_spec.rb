require 'spec_helper'

describe PreviewServer do
  before do 
    PreviewServer.set file: 'spec/fixtures/hello.md'
  end

  it "works" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to have_tag 'h1', text: "Hello Ace"
  end

  it "serves static assets from the same folder" do
    get '/static/icon.png'
    expect(last_response).to be_ok
    expect(last_response.content_type).to eq "image/png"
  end

  describe '/github' do
    it "creates a document with GitHub renderer" do
      expect_any_instance_of(Document).to receive(:render).and_return('<h1>ok</h1>')
      get '/github'
    end    
  end

end