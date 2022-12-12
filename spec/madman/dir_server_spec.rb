describe DirServer do
  before do
    described_class.set dir: 'spec/workspace'
  end

  it 'is successful' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to have_tag 'h1', text: 'Workspace Folder'
  end

  it 'serves static assets from the same folder' do
    get 'image.png'
    expect(last_response).to be_ok
    expect(last_response.content_type).to eq 'image/png'
  end

  context 'when requesting a folder' do
    it 'redirects to the trailing slash version' do
      get '/Folder'
      expect(last_response).to be_redirect
      expect(last_response.location).to eq 'http://example.org/Folder/'
    end

    it 'shows the README' do
      get '/Folder/'
      expect(last_response).to be_ok
      expect(last_response.body).to have_tag 'h1', text: 'INNER'
    end
  end

  context 'when requesting a file' do
    it 'is successful' do
      get '/Folder/File'
      expect(last_response).to be_ok
      expect(last_response.body).to have_tag 'h1', text: 'File'
    end
  end
end
