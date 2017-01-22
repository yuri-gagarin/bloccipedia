class UsersController < ApplicationController
  def index
    @user = User.find(params[:id])
  end

  def delete
  end

  def destroy
  end
end
