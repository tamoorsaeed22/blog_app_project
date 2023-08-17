require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) do
      # Perform the request to simulate visiting the page
      get '/users/1/posts'
    end

    it 'responds with 200 code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders index view' do
      # Make sure to check for the correct template name
      expect(response).to render_template('posts/index')
    end

    it 'renders correct content' do
      # Make sure to check for the expected content in the response body
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /show' do
    before(:example) do
      # Perform the request to simulate visiting the page
      get '/users/1/posts/2'
    end

    it 'responds with 200 code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders show view' do
      # Make sure to check for the correct template name
      expect(response).to render_template('posts/show')
    end

    it 'renders correct content' do
      # Make sure to check for the expected content in the response body
      expect(response.body).to include('Details of a post for a given user')
    end
  end
end
