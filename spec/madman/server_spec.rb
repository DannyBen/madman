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

end