require 'rails_helper'

RSpec.describe User, type: :model do
let (:new_user) {User.new(email: 'test@bloc.io', encrypted_password: 'password')}

  describe 'user#create' do
    it 'should create a new user' do
        first_user = User.create(email: 'test@bloc.io', encrypted_password: 'password')
        # expect(User.count to increase by 1)
    end
  end
end
