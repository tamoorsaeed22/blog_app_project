require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/1/posts' }

    it 'responds with 200 code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders index view' do
      expect(response).to render_template(:index)
    end

    it 'renders correct content' do
      expect(response.body).to include('<h1>List of all posts for Tom</h1>')
      expect(response.body).to include('<h2>Hello</h2>')
      expect(response.body).to include('This is my Third post')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/1/posts/2' }

    it 'responds with 200 code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders show view' do
      expect(response).to render_template(:show)
    end

    it 'renders correct content' do
      expect(response.body).to include('<h2>Hello World</h2>')
      expect(response.body).to include('This is my second post')
    end
  end
end
