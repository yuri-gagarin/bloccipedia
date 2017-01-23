class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def delete
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:notice] = "The user '#{@user.email}' has been successfully deleted"
      redirect_to(users_path)
    else
      flash.now[:alert] = "Error in deleting the user"
      render :show
    end
  end
end
