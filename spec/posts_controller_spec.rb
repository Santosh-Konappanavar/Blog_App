require 'rails_helper'

RSpec.describe '/posts', type: :request do
  describe 'PostsConroller' do
    context 'GET index' do
      before(:example) do
        get '/users/1/posts'
      end

      it 'index action for successfully works' do
        expect(response).to be_successful
      end

      it 'correct template for render' do
        expect(response).to render_template(:index)
      end

      it 'render correct body placeholder text' do
        expect(response.body).to include('List of all posts')
      end
    end

    context 'GET show action' do
      before(:example) do
        get '/users/1/posts/1'
      end

      it 'show action render successfully' do
        expect(response).to have_http_status(:success)
      end

      it 'show action for correct render' do
        expect(response).to render_template(:show)
      end

      it 'correct placeholder for render' do
        expect(response.body).to include('Single post')
      end
    end
  end
end
