require 'rails_helper'

RSpec.describe '/users', type: :request do
  describe 'UsersController' do
    context 'GET index' do
      before(:example) do
        get '/users'
      end

      it 'index action successfully solved' do
        expect(response).to have_http_status(:success)
      end

      it 'index action successfully rendered' do
        expect(response).to render_template(:index)
      end

      it 'index action for text html body' do
        expect(response.body).to include('List of all users')
      end
    end

    context 'GET show' do
      before(:example) do
        get '/users/1'
      end

      it 'show action success' do
        expect(response).to have_http_status(:success)
      end

      it 'show action for render' do
        expect(response).to render_template(:show)
      end

      it 'correct body placeholder for render' do
        expect(response.body).to include('Single user')
      end
    end
  end
end
