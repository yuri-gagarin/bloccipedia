require 'rails_helper'

RSpec.describe Wiki, type: :model do
  before do
    @new_user = User.new(email: 'test@bloc.io', password: 'password')
    @new_user.skip_confirmation!
    @new_user.save!
  end

  let (:new_wiki) {@new_user.wikis.create!(tile: 'New Wiki', body: 'Description goes here', private: 'false', category: 'general', user_id: @new_user.id)}

  it { should belong_to(:user) }
  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:category) }


end
