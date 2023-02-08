require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    context 'when page is opened ' do
      it 'return a correct response' do
        get '/users/:id/posts'
        expect(response).to have_http_status(200)
        expect(response).to render_template(:index)
        expect(response.body).to include('List of users posts here')
      end
    end
  end

  describe 'GET /show' do
    context 'when the page is opened ' do
      it 'return a correct response' do
        get '/users/:id/posts/:id'
        expect(response).to have_http_status(200)
        expect(response).to render_template(:show)
        expect(response.body).to include('Details of a specific post of a user')
      end
    end
  end
end
