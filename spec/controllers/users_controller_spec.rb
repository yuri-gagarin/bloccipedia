require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before do
    @new_user = User.new(email: 'test@bloc.io', password: 'password', access_level: 0)
    @new_user.skip_confirmation!
    @new_user.save!

    @admin = User.new(email: 'admin@bloc.io', password: 'admintest', access_level: 2)
    @admin.skip_confirmation!
    @admin.save!
  end

  context 'not admin' do
    before {sign_in(@new_user)}

    describe "GET #index" do
      it "returns http redirect" do
        get :index
        expect(response).to have_http_status(302)
      end
    end
  end

  context 'admin user' do
    before {sign_in(@admin)}

    describe "GET #index" do
      it 'returns htts status success' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

end
