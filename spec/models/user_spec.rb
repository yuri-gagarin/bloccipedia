require 'rails_helper'

RSpec.describe User, type: :model do
  let (:new_user) {User.create!(email: 'test@bloc.io', password: 'password')}
  before {new_user.confirm}

  it {is_expected.to have_many(:wikis)}

  describe "attributes" do
    it "should have email and password attributes" do
      expect(:new_user).to have_attributes(email: new_user.email, encrypted_password: new_user.encrypted_password)
    end

    it "responds to role" do
      expect(new_user).to respond_to(:role)
    end

    it "responds to admin?" do
      expect(new_user).to respond_to(:admin?)
    end

    it "responds to standard?" do
      expect(new_user).to respond_to(:standard?)
    end

    it "respond to premium?" do
      expect(new_user).to respond_to(:premium?)
    end
  end

end
