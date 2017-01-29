require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @new_user = User.new(email: 'test@bloc.io', password: 'password')
    @new_user.skip_confirmation!
    @new_user.save!
  end

  it {is_expected.to have_many(:wikis)}

  describe "attributes" do
    it "should have email and password attributes" do
      expect(@new_user).to have_attributes(email: @new_user.email, password: @new_user.password)
    end

    it "responds to role" do
      expect(@new_user).to respond_to(:access_level)
    end

    it "responds to admin?" do
      expect(@new_user).to respond_to(:admin?)
    end

    it "responds to standard?" do
      expect(@new_user).to respond_to(:standard?)
    end

    it "respond to premium?" do
      expect(@new_user).to respond_to(:premium?)
    end
  end

  describe "default access_level" do
    it "should be #standard by default" do
      expect(@new_user.standard?).to be(true)
    end

    it "should not be #admin" do
      expect(@new_user.admin?).to be(false)
    end

    it "should not be #premium" do
      expect(@new_user.premium?).to be(false)
    end
  end

end
