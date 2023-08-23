require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users' }

    it 'responds with code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders users list view' do
      expect(response).to render_template(:index)
    end

    it 'shows correct content in the view' do
      expect(response.body).to include('<h1 class="users-title">Welcome to Users page</h1>')
      expect(response.body).to include('<li class="card flex hover">')
      expect(response.body).to include('<div class="user-data border">')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/1' }

    it 'responds with code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders users list view' do
      expect(response).to render_template(:show)
    end

    it 'shows correct content in the view' do
      expect(response.body).to include('<div class="card flex">')
      expect(response.body).to include('<h1>Tom</h1>')
      expect(response.body).to include('Number of posts: 6')
    end
  end
end
