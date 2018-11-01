class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to blogs_path
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @favorites_blogs = current_user.favorite_blogs
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :user_image_url, :password, :password_confirmation)
  end
end
