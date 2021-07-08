class UsersController < ApplicationController
  def show
    @book = Book.new
    @user_book = Book.where(user_id:params[:id])
    @user = User.find(params[:id])
  end



  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name,:image,:introduction)
  end
end
