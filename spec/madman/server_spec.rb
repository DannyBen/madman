require 'spec_helper'

describe Server do
  before do 
    Server.options file: 'spec/fixtures/hello.md'
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

end