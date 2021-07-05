class UsersController < ApplicationController
  def show
    @book = Book.new
    @user_book = Book.where(user_id:params[:id])
  end

  def index
  end

  def edit
    @user = User.new
  end

  def update
    @user = User.new(user_params)
    @user.save
    redirect_to books_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:image,:introduction)
  end
end
