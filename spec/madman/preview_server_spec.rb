describe PreviewServer do
  before do
    described_class.set file: 'spec/fixtures/hello.md'
  end

  it 'is successful' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to have_tag 'h1', text: 'Hello Ace'
  end

  it 'serves static assets from the same folder' do
    get '/static/icon.png'
    expect(last_response).to be_ok
    expect(last_response.content_type).to eq 'image/png'
  end

  describe '/github' do
    it 'creates a document with GitHub renderer' do
      allow_any_instance_of(Document).to receive(:render).with(:github).and_return('<h1>ok</h1>')
      get '/github'
      expect(last_response).to be_ok
    end
  end
end
