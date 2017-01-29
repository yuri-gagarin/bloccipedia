require 'rails_helper'

RSpec.describe WikisController, type: :controller do

  before do
    @new_user = User.new(email: 'test@bloc.io', password: 'password')
    @new_user.skip_confirmation!
    @new_user.save!
  end

  let(:wiki) {@new_user.wikis.create!(title: 'New Wiki', body: 'Description goes here', private: false, category: 'general', user_id: @new_user.id)}

  context 'not signed in' do
    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #show" do
      it "redirects to sign in" do
        get :show, params: {id: wiki.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET #new" do
      it "redirects to sign in" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "POST #create" do
      it "redirects to sign in" do
        post :create, params: {title: 'New Wiki', body: 'Description goes here', private: false, category: 'general', user_id: @new_user.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET #edit" do
      it "redirects to sign in" do
        get :edit, params: {id: wiki.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "PUT #update" do
      it "redirects to sign in" do
        put :update, params: {id: wiki.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "DELETE #destroy" do
      it "redeirects to sign in" do
        delete :destroy, params: {id: wiki.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context 'signed in user' do
    before {sign_in(@new_user)}

    describe "GET index" do
      it "returns HTTP status success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET show" do
      it "returns HTTP status success" do
        get :show, params: {id: wiki.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the SHOW template" do
        get :show, params: {id: wiki.id}
        expect(response).to render_template(:show)
      end
    end

    describe "GET new" do
      it "returns HTTP status success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the NEW template" do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe "GET edit" do
      it "returns HTTP status success" do
        get :edit, params: {id: wiki.id}
        expect(response).to have_http_status(:success)
      end

      it "returns an instance for the wiki to be edited" do
        get :edit, params: {id: wiki.id}
        wiki_instance = assigns(:wiki)
        expect(wiki_instance.title).to eq(wiki.title)
      end

      it "renders the EDIT template" do
        get :edit, params: {id: wiki.id}
        expect(response).to render_template(:edit)
      end
    end

    describe "POST create" do
      it 'saves a new wiki to the database' do
        post :create, params: {wiki: {title: 'New Wiki', body: 'Some desciption here about the wiki', private: false, category: 'general', user_id: @new_user.id }}
        expect(response).to redirect_to(wikis_path)
      end

      it 'increases the number of wikis by one' do
        expect { post :create, wiki: {title: 'New Wiki', body: 'Some desciption here about the wiki', private: false, category: 'general', user_id: @new_user.id }}.to change(Wiki, :count).by(1)
      end

      it 'redirects to the wikis index page' do
        post :create, wiki: {title: 'New Wiki', body: 'Some desciption here about the wiki', private: false, category: 'general', user_id: @new_user.id }
        expect(response).to redirect_to(wikis_path)
      end
    end

    describe "PUT update" do
      it 'updates the wiki' do
        new_title = 'Updated Wiki'
        put :update, id: wiki.id, wiki: {title: new_title}
        wiki.reload
        expect(wiki.title).to eq(new_title)
      end

      it 'redirects to the wiki' do
        new_title = 'Updated Wiki'
        put :update, id: wiki.id, wiki: {title: new_title}
        expect(response).to redirect_to(wiki_path(wiki.id))
      end
    end

    describe 'DELETE destroy' do
      it 'deletes the wiki' do
        delete :destroy, id: wiki.id
        count = Wiki.where({id: wiki.id}).size
        expect(count).to eq(0)
      end

      it 'redirects to wikis index' do
        delete :destroy, id: wiki.id
        expect(response).to redirect_to(wikis_path)
      end
    end
  end
end
