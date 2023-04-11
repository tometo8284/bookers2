class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :is_matching_login_user, only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end



private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
      unless user.id == current_user.id
        redirect_to '/'
      end
  end
end
